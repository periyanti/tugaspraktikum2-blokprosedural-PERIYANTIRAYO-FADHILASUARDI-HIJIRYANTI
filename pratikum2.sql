-- =========================================
-- TUGAS PRAKTIKUM BLOK PROSEDURAL
-- Studi Kasus Validasi Data Akademik Mahasiswa
-- =========================================

-- =========================
-- BAGIAN A – IDENTITAS
-- =========================
DROP PROCEDURE IF EXISTS bagianA;

DELIMITER //

CREATE PROCEDURE bagianA()
BEGIN
    DECLARE nama VARCHAR(50) DEFAULT 'Fadhila';
    DECLARE nim VARCHAR(20) DEFAULT '2411018';
    DECLARE semester INT DEFAULT 4;
    DECLARE prodi VARCHAR(50) DEFAULT 'Informatika';
    DECLARE kampus VARCHAR(100) DEFAULT 'Universitas Mega Buana Palopo';

    SELECT CONCAT(
        'Mahasiswa ', nama, ' (', nim, ') dari Program Studi ',
        prodi, ' terdaftar di ', kampus,
        ' pada semester ', semester, '.'
    ) AS Output;
END //

DELIMITER ;

-- =========================
-- BAGIAN B – VALIDASI DATA
-- =========================
DROP PROCEDURE IF EXISTS bagianB;

DELIMITER //

CREATE PROCEDURE bagianB()
BEGIN
    DECLARE v_sks INT DEFAULT 15;
    DECLARE v_ipk DECIMAL(3,2) DEFAULT 3.20;
    DECLARE v_semester INT DEFAULT 4;
    DECLARE v_pembayaran VARCHAR(10) DEFAULT 'LUNAS';

    DECLARE v_status VARCHAR(20);
    DECLARE v_beban VARCHAR(20);
    DECLARE v_performa VARCHAR(30);

    -- Validasi
    IF v_pembayaran = 'LUNAS' AND v_sks > 0 AND v_semester > 0 THEN
        SET v_status = 'Valid';
    ELSE
        SET v_status = 'Tidak Valid';
    END IF;

    -- Beban studi
    IF v_sks BETWEEN 1 AND 12 THEN
        SET v_beban = 'Ringan';
    ELSEIF v_sks BETWEEN 13 AND 18 THEN
        SET v_beban = 'Sedang';
    ELSE
        SET v_beban = 'Padat';
    END IF;

    -- Performa akademik
    IF v_ipk >= 3.50 THEN
        SET v_performa = 'Sangat Baik';
    ELSEIF v_ipk >= 3.00 THEN
        SET v_performa = 'Baik';
    ELSEIF v_ipk >= 2.50 THEN
        SET v_performa = 'Cukup';
    ELSE
        SET v_performa = 'Perlu Pembinaan';
    END IF;

    SELECT 
        v_status AS Status_Data,
        v_beban AS Beban_Studi,
        v_performa AS Performa_Akademik;
END //

DELIMITER ;

-- =========================
-- BAGIAN C – KELAYAKAN KRS
-- =========================
DROP PROCEDURE IF EXISTS bagianC;

DELIMITER $$

CREATE PROCEDURE bagianC()
BEGIN
    DECLARE v_nama VARCHAR(50) DEFAULT 'Fadhila';
    DECLARE v_nim VARCHAR(20) DEFAULT '2411018';
    DECLARE v_semester INT DEFAULT 4;

    DECLARE v_sks INT DEFAULT 15;
    DECLARE v_ipk DECIMAL(3,2) DEFAULT 3.20;
    DECLARE v_pembayaran VARCHAR(15) DEFAULT 'LUNAS';

    DECLARE v_status VARCHAR(20);
    DECLARE v_beban VARCHAR(20);
    DECLARE v_performa VARCHAR(30);
    DECLARE v_kelayakan VARCHAR(20);
    DECLARE v_alasan VARCHAR(100);

    -- Validasi
    IF v_pembayaran = 'LUNAS' AND v_sks > 0 AND v_semester > 0 THEN
        SET v_status = 'Valid';
        SET v_kelayakan = 'LAYAK';
        SET v_alasan = 'Semua syarat terpenuhi';
    ELSE
        SET v_status = 'Tidak Valid';
        SET v_kelayakan = 'TIDAK LAYAK';

        IF v_pembayaran <> 'LUNAS' THEN
            SET v_alasan = 'Pembayaran UKT belum lunas';
        ELSEIF v_sks <= 0 THEN
            SET v_alasan = 'Jumlah SKS tidak memenuhi syarat';
        ELSE
            SET v_alasan = 'Semester tidak valid';
        END IF;
    END IF;

    -- Beban studi
    IF v_sks BETWEEN 1 AND 12 THEN
        SET v_beban = 'Ringan';
    ELSEIF v_sks BETWEEN 13 AND 18 THEN
        SET v_beban = 'Sedang';
    ELSE
        SET v_beban = 'Padat';
    END IF;

    -- Performa
    IF v_ipk >= 3.50 THEN
        SET v_performa = 'Sangat Baik';
    ELSEIF v_ipk >= 3.00 THEN
        SET v_performa = 'Baik';
    ELSEIF v_ipk >= 2.50 THEN
        SET v_performa = 'Cukup';
    ELSE
        SET v_performa = 'Perlu Pembinaan';
    END IF;

    SELECT CONCAT(
        'Mahasiswa ', v_nama, ' (NIM ', v_nim, ') dinyatakan ',
        v_kelayakan, ' mengambil KRS. ',
        'Beban studi: ', v_beban, ', ',
        'Performa: ', v_performa, '. ',
        'Alasan: ', v_alasan, '.'
    ) AS hasil;
END$$

DELIMITER ;

-- =========================
-- BAGIAN D – PERBANDINGAN
-- =========================
DROP PROCEDURE IF EXISTS bagianD;

DELIMITER //

CREATE PROCEDURE bagianD()
BEGIN
    DECLARE nama1 VARCHAR(50) DEFAULT 'Periyanti';
    DECLARE nim1 VARCHAR(20) DEFAULT '2411006';
    DECLARE ipk1 DECIMAL(3,2) DEFAULT 3.20;
    DECLARE sks1 INT DEFAULT 15;

    DECLARE nama2 VARCHAR(50) DEFAULT 'Hijryanti';
    DECLARE nim2 VARCHAR(20) DEFAULT '2411015';
    DECLARE ipk2 DECIMAL(3,2) DEFAULT 3.60;
    DECLARE sks2 INT DEFAULT 18;

    DECLARE hasil VARCHAR(100);

    IF ipk1 > ipk2 THEN
        SET hasil = CONCAT('Mahasiswa ', nama1, ' lebih baik dari ', nama2);
    ELSEIF ipk2 > ipk1 THEN
        SET hasil = CONCAT('Mahasiswa ', nama2, ' lebih baik dari ', nama1);
    ELSE
        IF sks1 > sks2 THEN
            SET hasil = CONCAT('Mahasiswa ', nama1, ' lebih baik dari ', nama2);
        ELSEIF sks2 > sks1 THEN
            SET hasil = CONCAT('Mahasiswa ', nama2, ' lebih baik dari ', nama1);
        ELSE
            SET hasil = 'Kedua mahasiswa memiliki performa yang sama';
        END IF;
    END IF;

    SELECT 
        CONCAT('Mahasiswa 1: ', nama1, ' (NIM ', nim1, ', IPK ', ipk1, ', SKS ', sks1, ')') AS Mhs1,
        CONCAT('Mahasiswa 2: ', nama2, ' (NIM ', nim2, ', IPK ', ipk2, ', SKS ', sks2, ')') AS Mhs2,
        hasil AS Kesimpulan;
END //

DELIMITER ;

-- =========================
-- EKSEKUSI (UNTUK SCREENSHOT)
-- =========================
CALL bagianA;
CALL bagianB;
CALL bagianC;
CALL bagianD;
