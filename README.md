# Lapor Maling API

API server untuk aplikasi pelaporan berbasis Node.js, Express, MySQL, dan Firebase FCM.

## Struktur File Penting

- **main.js**  
  File utama backend Express API, WebSocket, Socket.IO, autentikasi JWT, login, FCM, dsb. Semua endpoint utama ada di sini.

- **package.json**  
  Daftar dependencies dan script npm.

- **kkn-simokerto-firebase-adminsdk-fbsvc-db7195739e.json**  
  Service account Firebase untuk admin (jangan dishare ke publik).

- **warga-firebase-adminsdk-placeholder.json**  
  Service account Firebase untuk user (jangan dishare ke publik).

- **db_export.sql, lapor_maling_backup.sql, jenis_laporan_master.sql, reports_userid_varchar.sql**  
  File backup/struktur database MySQL. 
  - **db_export.sql**: backup utama.
  - **lapor_maling_backup.sql**: backup tambahan.
  - **jenis_laporan_master.sql**: master jenis laporan.
  - **reports_userid_varchar.sql**: contoh struktur reports dengan user_id varchar.

- **sirine.js**  
  Script terpisah untuk kendali sirine (jika ada, opsional).

- **socket_esp32.cpp**  
  Contoh kode untuk device IoT/ESP32 (bukan bagian backend utama).

## Cara Menjalankan

1. **Install dependencies**
   ```bash
   npm install
   ```

2. **Siapkan file .env**
   Contoh isi:
   ```env
   DB_HOST=localhost
   DB_USER=root
   DB_PASS=yourpassword
   DB_NAME=lapor_maling
   JWT_SECRET=your_secret_key
   PORT=3000
   ```

3. **Import database**
   Gunakan salah satu file SQL di atas ke MySQL Anda.

4. **Jalankan server**
   ```bash
   node main.js
   ```

## Endpoint Utama

- `/login` — Login user/admin
- `/logout` — Logout
- `/profile` — Info profil
- `/report` — Kirim laporan
- `/reports/all` — Semua laporan (admin)
- `/admin/fcm-token` — Register FCM token admin
- `/user/fcm-token` — Register FCM token user
- `/jenis-laporan` — Master jenis laporan

## Catatan
- Semua logic utama ada di `main.js`.
- File selain di atas hanya pelengkap, contoh, atau backup.
- Jangan upload file .json service account ke publik!
- Untuk pengembangan IoT, lihat `socket_esp32.cpp`.

## Kontak
Hubungi pengelola repo untuk pertanyaan lebih lanjut.
