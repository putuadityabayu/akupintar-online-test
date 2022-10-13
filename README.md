![test result](https://github.com/putuadityabayu/akupintar-online-test/actions/workflows/test.yml/badge.svg)

# akupintar-online-test

## Overview

akupintar-online-test merupakan server API implementasi online test dari [akupintar.id](https://akupintar.id) yang dibuat menggunakan NodeJS.

Fitur-fitur yang terdapat pada server API ini:
- Cari kampus
- Mengikuti dan berhenti mengikuti kampus
- List jurusan pada kampus

## Prasyarat

- NodeJS
- Mysql

## Instalasi

- Mengkloning repositori ini

    ```bash
    git clone https://github.com/putuadityabayu/akupintar-online-test.git

    cd akupintar-online-test
    ```

- Konfigurasi Mysql

    ***NOTE: Data msyql yang terdapat pada repositori ini tidak benar dan hanya contoh yang digunakan untuk keperluan development***

    Pastikan server mysql sudah terinstall pada perangkat. Langkah-langkah untuk mengkonfigurasi mysql: 

    1. Membuat database baru. Dapat menggunakan mysql workbench ataupun menggunakan terminal

        ```bash
        DB_USER="MYSQL USER"
        DB_PASS="PASSWORD MYSQL"
        DB_DATABASE="NAMA DATABASE YANG AKAN DIBUAT"
        SQL_STRING="CREATE DATABASE IF NOT EXISTS $DB_DATABASE;"

        mysql -u$DB_USER -p$DB_PASS -e "$SQL_STRING"
        ```

    2. Import struktur dan contoh data ke dalam database

        ```bash
        mysql -u$DB_USER -p$DB_PASS $DB_DATABASE < ./sql/akupintar_data.sql
        ```



- Konfigurasi variabel environment

    Buat file dengan nama `.env` pada folder projek ini.

    Isikan dengan variabel-variabel yang diperlukan. Contoh variabelnya dapat dilihat pada file [.env.example](.env.example)



## Menjalankan Server

Server API ini dibuat menggunakan bahasa *typescript*, dimana NodeJS tidak dapat langsung mengeksekusi bahasa *typescript*.

Sehingga untuk menjalankan server dapat menggunakan 2 cara, tergantung environtment-nya.

- Development

    Menggunakan bantuan `ts-node` untuk memudahkan proses development, sehingga tidak perlu meng-*compile* kode setiap selesai melakukan pengeditan. `ts-node` sudah terinstall otomatis pada development dependensi.

    ```bash
    npm run dev
    ```

- Production

    Bahasa typescipt harus di-*compile* terlebih dahulu menjadi bahasa javascript yang dapat dieksekusi oleh NodeJS

    ```bash
    npm run build
    ```

    Kemudian menjalan server menggunakan NodeJS

    ```bash
    npm start
    ```

    Server sudah berjalan dan dapat diakses pada `http://localhost:$PORT`


-----


## Data Pengguna

Beberapa contoh data pengguna untuk mengeksekusi API yang memerlukan otentikasi:

- Name: Aku Pintar   
    Username: akupintar   
    Password: akupintar

- Name: User 1  
    Username: user1   
    Password: user1

- Name: User 2   
    Username: user2   
    Password: user2

## Eksekusi Fitur

Respon pada server API ini juga dapat dilihat [Postman](https://www.postman.com/portalnesia/workspace/aku-pintar-online-test/collection/13670841-f4c802d5-c6d6-4440-8cc3-9420664fa163).

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/13670841-f4c802d5-c6d6-4440-8cc3-9420664fa163?action=collection%2Ffork&collection-url=entityId%3D13670841-f4c802d5-c6d6-4440-8cc3-9420664fa163%26entityType%3Dcollection%26workspaceId%3D5d193427-93e8-4765-a8c9-f5f6c270fe98)

### Login (POST)

- Endpoint: `/login`
- POST body:

    ```json
    {
      "username":"akupintar",
      "password": "akupintar"
    }
    ```

- Contoh respon:

    ```json
    {
      "token": "JWT_TOKEN used for Authorization Header",
      "user": {
        "id": 1,
        "name": "Aku Pintar",
        "username": "akupintar"
      }
    }
    ```

### Pencarian Kampus (GET)

- Endpoint: `/campus`

- Optional header:

    `Authorization: Bearer JWT_TOKEN`

- Optional query:

    - `page`: Halaman yang ingin minta. Default 1
    - `page_size`: Ukuran data dalam satu permintaan panggilan. Default 15
    - `category`: Kategori kampus yang diminta. Contoh `SWASTA`, `NEGERI`, `KEDINASAN`, `PTN-BLU`
    - `q`: Nama kampus yang ingin dicari

- Contoh respon:

    ```json
    {
        "page": 1,
        "total": 1,
        "total_pages": 1,
        "data": [
            {
                "id": 2,
                "name": "Universitas Brawijaya (UB)",
                "accreditation": "A",
                "profile": "Profil \n\nUniversitas Brawijaya merupakan saah satu universitas terkemuka di Indonesia yang didirikan oleh Presiden Republik Indonesia melalui kawat no. 258/K/61 dikirim pada tanggal 11 Juli 1961. Nama Brawijaya ini diambil dari gelar Raja-Raja Majapahit, sebuah kerajaan besar di Indonesia dari abad ke-12 hingga ke-15. UB telah terakreditasi secara nasional dan internasional dengan tingkat nilai A baik dari BAN-PT dan juga IATUL Universitas Brawijaya berusaha untuk terus memberikan fasilitas yang dapat menunjang setiap mahasiswa didalamnya.",
                "history": null,
                "achievement": "Webometrics :\nMeraih peringkat 5 dalam hasil penilaian perguruan tinggi se-Indonesia pada periode Januari 2013\n\n4ICU :\nMeraih peringkat 4 dalam hasil penilaian situs perguruan tinggi se-Indonesia pada periode Januari 2013\n\nQS-Stars :\nJurusan Teknik Sipil UB meraih peringkat 4 dalam kategori jurusan Teknik Sipil terbaik se-Indonesia\nJurusan Ilmu Akuntansi UB meraih peringkat 2 dalam kategori jurusan Ilmu Akuntansi terbaik se-Indonesia\nJurusan Ilmu Komunikasi UB meraih peringkat 3 dalam kategori jurusan Ilmu Komunikasi terbaik se-Indonesia",
                "location": "Kota Malang, Jawa Timur",
                "image": "https://image",
                "phone_number": "0812345678",
                "fax": "021-23456",
                "rangking": 428,
                "politeknik": false,
                "status": {
                    "id": 3,
                    "name": "PTN-BLU"
                },
                "category": {
                    "id": 2,
                    "name": "SWASTA"
                },
                "is_followed": true
            }
        ]
    }
    ```

### List Jurusan (GET)

- Endpoint: `/campus/:campus_id/majors`

    - `campus_id`: ID kampus

- Optional header:

    `Authorization: Bearer JWT_TOKEN`

- Optional query:

    - `page`: Halaman yang ingin minta. Default 1
    - `page_size`: Ukuran data dalam satu permintaan panggilan. Default 15
    - `strata`: Jenjang pendidikan yang diminta. Contoh: `Sarjana` atau `Pasca Sarjana`
    - `q`: Nama jurusan yang ingin dicari

- Contoh respon:

    ```json
    {
        "page": 1,
        "total": 31,
        "total_pages": 3,
        "data": [
            {
                "id": 15674,
                "name": "Arsitektur",
                "accreditation": "A",
                "website": "https://",
                "prospect": "Lembaga Keuangan, Akuntan Pemerintah, Akuntan Publik/Perusahaan, Account Officer, Tenaga Pendidik, Wirausaha",
                "learned": "Ilmu menganalisis dan melaporkan",
                "faculty": {
                    "id": 1030,
                    "name": "Fakultas Pertanian"
                },
                "strata": {
                    "id": 1,
                    "name": "Sarjana"
                },
                "ukt": {
                    "minimum": 1600000,
                    "maximum": 16500000
                }
            }
        ]
    }
    ```

### Mengikuti Kampus (POST)

Endpoint ini tetap akan berhasil (kode status 200) meskipun `user` sudah mengikuti kampus.

- Endpoint: `/campus/:campus_id`
    
    - `campus_id`: ID kampus yang ingin diikuti

- Header:

    `Authorization: Bearer JWT_TOKEN`

- Contoh respon:

    ```json
    {
        "success": true
    }
    ```

### Berhenti Mengikuti Kampus (DELETE)

Endpoint ini tetap akan berhasil (kode status 200) meskipun `user` tidak mengikuti kampus.

- Endpoint: `/campus/:campus_id`
  
    - `campus_id`: ID kampus yang ingin berhenti diikuti

- Header:

    `Authorization: Bearer JWT_TOKEN`

- Contoh respon:

    ```json
    {
        "success": true
    }
    ```

