-- Tabel master jenis laporan
CREATE TABLE IF NOT EXISTS jenis_laporan_master (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Isi data utama
INSERT INTO jenis_laporan_master (nama) VALUES ('kebakaran'), ('kemalingan'), ('tawuran');
