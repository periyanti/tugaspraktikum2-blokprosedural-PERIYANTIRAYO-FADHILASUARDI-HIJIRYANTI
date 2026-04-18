# tugaspraktikum2-blokprosedural-PERIYANTIRAYO-FADHILASUARDI-HIJIRYANTI

# 📘 README.md

## Tugas Praktikum Blok Prosedural

### Studi Kasus: Validasi Data Akademik Mahasiswa

Nama Kelompok:
Periyanti Rayo  IK2411006
Hijryanti       IK2411015
Fadhila Suardi  IK2411018

## 🧾 Deskripsi

Project ini merupakan implementasi **Stored Procedure** pada MySQL/MariaDB untuk melakukan simulasi pengolahan dan validasi data akademik mahasiswa.
Terdapat 4 bagian utama yang mencakup identitas, validasi data, kelayakan KRS, dan perbandingan performa mahasiswa.

---

## 🧩 Struktur Program

### 🔹 Bagian A – Identitas Mahasiswa

Procedure: `bagianA`

Menampilkan informasi dasar mahasiswa berupa:

* Nama
* NIM
* Program Studi
* Kampus
* Semester

**Output:**
Kalimat deskriptif identitas mahasiswa.

---

### 🔹 Bagian B – Validasi Data Akademik

Procedure: `bagianB`

Melakukan pengecekan terhadap:

* Status pembayaran (LUNAS / tidak)
* Jumlah SKS
* Semester
* IPK

**Hasil Validasi:**

* Status Data (Valid / Tidak Valid)
* Beban Studi (Ringan / Sedang / Padat)
* Performa Akademik (Sangat Baik / Baik / Cukup / Perlu Pembinaan)

---

### 🔹 Bagian C – Kelayakan Pengambilan KRS

Procedure: `bagianC`

Menentukan apakah mahasiswa:

* Layak atau tidak mengambil KRS
* Menampilkan alasan keputusan

**Output:**
Kalimat lengkap berisi:

* Status kelayakan
* Beban studi
* Performa akademik
* Alasan keputusan

---

### 🔹 Bagian D – Perbandingan Mahasiswa

Procedure: `bagianD`

Membandingkan dua mahasiswa berdasarkan:

* IPK (prioritas utama)
* SKS (jika IPK sama)

**Output:**

* Data masing-masing mahasiswa
* Kesimpulan siapa yang lebih unggul

---

## ⚙️ Cara Menjalankan

### 1. Import / Jalankan Script SQL

Jalankan seluruh script di MySQL atau MariaDB melalui:

* phpMyAdmin
* MySQL Workbench
* Command Line

---

### 2. Eksekusi Procedure

Gunakan perintah berikut:

```sql
CALL bagianA;
CALL bagianB;
CALL bagianC;
CALL bagianD;
```

---

## 🖼️ Kebutuhan Screenshot (Laporan)

Untuk keperluan laporan praktikum, ambil screenshot:

1. Hasil `CALL bagianA`
2. Hasil `CALL bagianB`
3. Hasil `CALL bagianC`
4. Hasil `CALL bagianD`

Pastikan:

* Nama database terlihat
* Query dan hasil output terlihat jelas


 📌 Catatan Penting

* Gunakan `DELIMITER` dengan benar saat membuat procedure
* Jalankan `DROP PROCEDURE IF EXISTS` sebelum membuat ulang
* Pastikan tidak ada error syntax sebelum eksekusi


 🎯 Tujuan Pembelajaran

Melalui praktikum ini, diharapkan:

* Memahami penggunaan **Stored Procedure**
* Menguasai **percabangan (IF, ELSEIF, ELSE)**
* Mampu melakukan **validasi data sederhana**
* Mengimplementasikan logika keputusan dalam database



## ✅ Kesimpulan

Program ini berhasil mensimulasikan sistem sederhana untuk:

* Validasi akademik mahasiswa
* Penentuan kelayakan KRS
* Analisis performa mahasiswa

Semua logika diproses langsung di dalam database menggunakan prosedur terstruktur.

---
