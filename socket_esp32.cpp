#include <ArduinoWebsockets.h>
#include <WiFi.h>
#include <ArduinoJson.h>
#include <regex> // Tambahkan jika menggunakan regex (ESP32 Arduino core >=2.0.5)

// --- KONFIGURASI ---
const char* SSID    = "Realme 7";
const char* PASS    = "AnggaMakan1";
const char* WS_SERVER = "ws://185.197.195.155:3000/ws";

const uint8_t SIREN_PIN = 12;
const uint8_t LED_PIN = 2;
// --- AKHIR KONFIGURASI ---

using namespace websockets;
WebsocketsClient client;

bool sirenActive = false;
unsigned long sirenStartTime = 0;
const long sirenDuration = 200; // 0.2 detik

unsigned long lastHeapCheck = 0;

bool matchesFilter(const String &addr) {
  String lowerCaseAddr = addr;
  lowerCaseAddr.toLowerCase();
  return lowerCaseAddr.indexOf("rw 3") >= 0 || lowerCaseAddr.indexOf("rw3") >= 0;
  // Jika ingin regex, gunakan library regex ESP32 atau manual parsing
}

void onMessageCallback(WebsocketsMessage message) {
  Serial.print("Got Message: ");
  Serial.println(message.data());

  // Parse JSON jika format sesuai
  DynamicJsonDocument doc(2048);
  DeserializationError error = deserializeJson(doc, message.data());
  if (error) {
    Serial.print("[JSON] Error: ");
    Serial.println(error.c_str());
    return;
  }

  // Cek event new_report
  if (doc.containsKey("jenis_laporan")) {
    bool isSirine      = doc["isSirine"] | false;
    const char* addr   = doc["address"]  | "N/A";
    const char* name   = doc["name"]     | "N/A";
    int reportId       = doc["id"]       | 0;

    Serial.println("\n🚨 --- LAPORAN BARU DITERIMA --- 🚨");
    Serial.printf("  ID Laporan : %d\n", reportId);
    Serial.printf("  Pelapor    : %s\n", name);
    Serial.printf("  Alamat     : %s\n", addr);
    Serial.printf("  Aktifkan Sirine: %s\n", isSirine ? "YA" : "TIDAK");

    if (isSirine && matchesFilter(addr)) {
      Serial.println("✅ Mengaktifkan sirine...");
      sirenActive = true;
      sirenStartTime = millis();
      digitalWrite(SIREN_PIN, LOW); // Relay ON (LOW)
    } else {
      Serial.println("⏩ Laporan tidak memenuhi kriteria.");
      // Optionally, ensure sirine is OFF
      digitalWrite(SIREN_PIN, HIGH); // Relay OFF (HIGH)
    }
    Serial.println("-------------------------------------\n");
  }
}

void onEventsCallback(WebsocketsEvent event, String data) {
  if(event == WebsocketsEvent::ConnectionOpened) {
    Serial.println("Connection Opened");
    digitalWrite(LED_PIN, HIGH);
  } else if(event == WebsocketsEvent::ConnectionClosed) {
    Serial.println("Connection Closed");
    digitalWrite(LED_PIN, LOW);
  } else if(event == WebsocketsEvent::GotPing) {
    Serial.println("Got a Ping!");
  } else if(event == WebsocketsEvent::GotPong) {
    Serial.println("Got a Pong!");
  }
}

void setup() {
  Serial.begin(115200);
  pinMode(SIREN_PIN, OUTPUT);
  pinMode(LED_PIN, OUTPUT);
  digitalWrite(SIREN_PIN, HIGH); // Relay OFF (HIGH) saat device baru menyala
  digitalWrite(LED_PIN, LOW);

  Serial.println("\n\n--- IoT Panic Button Client (WebSocket Mode) ---");

  Serial.printf("Menyambungkan ke WiFi: %s ", SSID);
  WiFi.begin(SSID, PASS);
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    digitalWrite(LED_PIN, !digitalRead(LED_PIN));
    delay(500);
  }
  Serial.printf("\nTerhubung! IP: %s\n\n", WiFi.localIP().toString().c_str());

  client.onMessage(onMessageCallback);
  client.onEvent(onEventsCallback);

  client.connect(WS_SERVER);

  // Kirim pesan ke server (opsional)
  client.send("Hi Server!");
  client.ping();
}

void loop() {
  client.poll();

  // Sirine non-blocking
  if (sirenActive && (millis() - sirenStartTime >= sirenDuration)) {
    sirenActive = false;
    digitalWrite(SIREN_PIN, HIGH); // Relay OFF (HIGH) setelah 0.2 detik
    Serial.println("✅ Sirine non-aktif.");
  }

  // Cek heap tiap 10 detik
  if (millis() - lastHeapCheck > 10000) {
    lastHeapCheck = millis();
    Serial.printf("[MEM] Free Heap: %u bytes\n", ESP.getFreeHeap());
  }

  // LED indikator jika terputus
  if (WiFi.status() != WL_CONNECTED || !client.available()) {
    digitalWrite(LED_PIN, !digitalRead(LED_PIN));
    delay(250);
    // Reconnect otomatis jika perlu
    if (WiFi.status() == WL_CONNECTED && !client.available()) {
      Serial.println("[WebSocket] Attempting reconnect...");
      client.connect(WS_SERVER);
    }
  }
}