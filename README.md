# Praktikum Jarkom Modul 4 K-31 2026

## Angota Kelompok

| Nama | NRP |
| ---- | --- |
| Silfi Rochmatul Auliyah | 5027251008|
| Nabila Sharliz Sigit | 5027241054 |

## Laporan 

[Link SPS] : 
https://docs.google.com/spreadsheets/d/13hz5RoMRi5G96lwfPW-DccZrPvWZEDAc/edit?usp=sharing&ouid=115121444487039308209&rtpof=true&sd=true

CPT - VLSM

1. Topologi
   
   Berikut adalah topologi yang dibangun di Cisco Packet Tracer. Topologi ini terdiri dari 25 subnet (A1 - A25).
   
   ![alt text](assets/topologi_cpt.png)

2. Total Penggunaan Subnet
   
   Terdapat 25 subnet dengan total kebutuhan IP sebanyak 2814. Setelah prefix tiap subnet ditentukan, total ukuran bloknya adalah 4188 alamat dengan 4138 IP host yang available. Karena terdapat 4188 alamat yang akan digunakan, blok terkecil yang dapat menampung seluruh subnet adalah 8192, jadi prefix blok induknya adalah /19.

   Kemudian pohon pembagian IP untuk VLSM dapat dilihat pada gambar berikut ini. 

   ![alt text](assets/VLSM_Tree.png)

   [VLSM Tree yang lebih jelas](assets/VLSM_Tree.png)

3. Static routing 
  
   - **Arah ke atas (menuju Cyberia):** menggunakan satu default route (`0.0.0.0/0`). Semua tujuan yang tidak dikenali router akan diteruskan ke router di atasnya.
   - **Arah ke bawah (menjauhi Cyberia):** menggunakan route sesuai subnet hasil VLSM.

    Tabel Route

    [Cyberia]

    | Network Tujuan | Netmask | Next Hop | Keterangan |
    |---|---|---|---|
    | 10.79.0.0 | 255.255.224.0 | 10.79.16.58 | Seluruh subnet di bawah Wired (/19) |

    [Wired]

    | Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
    |---|---|---|---|
    | 0.0.0.0 | 0.0.0.0 | 10.79.16.57 | Default (Cyberia) |
    | 10.79.0.0 | 255.255.252.0 | 10.79.16.34 | A4 (via Psyche) |
    | 10.79.15.0 | 255.255.255.192 | 10.79.16.35 | A5 (via Copland) |
    | 10.79.8.0 | 255.255.254.0 | 10.79.16.35 | A6 (via Copland) |
    | 10.79.16.40 | 255.255.255.248 | 10.79.16.36 | A7 (via Schumann) |
    | 10.79.16.60 | 255.255.255.252 | 10.79.16.36 | A8 (via Schumann) |
    | 10.79.4.0 | 255.255.252.0 | 10.79.16.36 | A9 (via Schumann) |
    | 10.79.12.0 | 255.255.254.0 | 10.79.16.66 | A11 dan A13 (via Navi) |
    | 10.79.15.64 | 255.255.255.192 | 10.79.16.66 | A12 (via Navi) |
    | 10.79.10.0 | 255.255.254.0 | 10.79.16.70 | A15 (via Tachibana) |
    | 10.79.14.128 | 255.255.255.128 | 10.79.16.70 | A17 (via Tachibana) |
    | 10.79.15.128 | 255.255.255.128 | 10.79.16.70 | A19 dan A25 (via Tachibana) |
    | 10.79.16.0 | 255.255.255.224 | 10.79.16.70 | A23 (via Tachibana) |
    | 10.79.16.48 | 255.255.255.248 | 10.79.16.70 | A21 (via Tachibana) |
    | 10.79.16.72 | 255.255.255.248 | 10.79.16.70 | A16 dan A18 (via Tachibana) |
    | 10.79.16.80 | 255.255.255.240 | 10.79.16.70 | A20, A22, dan A24 (via Tachibana) |

    [Schumann]

    | Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
    |---|---|---|---|
    | 0.0.0.0 | 0.0.0.0 | 10.79.16.33 | Default (Wired) |
    | 10.79.4.0 | 255.255.252.0 | 10.79.16.62 | A9 (via Accela) |

    [Tachibana]

    | Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
    |---|---|---|---|
    | 0.0.0.0 | 0.0.0.0 | 10.79.16.69 | Default (Wired) |
    | 10.79.14.128 | 255.255.255.128 | 10.79.16.74 | A17 (via Deus) |
    | 10.79.15.128 | 255.255.255.128 | 10.79.16.74 | A19 dan A25 (via Deus) |
    | 10.79.16.0 | 255.255.255.224 | 10.79.16.74 | A23 (via Deus) |
    | 10.79.16.48 | 255.255.255.248 | 10.79.16.74 | A21 (via Deus) |
    | 10.79.16.76 | 255.255.255.252 | 10.79.16.74 | A18 (via Deus) |
    | 10.79.16.80 | 255.255.255.240 | 10.79.16.74 | A20, A22, dan A24 (via Deus) |

    [Deus]

    | Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
    |---|---|---|---|
    | 0.0.0.0 | 0.0.0.0 | 10.79.16.73 | Default (Tachibana) |
    | 10.79.15.128 | 255.255.255.128 | 10.79.16.78 | A19 dan A25 (via Protocol7) |
    | 10.79.16.0 | 255.255.255.224 | 10.79.16.78 | A23 (via Protocol7) |
    | 10.79.16.48 | 255.255.255.248 | 10.79.16.78 | A21 (via Protocol7) |
    | 10.79.16.80 | 255.255.255.240 | 10.79.16.78 | A20, A22, dan A24 (via Protocol7) |

    [Protocol7]

    | Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
    |---|---|---|---|
    | 0.0.0.0 | 0.0.0.0 | 10.79.16.77 | Default (Deus) |
    | 10.79.15.192 | 255.255.255.192 | 10.79.16.82 | A25 (via Knights) |
    | 10.79.16.0 | 255.255.255.224 | 10.79.16.82 | A23 (via Knights) |
    | 10.79.16.48 | 255.255.255.248 | 10.79.16.82 | A21 (via Knights) |
    | 10.79.16.80 | 255.255.255.240 | 10.79.16.82 | A22 dan A24 (via Knights) |

    [Knights]

    | Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
    |---|---|---|---|
    | 0.0.0.0 | 0.0.0.0 | 10.79.16.81 | Default (Protocol7) |
    | 10.79.16.0 | 255.255.255.224 | 10.79.16.86 | A23 (via Phantoma) |
    | 10.79.16.88 | 255.255.255.252 | 10.79.16.86 | A24 (via Phantoma) |
    | 10.79.15.192 | 255.255.255.192 | 10.79.16.86 | A25 (via Phantoma) |

    [Phantoma]

    | Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
    |---|---|---|---|
    | 0.0.0.0 | 0.0.0.0 | 10.79.16.85 | Default (Knights) |
    | 10.79.15.192 | 255.255.255.192 | 10.79.16.90 | A25 (via Shibuya) |

    [Psyche, Copland, Accela, Navi, Shibuya]

    | Router | Network Tujuan | Netmask | Next Hop |
    |---|---|---|---|
    | Psyche | 0.0.0.0 | 0.0.0.0 | 10.79.16.33 (Wired) |
    | Copland | 0.0.0.0 | 0.0.0.0 | 10.79.16.33 (Wired) |
    | Accela | 0.0.0.0 | 0.0.0.0 | 10.79.16.61 (Schumann) |
    | Navi | 0.0.0.0 | 0.0.0.0 | 10.79.16.65 (Wired) |
    | Shibuya | 0.0.0.0 | 0.0.0.0 | 10.79.16.89 (Phantoma) |

4. Konfigurasi Static IP 
   
   Konfigurasi static ip dilakukan pada setiap router ataupun host sesuai dengan range ip yang telah didapatkan pada spreadsheet pembagian ip vlsm.

GNS - CIDR

Bagian ini membahas pembagian alamat IP pada topologi jaringan yang terdiri dari **13 router**, **13 switch**, dan **25 segmen jaringan (A1 sampai A25)**, menggunakan metode **CIDR (Classless Inter-Domain Routing)** dengan blok induk `10.79.0.0`.
Berbeda dengan VLSM yang langsung mengalokasikan alamat dari subnet terbesar, pada CIDR seluruh subnet digabungkan lebih dulu secara bertahap dari ujung topologi ke arah pusat sampai menjadi satu blok induk. Setelah ukuran tiap blok diketahui, alamat dibagikan kembali dari blok induk turun ke tiap subnet. Hasilnya adalah blok alamat yang tersusun hierarkis sehingga routing dapat diringkas.

## 1. Topologi



## 2. Kebutuhan Alamat per Segmen

Kebutuhan tiap segmen dihitung dari **jumlah host + 1 gateway** (interface router). Blok yang dipilih adalah pangkat 2 terkecil yang masih memuat kebutuhan tersebut ditambah alamat network dan broadcast.

| Subnet | Letak | Host + gateway | Blok | Prefix |
|---|---|---|---|---|
| A1 | Cyberia > Switch1 > JJ, MyuMyu | 126 | 128 | `/25` |
| A2 | Link Cyberia - Wired | 2 | 4 | `/30` |
| A3 | Switch2 (Wired, Psyche, Copland, Schumann) | 4 | 8 | `/29` |
| A4 | Psyche > Switch3 > Karl, Lin | 881 | 1024 | `/22` |
| A5 | Copland > Juri | 32 | 64 | `/26` |
| A6 | Copland > Switch4 > Masayuki | 301 | 512 | `/23` |
| A7 | Schumann > Akashic | 4 | 8 | `/29` |
| A8 | Link Schumann - Accela | 2 | 4 | `/30` |
| A9 | Accela > Switch5 > Omnipresence, Denpa | 514 | 1024 | `/22` |
| A10 | Link Wired - Navi | 2 | 4 | `/30` |
| A11 | Navi > Switch6 > Alice, Reika | 254 | 256 | `/24` |
| A12 | Navi > Switch7 > Taro | 58 | 64 | `/26` |
| A13 | Navi > Switch8 > Yasuo, Miho, Kuma | 143 | 256 | `/24` |
| A14 | Link Wired - Tachibana | 2 | 4 | `/30` |
| A15 | Tachibana > Switch9 > Collective, Ghost | 267 | 512 | `/23` |
| A16 | Link Tachibana - Deus | 2 | 4 | `/30` |
| A17 | Deus > Switch10 > Lilith, Specter | 99 | 128 | `/25` |
| A18 | Link Deus - Protocol7 | 2 | 4 | `/30` |
| A19 | Protocol7 > Switch11 > Chisa, Hodgeson | 33 | 64 | `/26` |
| A20 | Link Protocol7 - Knights | 2 | 4 | `/30` |
| A21 | Knights > Eiri | 3 | 8 | `/29` |
| A22 | Link Knights - Phantoma | 2 | 4 | `/30` |
| A23 | Phantoma > Switch12 > Semi | 15 | 32 | `/27` |
| A24 | Link Phantoma - Shibuya | 2 | 4 | `/30` |
| A25 | Shibuya > Switch13 > Lain, Mika | 62 | 64 | `/26` |

Total ukuran seluruh blok adalah **4188 alamat**. Karena 4188 melebihi 4096 (`/20`), blok induk minimal yang dibutuhkan adalah 8192 alamat atau **`/19`**.

## 3. Metode dan Aturan Penggabungan

Langkah pengerjaan:

1. Hitung kebutuhan tiap segmen dan tentukan prefix-nya (tabel di atas).
2. Gabungkan subnet secara bertahap dari ujung topologi ke pusat. Ukuran gabungan adalah jumlah ukuran blok, dibulatkan ke pangkat 2, dan prefix = 32 - log2(ukuran).
3. Setelah menjadi satu blok induk, bagikan alamat dari atas ke bawah. Blok yang lebih besar ditempatkan lebih dulu pada alamat awal agar alamat network selalu kelipatan ukuran blok (aligned).
4. Hitung Network ID, Netmask, Broadcast, dan Range IP tiap subnet.

Aturan yang dipakai:

- Setiap penggabungan terdiri dari **tepat 2 blok**.
- Segmen yang digabung berada pada **satu jalur dari router Wired**, sehingga satu blok gabungan dapat dirutekan lewat satu arah keluar.
- Pengecualian hanya terjadi di level Wired, yaitu gabungan antar jalur yang tidak terhindarkan agar semua subnet menjadi satu blok induk.

Pembagian jalur dari Wired:

| Jalur | Isi segmen |
|---|---|
| Cyberia | A1, A2 |
| Navi | A10, A11, A12, A13 |
| Tachibana | A14 sampai A25 |
| Switch2 | A3, A4, A5, A6, A7, A8, A9 |

Cyberia adalah satu-satunya router yang terhubung ke NAT1 sebagai jalan keluar jaringan.

## 4. Tahap Penggabungan

### Tahap I

| Kode | Gabungan dari | Hitungan | Prefix akhir |
|---|---|---|---|
| B1 | A24 (`/30`) + A25 (`/26`) | 4 + 64 = 68, jadi 128 | `/25` |
| B2 | A22 (`/30`) + A23 (`/27`) | 4 + 32 = 36, jadi 64 | `/26` |
| B3 | A19 (`/26`) + A20 (`/30`) | 64 + 4 = 68, jadi 128 | `/25` |
| B4 | A17 (`/25`) + A18 (`/30`) | 128 + 4 = 132, jadi 256 | `/24` |
| B5 | A14 (`/30`) + A16 (`/30`) | 4 + 4 = 8 | `/29` |
| B6 | A1 (`/25`) + A2 (`/30`) | 128 + 4 = 132, jadi 256 | `/24` |
| B7 | A11 (`/24`) + A12 (`/26`) | 256 + 64 = 320, jadi 512 | `/23` |
| B8 | A10 (`/30`) + A13 (`/24`) | 4 + 256 = 260, jadi 512 | `/23` |
| B9 | A5 (`/26`) + A6 (`/23`) | 64 + 512 = 576, jadi 1024 | `/22` |
| B10 | A7 (`/29`) + A8 (`/30`) | 8 + 4 = 12, jadi 16 | `/28` |

### Tahap II

| Kode | Gabungan dari | Hitungan | Prefix akhir |
|---|---|---|---|
| C1 | B1 (`/25`) + B2 (`/26`) | 128 + 64 = 192, jadi 256 | `/24` |
| C2 | B3 (`/25`) + A21 (`/29`) | 128 + 8 = 136, jadi 256 | `/24` |
| C3 | B8 (`/23`) + B7 (`/23`) | 512 + 512 = 1024 | `/22` |
| C4 | B10 (`/28`) + A3 (`/29`) | 16 + 8 = 24, jadi 32 | `/27` |
| C5 | B5 (`/29`) + B4 (`/24`) | 8 + 256 = 264, jadi 512 | `/23` |

### Tahap III

| Kode | Gabungan dari | Hitungan | Prefix akhir |
|---|---|---|---|
| D1 | C5 (`/23`) + A15 (`/23`) | 512 + 512 = 1024 | `/22` |
| D2 | C1 (`/24`) + C2 (`/24`) | 256 + 256 = 512 | `/23` |
| D3 | B9 (`/22`) + A4 (`/22`) | 1024 + 1024 = 2048 | `/21` |
| D4 | C4 (`/27`) + A9 (`/22`) | 32 + 1024 = 1056, jadi 2048 | `/21` |

### Tahap IV

| Kode | Gabungan dari | Hitungan | Prefix akhir |
|---|---|---|---|
| E1 | D4 (`/21`) + D3 (`/21`) | 2048 + 2048 = 4096 | `/20` |
| E2 | D2 (`/23`) + D1 (`/22`) | 512 + 1024 = 1536, jadi 2048 | `/21` |
| E3 | C3 (`/22`) + B6 (`/24`) | 1024 + 256 = 1280, jadi 2048 | `/21` |

### Tahap V

| Kode | Gabungan dari | Hitungan | Prefix akhir |
|---|---|---|---|
| F1 | E2 (`/21`) + E3 (`/21`) | 2048 + 2048 = 4096 | `/20` |

### Tahap VI

| Kode | Gabungan dari | Hitungan | Prefix akhir |
|---|---|---|---|
| G1 | E1 (`/20`) + F1 (`/20`) | 4096 + 4096 = 8192 | **`/19`** |

Jumlah penggabungan adalah 10 + 5 + 4 + 3 + 1 + 1 = **24**, sesuai dengan 25 subnet yang menjadi satu blok induk. Seluruh subnet A1 sampai A25 terpakai tepat satu kali.

## 5. Pembagian Alamat dari Blok Induk

Blok induk G1 adalah **`10.79.0.0/19`** (10.79.0.0 sampai 10.79.31.255). Pembagian dilakukan dari atas ke bawah mengikuti pohon penggabungan.

| Blok | Prefix | Rentang | Isi |
|---|---|---|---|
| G1 | `/19` | 10.79.0.0 - 10.79.31.255 | F1 + E1 |
| F1 | `/20` | 10.79.0.0 - 10.79.15.255 | E2 + E3 |
| E2 | `/21` | 10.79.0.0 - 10.79.7.255 | D1 + D2 |
| D1 | `/22` | 10.79.0.0 - 10.79.3.255 | C5 + A15 |
| C5 | `/23` | 10.79.0.0 - 10.79.1.255 | B4 + B5 |
| B4 | `/24` | 10.79.0.0 - 10.79.0.255 | A17 + A18 |
| B5 | `/29` | 10.79.1.0 - 10.79.1.7 | A14 + A16 |
| A15 | `/23` | 10.79.2.0 - 10.79.3.255 | segmen A15 |
| D2 | `/23` | 10.79.4.0 - 10.79.5.255 | C1 + C2 |
| C1 | `/24` | 10.79.4.0 - 10.79.4.255 | B1 + B2 |
| B1 | `/25` | 10.79.4.0 - 10.79.4.127 | A25 + A24 |
| B2 | `/26` | 10.79.4.128 - 10.79.4.191 | A23 + A22 |
| C2 | `/24` | 10.79.5.0 - 10.79.5.255 | B3 + A21 |
| B3 | `/25` | 10.79.5.0 - 10.79.5.127 | A19 + A20 |
| E3 | `/21` | 10.79.8.0 - 10.79.15.255 | C3 + B6 |
| C3 | `/22` | 10.79.8.0 - 10.79.11.255 | B8 + B7 |
| B8 | `/23` | 10.79.8.0 - 10.79.9.255 | A13 + A10 |
| B7 | `/23` | 10.79.10.0 - 10.79.11.255 | A11 + A12 |
| B6 | `/24` | 10.79.12.0 - 10.79.12.255 | A1 + A2 |
| E1 | `/20` | 10.79.16.0 - 10.79.31.255 | D4 + D3 |
| D4 | `/21` | 10.79.16.0 - 10.79.23.255 | A9 + C4 |
| C4 | `/27` | 10.79.20.0 - 10.79.20.31 | B10 + A3 |
| B10 | `/28` | 10.79.20.0 - 10.79.20.15 | A7 + A8 |
| D3 | `/21` | 10.79.24.0 - 10.79.31.255 | B9 + A4 |
| B9 | `/22` | 10.79.24.0 - 10.79.27.255 | A6 + A5 |

## 6. Hasil Pembagian IP per Subnet

| Subnet | Network ID | Netmask | Broadcast | Range IP |
|---|---|---|---|---|
| A1 | 10.79.12.0 | 255.255.255.128 | 10.79.12.127 | 10.79.12.1 - 10.79.12.126 |
| A2 | 10.79.12.128 | 255.255.255.252 | 10.79.12.131 | 10.79.12.129 - 10.79.12.130 |
| A3 | 10.79.20.16 | 255.255.255.248 | 10.79.20.23 | 10.79.20.17 - 10.79.20.22 |
| A4 | 10.79.28.0 | 255.255.252.0 | 10.79.31.255 | 10.79.28.1 - 10.79.31.254 |
| A5 | 10.79.26.0 | 255.255.255.192 | 10.79.26.63 | 10.79.26.1 - 10.79.26.62 |
| A6 | 10.79.24.0 | 255.255.254.0 | 10.79.25.255 | 10.79.24.1 - 10.79.25.254 |
| A7 | 10.79.20.0 | 255.255.255.248 | 10.79.20.7 | 10.79.20.1 - 10.79.20.6 |
| A8 | 10.79.20.8 | 255.255.255.252 | 10.79.20.11 | 10.79.20.9 - 10.79.20.10 |
| A9 | 10.79.16.0 | 255.255.252.0 | 10.79.19.255 | 10.79.16.1 - 10.79.19.254 |
| A10 | 10.79.9.0 | 255.255.255.252 | 10.79.9.3 | 10.79.9.1 - 10.79.9.2 |
| A11 | 10.79.10.0 | 255.255.255.0 | 10.79.10.255 | 10.79.10.1 - 10.79.10.254 |
| A12 | 10.79.11.0 | 255.255.255.192 | 10.79.11.63 | 10.79.11.1 - 10.79.11.62 |
| A13 | 10.79.8.0 | 255.255.255.0 | 10.79.8.255 | 10.79.8.1 - 10.79.8.254 |
| A14 | 10.79.1.0 | 255.255.255.252 | 10.79.1.3 | 10.79.1.1 - 10.79.1.2 |
| A15 | 10.79.2.0 | 255.255.254.0 | 10.79.3.255 | 10.79.2.1 - 10.79.3.254 |
| A16 | 10.79.1.4 | 255.255.255.252 | 10.79.1.7 | 10.79.1.5 - 10.79.1.6 |
| A17 | 10.79.0.0 | 255.255.255.128 | 10.79.0.127 | 10.79.0.1 - 10.79.0.126 |
| A18 | 10.79.0.128 | 255.255.255.252 | 10.79.0.131 | 10.79.0.129 - 10.79.0.130 |
| A19 | 10.79.5.0 | 255.255.255.192 | 10.79.5.63 | 10.79.5.1 - 10.79.5.62 |
| A20 | 10.79.5.64 | 255.255.255.252 | 10.79.5.67 | 10.79.5.65 - 10.79.5.66 |
| A21 | 10.79.5.128 | 255.255.255.248 | 10.79.5.135 | 10.79.5.129 - 10.79.5.134 |
| A22 | 10.79.4.160 | 255.255.255.252 | 10.79.4.163 | 10.79.4.161 - 10.79.4.162 |
| A23 | 10.79.4.128 | 255.255.255.224 | 10.79.4.159 | 10.79.4.129 - 10.79.4.158 |
| A24 | 10.79.4.64 | 255.255.255.252 | 10.79.4.67 | 10.79.4.65 - 10.79.4.66 |
| A25 | 10.79.4.0 | 255.255.255.192 | 10.79.4.63 | 10.79.4.1 - 10.79.4.62 |

Pemeriksaan: tidak ada blok yang saling tumpang tindih, dan seluruh Network ID merupakan kelipatan ukuran bloknya.

## 7. Konfigurasi IP Interface dan Routing

### 7.1 Alamat interface router

Gateway segmen LAN memakai IP pertama pada range. Pada link `/30`, alamat tiap ujung tercantum di bawah. Pada A3 (Switch2) terdapat empat router.

| Segmen | Router dan IP |
|---|---|
| A1 | Cyberia `10.79.12.1` |
| A2 | Cyberia `10.79.12.129`, Wired `10.79.12.130` |
| A3 | Wired `10.79.20.17`, Psyche `10.79.20.18`, Copland `10.79.20.19`, Schumann `10.79.20.20` |
| A4 | Psyche `10.79.28.1` |
| A5 | Copland `10.79.26.1` |
| A6 | Copland `10.79.24.1` |
| A7 | Schumann `10.79.20.1` |
| A8 | Schumann `10.79.20.9`, Accela `10.79.20.10` |
| A9 | Accela `10.79.16.1` |
| A10 | Wired `10.79.9.1`, Navi `10.79.9.2` |
| A11 | Navi `10.79.10.1` |
| A12 | Navi `10.79.11.1` |
| A13 | Navi `10.79.8.1` |
| A14 | Wired `10.79.1.1`, Tachibana `10.79.1.2` |
| A15 | Tachibana `10.79.2.1` |
| A16 | Tachibana `10.79.1.5`, Deus `10.79.1.6` |
| A17 | Deus `10.79.0.1` |
| A18 | Deus `10.79.0.129`, Protocol7 `10.79.0.130` |
| A19 | Protocol7 `10.79.5.1` |
| A20 | Protocol7 `10.79.5.65`, Knights `10.79.5.66` |
| A21 | Knights `10.79.5.129` |
| A22 | Knights `10.79.4.161`, Phantoma `10.79.4.162` |
| A23 | Phantoma `10.79.4.129` |
| A24 | Phantoma `10.79.4.65`, Shibuya `10.79.4.66` |
| A25 | Shibuya `10.79.4.1` |

### 7.2 Static Routing

- **Arah ke atas (menuju Cyberia):** menggunakan satu default route (`0.0.0.0/0`). Semua tujuan yang tidak dikenali router akan diteruskan ke router di atasnya.
- **Arah ke bawah (menjauhi Cyberia):** menggunakan route sesuai subnet hasil penggabungan CIDR.

Cyberia adalah satu-satunya router yang terhubung ke NAT1, sehingga trafik ke luar jaringan selalu melewati Cyberia. Sisi Switch2 memuat tiga router (Psyche, Copland, Schumann), sehingga Wired memakai next-hop berbeda untuk masing-masing.

#### Tabel Route

**[Cyberia]**

| Network Tujuan | Netmask | Next Hop | Keterangan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | NAT1 (otomatis dari DHCP) | Default (keluar jaringan) |
| 10.79.0.0 | 255.255.248.0 | 10.79.12.130 | A14 - A25 (via Wired, arah Tachibana) |
| 10.79.8.0 | 255.255.252.0 | 10.79.12.130 | A10 - A13 (via Wired, arah Navi) |
| 10.79.16.0 | 255.255.240.0 | 10.79.12.130 | A3 - A9 (via Wired, arah Switch2) |

**[Wired]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.12.129 | Default (Cyberia) |
| 10.79.12.0 | 255.255.255.0 | 10.79.12.129 | A1 (via Cyberia) |
| 10.79.28.0 | 255.255.252.0 | 10.79.20.18 | A4 (via Psyche) |
| 10.79.24.0 | 255.255.252.0 | 10.79.20.19 | A5 dan A6 (via Copland) |
| 10.79.20.0 | 255.255.255.240 | 10.79.20.20 | A7 dan A8 (via Schumann) |
| 10.79.16.0 | 255.255.252.0 | 10.79.20.20 | A9 (via Schumann) |
| 10.79.8.0 | 255.255.252.0 | 10.79.9.2 | A11, A12, dan A13 (via Navi) |
| 10.79.0.0 | 255.255.248.0 | 10.79.1.2 | A15 - A25 (via Tachibana) |

**[Navi]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.9.1 | Default (Wired) |

**[Tachibana]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.1.1 | Default (Wired) |
| 10.79.0.0 | 255.255.255.0 | 10.79.1.6 | A17 dan A18 (via Deus) |
| 10.79.4.0 | 255.255.252.0 | 10.79.1.6 | A19 - A25 (via Deus) |

**[Deus]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.1.5 | Default (Tachibana) |
| 10.79.4.0 | 255.255.252.0 | 10.79.0.130 | A19 - A25 (via Protocol7) |

**[Protocol7]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.0.129 | Default (Deus) |
| 10.79.4.0 | 255.255.255.0 | 10.79.5.66 | A22 - A25 (via Knights) |
| 10.79.5.128 | 255.255.255.248 | 10.79.5.66 | A21 (via Knights) |

**[Knights]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.5.65 | Default (Protocol7) |
| 10.79.4.0 | 255.255.255.0 | 10.79.4.162 | A23 - A25 (via Phantoma) |

**[Phantoma]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.4.161 | Default (Knights) |
| 10.79.4.0 | 255.255.255.192 | 10.79.4.66 | A25 (via Shibuya) |

**[Shibuya]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.4.65 | Default (Phantoma) |

**[Psyche]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.20.17 | Default (Wired) |

**[Copland]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.20.17 | Default (Wired) |

**[Schumann]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.20.17 | Default (Wired) |
| 10.79.16.0 | 255.255.252.0 | 10.79.20.10 | A9 (via Accela) |

**[Accela]**

| Network Tujuan | Netmask | Next Hop | Subnet Tujuan |
|---|---|---|---|
| 0.0.0.0 | 0.0.0.0 | 10.79.20.9 | Default (Schumann) |

## 8. Analisis

- **Blok induk minimal.** Total kebutuhan 4188 alamat melebihi 4096, sehingga blok induk terkecil yang mungkin adalah `/19` (8192 alamat). Hasil penggabungan CIDR mencapai `/19`, yaitu batas minimum tersebut.
- **Pembulatan.** Setiap penggabungan dibulatkan ke pangkat 2, sehingga ada alamat kosong yang terselip di dalam blok. Contohnya B8 (260 menjadi 512), B9 (576 menjadi 1024), dan E3 (1280 menjadi 2048). Dari 8192 alamat pada blok induk, 4188 terpakai oleh subnet (sekitar 51%).
- **Dibanding VLSM.** VLSM juga menghasilkan `/19`, tetapi alamat terpakai berurutan dari 10.79.0.0 sampai 10.79.16.91 sehingga sisa alamat berada di satu ujung. Pada CIDR sisa alamat tersebar di dalam blok-blok gabungan, misalnya 10.79.6.0 - 10.79.7.255 dan 10.79.13.0 - 10.79.15.255.
- **Keuntungan CIDR.** Alamat tersusun hierarkis per jalur sehingga routing dapat diringkas. Wired cukup memakai satu route untuk seluruh arah Tachibana (`10.79.0.0/21`) dan satu route untuk seluruh arah Navi (`10.79.8.0/22`), bukan satu route per subnet.
- **Kekurangan CIDR.** Alamat yang terbuang lebih tersebar dan pembulatan di tiap tahap ikut terbawa ke tahap berikutnya.

## 9. Pengujian

Pengujian dilakukan di GNS3 dengan ping bertahap: router ke tetangga langsung, host ke gateway, lalu antar cabang (contoh dari Lain di A25 ke JJ di A1) dan dari host ke luar melalui NAT1.

<!-- Tempelkan tangkapan layar hasil ping dan show ip route di sini, contoh: -->
<!-- ![Ping A25 ke A1](img/ping-a25-a1.png) -->

## 10. Kesimpulan

Pembagian IP dengan metode CIDR pada topologi ini berhasil menyatukan 25 subnet ke dalam satu blok induk **`10.79.0.0/19`** melalui 24 penggabungan biner. Ukuran blok induk sama dengan hasil VLSM dan sudah merupakan batas minimum untuk kebutuhan 4188 alamat. Dengan pengelompokan per jalur router, tabel routing menjadi lebih ringkas, dengan konsekuensi alamat kosong yang tersebar di dalam blok gabungan.
