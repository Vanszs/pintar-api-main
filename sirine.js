// iot_client.js
const io = require('socket.io-client');
const { exec, execSync } = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');

// Konfigurasi
const SERVER_URL = process.env.SERVER_URL || 'http://185.197.195.155:3000/iot';
const SIREN_PATH = path.join(__dirname, 'sirine.mp3');

// Deteksi platform - Windows vs Linux (Raspberry Pi)
const isWindows = os.platform() === 'win32';
console.log(`Detected platform: ${isWindows ? 'Windows' : 'Linux/Raspberry Pi'}`);

// Cek dan siapkan file sirine
function checkSirineFile() {
  console.log('Checking sirine file:', SIREN_PATH);
  if (!fs.existsSync(SIREN_PATH)) {
    console.error(`❌ SIRINE FILE NOT FOUND: ${SIREN_PATH}`);
    console.log('Please download a sirine.mp3 file and place it in the application directory.');
    console.log('You can download a sample sirine from: https://github.com/CONTOHSAJA/sirine-samples/raw/main/sirine.mp3');
    
    // Buat file dummy jika tidak ada
    fs.writeFileSync(SIREN_PATH, 'DUMMY FILE - PLEASE REPLACE WITH ACTUAL SIRINE.MP3', 'utf8');
    console.log('Created a dummy file as placeholder. Please replace it with a real MP3.');
  } else {
    const stats = fs.statSync(SIREN_PATH);
    if (stats.size < 10000) {
      console.warn('⚠️ WARNING: Sirine file seems too small! It may be corrupt or empty.');
    } else {
      console.log('✅ Sirine file exists:', Math.round(stats.size/1024), 'KB');
    }
  }
}

// Cek ketersediaan alat audio
function checkAudioTools() {
  console.log('Checking audio tools...');
  
  if (isWindows) {
    // Cek suara bahasa Indonesia di Windows
    console.log('Using PowerShell for audio playback on Windows');
    try {
      const voices = execSync('powershell -c "Add-Type -AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).GetInstalledVoices() | % {$_.VoiceInfo} | Select-Object Name, Culture | Format-List"').toString();
      console.log('Available voices:');
      console.log(voices);
      if (voices.toLowerCase().includes('indonesia') || voices.toLowerCase().includes('id-id')) {
        console.log('✅ Indonesian voice found!');
      } else {
        console.log('⚠️ No Indonesian voice found. Will use default voice.');
      }
    } catch (e) {
      console.warn('⚠️ Could not enumerate speech voices:', e.message);
    }
  } else {
    // Linux/Raspberry Pi: Periksa mpg123, aplay, dan espeak
    try {
      execSync('which mpg123');
      console.log('✅ mpg123 found');
    } catch (e) {
      console.warn('⚠️ mpg123 not found. Install with: sudo apt-get install mpg123');
    }
    
    try {
      execSync('which aplay');
      console.log('✅ aplay found');
    } catch (e) {
      console.warn('⚠️ aplay not found. Install with: sudo apt-get install alsa-utils');
    }
    
    try {
      execSync('which espeak');
      console.log('✅ espeak found');
    } catch (e) {
      console.warn('⚠️ espeak not found. Install with: sudo apt-get install espeak');
    }
  }
}

// Fungsi untuk memutar file MP3
function playSound(filePath, callback) {
  console.log(`Playing sound: ${filePath}`);
  
  // Verifikasi file
  if (!fs.existsSync(filePath)) {
    console.error(`❌ File not found: ${filePath}`);
    return callback(new Error('File not found'));
  }
  
  if (isWindows) {
    // Windows: Gunakan PowerShell MediaPlayer yang menunggu hingga pemutaran selesai
    const psScript = `
      Add-Type -AssemblyName PresentationCore;
      Add-Type -AssemblyName WindowsBase;
      
      $mediaPlayer = New-Object System.Windows.Media.MediaPlayer;
      $mediaPlayer.Open([System.Uri]::new([System.IO.Path]::GetFullPath("${filePath.replace(/\\/g, '\\\\')}")));
      $mediaPlayer.Play();
      
      # Wait for media to load
      while ($mediaPlayer.NaturalDuration.TimeSpan.TotalMilliseconds -lt 1) {
        Start-Sleep -m 100;
      }
      
      # Tunggu hingga selesai
      $duration = $mediaPlayer.NaturalDuration.TimeSpan.TotalSeconds;
      Write-Host "Playing sirine, duration: $duration seconds";
      Start-Sleep -Seconds ([Math]::Ceiling($duration));
      
      $mediaPlayer.Close();
    `;
    
    // Simpan script ke file untuk menghindari masalah escape
    const tempScriptPath = path.join(os.tmpdir(), `siren_play_${Date.now()}.ps1`);
    fs.writeFileSync(tempScriptPath, psScript);
    
    // Jalankan script PowerShell (blocking) untuk memastikan pemutaran lengkap
    console.log("🔊 Starting sirine playback...");
    exec(`powershell -ExecutionPolicy Bypass -File "${tempScriptPath}"`, (error, stdout, stderr) => {
      try {
        fs.unlinkSync(tempScriptPath);
      } catch (e) {}
      
      if (error) {
        console.log('⚠️ Media Player failed, trying SoundPlayer as fallback...');
        // Fallback ke SoundPlayer yang lebih andal
        exec(`powershell -c "$player = New-Object Media.SoundPlayer '${filePath.replace(/'/g, "''")}'; $player.PlaySync()"`, (fallbackErr) => {
          if (fallbackErr) {
            console.error('❌ All audio playback methods failed:', fallbackErr);
            return callback(fallbackErr);
          }
          console.log("✅ Sirine playback completed (fallback method)");
          callback(null);
        });
      } else {
        if (stdout) console.log(stdout.trim());
        console.log("✅ Sirine playback completed");
        callback(null);
      }
    });
  } else {
    // Linux/Raspberry Pi: mpg123 already waits for completion
    exec(`mpg123 -q --gain 100 "${filePath}"`, (error) => {
      if (error) {
        console.log('⚠️ mpg123 failed, trying aplay...');
        // Fallback ke aplay
        exec(`aplay -q "${filePath}"`, (err) => {
          if (err) {
            console.error('❌ Both mpg123 and aplay failed');
            return callback(err);
          }
          callback(null);
        });
      } else {
        callback(null);
      }
    });
  }
}

// Fungsi untuk TTS
function speak(text, callback) {
  console.log(`Speaking: ${text}`);
  
  if (isWindows) {
    // Perbaiki TTS untuk Windows agar lebih andal
    // Simpan script ke file untuk menghindari masalah escape
    const tempScriptPath = path.join(os.tmpdir(), `tts_script_${Date.now()}.ps1`);
    const psScript = `
      Add-Type -AssemblyName System.Speech;
      $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer;
      
      # Tampilkan semua suara yang tersedia untuk debugging
      Write-Host "Available voices:";
      $speak.GetInstalledVoices() | ForEach-Object { Write-Host $_.VoiceInfo.Name "(" $_.VoiceInfo.Culture.Name ")" };
      
      # Coba temukan suara Indonesia atau Microsoft Andika
      $voices = $speak.GetInstalledVoices() | Where-Object { 
        ($_.VoiceInfo.Culture.Name -like '*id*') -or
        ($_.VoiceInfo.Name -like '*Andika*') -or
        ($_.VoiceInfo.Name -like '*Indonesia*')
      };
      
      if ($voices.Count -gt 0) {
        $voice = $voices[0].VoiceInfo.Name;
        Write-Host "Menggunakan suara: $voice";
        $speak.SelectVoice($voice);
      }
      else {
        Write-Host "Tidak menemukan suara Indonesia, menggunakan default dengan penyesuaian";
        $speak.Rate = -3; # Sangat lambat
      }
      
      # Sesuaikan pengucapan untuk bahasa Indonesia
      $text = "${text.replace(/'/g, "''")}";
      
      # Jeda untuk pastikan sistem siap
      Start-Sleep -Milliseconds 500;
      
      # Sesuaikan volume suara
      $speak.Volume = 100;
      
      # Coba bicara dengan lebih keras dan jelas
      Write-Host "Mulai bicara: $text";
      $speak.Speak($text);
      Write-Host "Selesai bicara";
    `;
    
    fs.writeFileSync(tempScriptPath, psScript);
    
    console.log("🔊 Starting TTS with PowerShell...");
    exec(`powershell -ExecutionPolicy Bypass -File "${tempScriptPath}"`, (error, stdout) => {
      try { fs.unlinkSync(tempScriptPath); } catch(e) {}
      
      if (error || stdout.includes("Exception")) {
        console.log('⚠️ PowerShell TTS error:', error);
        console.log('⚠️ Trying alternative method...');
        
        // Metode alternatif: Gunakan SAPI langsung
        const sapiScript = `
          Set voice = CreateObject("SAPI.SpVoice")
          voice.Volume = 100
          voice.Rate = -1
          voice.Speak "${text.replace(/"/g, '""')}"
          WScript.Sleep 500
        `;
        
        const vbsPath = path.join(os.tmpdir(), `tts_fallback_${Date.now()}.vbs`);
        fs.writeFileSync(vbsPath, sapiScript);
        
        exec(`cscript //nologo "${vbsPath}"`, (err2) => {
          try { fs.unlinkSync(vbsPath); } catch(e) {}
          
          if (err2) {
            console.error('❌ All TTS methods failed:', err2);
            return callback(err2);
          }
          
          console.log("✅ TTS completed (fallback method)");
          callback(null);
        });
      } else {
        console.log("Output TTS:", stdout);
        console.log("✅ TTS completed successfully");
        callback(null);
      }
    });
  } else {
    // Linux - menggunakan espeak dengan penyesuaian khusus untuk kata "perhatian"
    // Tambahkan jeda dan penekanan pada kata "perhatian"
    const enhancedText = text.replace("Perhatian", "Per-ha-ti-an");
    
    // -g 0 = mengurangi jeda, -s 120 = kecepatan bicara lebih lambat, -p 50 = nada bicara
    exec(`espeak -v id -a 200 -s 120 -p 50 -g 0 "${enhancedText.replace(/"/g, '\\"')}"`, (error) => {
      if (error) {
        console.error('❌ espeak failed:', error);
        return callback(error);
      }
      callback(null);
    });
  }
}

// Contoh regex: /RW\s*03/i, /RT\s*05/i, /RW\s*03\s*RT\s*05/i
const ADDRESS_REGEX_FILTERS = [
  // /RW\s*03/i,
  // /RT\s*05/i,
  // /RW\s*03\s*RT\s*05/i,
  // /Jl\. Melati/i, // contoh filter berdasarkan nama jalan
  /RW\s*3/i,
];

// ====================[ END SECTION FILTER RT/RW ]===================

// Periksa ketersediaan alat audio dan file sirine
checkAudioTools();
checkSirineFile();

console.log('Connecting to', SERVER_URL);
const socket = io(SERVER_URL, { transports: ['websocket'] });

socket.on('connect', () => {
  console.log('✅ Connected as IoT:', socket.id);
});

socket.on('connect_error', err => {
  console.error('❌ Connection failed:', err.message);
});

socket.on('disconnect', () => {
  console.log('Disconnected.');
});

socket.on('new_report', report => {
  console.log('\n🚨 NEW ALERT 🚨');
  console.log('Report details:', report);

  // Check isSirine parameter
  if (!report.isSirine) {
    console.log('⏩ Notifikasi diabaikan karena isSirine false.');
    return; // Ignore from the beginning if isSirine is false
  }

  // === FILTERING BERDASARKAN RT/RW/ALAMAT ===
  let allowed = true;
  if (ADDRESS_REGEX_FILTERS.length > 0) {
    allowed = ADDRESS_REGEX_FILTERS.some(rx => rx.test(report.address));
    if (!allowed) {
      console.log(`⏩ Notifikasi diabaikan karena tidak cocok filter RT/RW: "${report.address}"`);
      return;
    }
    console.log('✅ Alamat cocok filter, sirine & TTS akan diputar.');
  } else {
    console.log('⚠️ Tidak ada filter aktif, semua notifikasi akan diproses.');
  }
  // === END FILTERING ===

  const message = `Perhatian, laporan maling dari ${report.name} di alamat ${report.address}`;
  let cycles = 5;

  function cycle() {
    if (cycles-- <= 0) return console.log('All alert cycles completed.');
    console.log(`\n▶️ Alert cycle #${6 - cycles}`);

    // 1) Sirine
    playSound(SIREN_PATH, (err) => {
      if (err) console.error('❌ Sirine playback failed:', err);
      else console.log('✅ Sirine played successfully');

      // 2) TTS
      speak(message, (ttsErr) => {
        if (ttsErr) console.error('❌ TTS failed:', ttsErr);
        else console.log('✅ Voice announcement completed');

        // 3) Next cycle after a short delay
        setTimeout(cycle, 500);
      });
    });
  }

  // Mulai siklus pertama
  cycle();
});
