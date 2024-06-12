CREATE DATABASE IF NOT EXISTS `desaku`;
USE `desaku`;

CREATE TABLE IF NOT EXISTS `alamat` (
  `name` text,
  `value` text
) ENGINE=InnoDB;

INSERT INTO `alamat` (`name`, `value`) VALUES
	('Desa', 'Medalsari'),
	('Kecamatan', 'Pangkalan'),
	('Kabupaten', 'Karawang'),
	('Provinsi', 'Jawa Barat');

CREATE TABLE IF NOT EXISTS `berita` (
  `uuid` char(50) DEFAULT NULL,
  `title` text,
  `slug` varchar(200) NOT NULL DEFAULT '',
  `description` text,
  `category_id` text,
  `thumbnail` varchar(200) DEFAULT NULL,
  `content` text,
  `user_id` char(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `berita` (`uuid`, `title`, `slug`, `description`, `category_id`, `thumbnail`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
	('4412167e-4ac5-442a-bafb-7f0e0ddd6264', 'Kasus Leptospirosis di Sleman Terus Bertambah, Rata-Rata Banyak Ditemukan di Kapanewon Ini', 'kasus-leptospirosis-di-sleman-terus-bertambah-rata-rata-banyak-ditemukan-di-kapanewon-ini', 'Sejumlah kasus Leptospirosis masih ditemukan Dinas Kesehatan (Dinkes) Sleman hingga Mei 2024. Pengendalian vektor pembawa leptospirosis yakni tikus.', '859f39a9-b0c4-4811-a741-2e2eb8473205', 'https://ik.imagekit.io/uvma3bkbp/desaku/tikus_fS58RoOxf.jpg', '<p>Harianjogja.com, SLEMAN—Leptospirosis masih saja menghantui di Sleman. Jumlah kasus penyakit yang disebabkan oleh bakteri&nbsp;<em>Leptospira&nbsp;</em>tersebut terus bertambah. Hingga Mei 2024, jumlah kasusnya bertambah 1 kasus menjadi 20 kasus dengan jumlah suspek mencapai 21 pasien.</p><p><br></p><p>Kepala Bidang Penanggulangan Penyakit dan Penyehatan Lingkungan (P2PL) Dinas Kesehatan (Dinkes) Sleman, Khamidah Yuliati menjelaskan masa inkubasi leptospirosis berkisar antara 7-13 hari dengan rerata 10 hari. Saat menjangkiti seseorang, leptospirosis mempunyai dua fase penyakit khas yaitu fase leptospiremia dan fase imun.</p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:09:45', '2024-06-12 12:09:45'),
	('1449a782-a55b-4105-b769-d6a75a58c410', 'Nusantara Airport Jadi Nama Bandara di IKN, Menhub Targetkan Pengoperasian di 1 Agustus', 'nusantara-airport-jadi-nama-bandara-di-ikn-menhub-targetkan-pengoperasian-di-1-agustus', 'Menteri Perhubungan Budi Karya Sumadi terus mengebut pembangunan akses transpotasi ke Ibukota Nusantara (IKN) yang rencananya dipergunakan untuk Upacara Peringatan HUT RI ke-79.', '859f39a9-b0c4-4811-a741-2e2eb8473205', 'https://ik.imagekit.io/uvma3bkbp/desaku/ikn-proyek_q_j4uDa_q.jpg', '<p>Harianjogja.com, SLEMAN—Menteri Perhubungan Budi Karya Sumadi terus mengebut pembangunan akses transpotasi ke Ibukota Nusantara (IKN) yang rencananya dipergunakan untuk Upacara Peringatan HUT RI ke-79. Presiden Jokowi juga sudah memberikan nama untuk bandara, yaitu Nusantara Airport.</p><p><br></p><p>Dia menjelaskan, untuk persiapan, setidaknya mendapatkan empat tugas dari presiden. Tugas ini meliputi tentang kesiapan bandara, kereta api tanpa listrik hingga memberikan layanan kepada warga yang berkunjung ke IKN.</p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:12:39', '2024-06-12 12:12:39'),
	('66b73720-a686-475f-995c-35112d9c5feb', 'Merasa Dirugikan, Warga Jagalan Desak DLH Kota Jogja Tutup TPS3R Karangmiri', 'merasa-dirugikan-warga-jagalan-desak-dlh-kota-jogja-tutup-tps3r-karangmiri', 'Ratusan warga Jagalan, Banguntapan, Bantul, menggelar aksi damai dan Konser Keadilan, Rabu (12/6/2024). Mereka mendesak Dinas Lingkungan Hidup (DLH) Kota Jogja untuk menutup TPS3R Karangmiri.', 'f3eb3ccf-6cf2-4bcf-9c35-c4d7dffdecbf', 'https://ik.imagekit.io/uvma3bkbp/desaku/karangmiri_Oia7NfWtx.jpg', '<p>Harianjogja.com, JOGJA—Ratusan warga Jagalan, Banguntapan, Bantul, menggelar aksi damai dan Konser Keadilan, Rabu (12/6/2024). Mereka mendesak Dinas Lingkungan Hidup (DLH) Kota Jogja untuk menutup TPS3R Karangmiri.</p><p><br></p><p>Tokoh masyarakat Jagalan, Zidni Nuri, menyampaikan masalah sampah di DIY tak kunjung terselesaikan. Akan tetapi pembangunan TPS3R di Karangmiri bukan solusi, karena akan menimbulkan dampak sosial dan lingkungan, terutama bagi masyarakat di sekitarnya.</p><p><br></p><p>“Upaya yang telah dilakukan dengan TPS3R di Karangmiri tidak memberikan solusi dan tidak berkeadilan pada warga. Justru menyebabkan permasalahan baru bagi warga. Mengganggu lingkungqn. Kami resah atas keberadaan TPS3R yang berdampak negatif,” ujarnya.</p><p><br></p><p>Dia khawatir keberadaan TPS3R akan menimbulkan dampak bau dan mencemari sungai Gajahwong yang berada di sebelahnya. Di samping itu, ia juga menyayangkan tidak adanya sosialisasi bahkan koordinasi dengan pihak Kalurahan Jagalan sebelum pembangunan.</p><p><br></p><p>“Ketidakjjelasan pihak pembangun yang tidak memberi penjelasan. Untuk itu pemerintah Jagalan harus segera mengusut pembangunan tersebut. Berbagai dampak buruk yang menyerang kami sebagai warga di sekitar TPS3R mulai dari dampak sosial, psikologis dan ekonomi, lingkungqn dan kesehatan,” kata dia.</p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:14:17', '2024-06-12 12:14:17'),
	('6b453fb7-54ee-48d3-8cf0-d81bbd2b3b6e', 'Bimbingan Teknis Kiat Lulus Uji Kompetensi Strategi Komunikasi Kehumasan Pemerintah', 'bimbingan-teknis-kiat-lulus-uji-kompetensi-strategi-komunikasi-kehumasan-pemerintah', 'Dalam rangka peningkatan kualitas Sumber Daya Manusia (SDM) melalui pengembangan kompetensi Aparatur Sipil Negara (ASN) khususnya bagi Pranata Hubungan Masyarakat.', 'f3eb3ccf-6cf2-4bcf-9c35-c4d7dffdecbf', 'https://ik.imagekit.io/uvma3bkbp/desaku/bintekk-3730704934_otpwqLySP.webp', '<p>Dalam rangka peningkatan kualitas Sumber Daya Manusia (SDM) melalui pengembangan kompetensi Aparatur Sipil Negara (ASN) khususnya bagi Pranata Hubungan Masyarakat, Kementerian Komunikasi dan Informatika melalui Direktorat Tata Kelola dan Kemitraan Komunikasi Publik menggelar Bimbingan Teknis Kiat Lulus&nbsp;<a href="https://www.krjogja.com/tag/uji-kompetensi" rel="noopener noreferrer" target="_blank" style="color: rgb(218, 43, 38);">Uji Kompetensi</a>&nbsp;Strategi Komunikasi&nbsp;<a href="https://www.krjogja.com/tag/kehumasan-pemerintah" rel="noopener noreferrer" target="_blank" style="color: rgb(218, 43, 38);">Kehumasan Pemerintah</a>&nbsp;yang dilaksanakan secara daring dan luring bertempat di The 101 Yogyakarta Tugu.</p><p><br></p><p>Acara ini bertujuan untuk memberikan pemahaman dan persiapan bagi calon peserta uji kompetensi, terutama bagi Pranata Humas dan calon Pranata Humas. Kegiatan ini dihadiri secara langsung oleh Kepala Dinas Komunikasi dan Informatika Daerah Istimewa Yogyakarta, Hari Edi Tri Wahyu Nugroho, yang dalam sambutannya menekankan pentingnya komunikasi publik dalam mewujudkan partisipasi masyarakat dalam penyelenggaraan negara.</p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:18:45', '2024-06-12 12:18:45'),
	('91874599-56ef-4dab-a267-2712b1df560a', 'Petani Rempah di Danau Toba Naik Kelas Berkat KUR BRI', 'petani-rempah-di-danau-toba-naik-kelas-berkat-kur-bri', 'Tanah Air terkenal kaya akan rempah-rempah nusantara. Salah satunya rempah Andaliman atau bernama latin zanthoxylum acanthopodium yang merupakan rempah khas Danau Toba, Sumatera Utara.', '4dce6db5-8a37-42c9-a632-f452f3d0a40a', 'https://ik.imagekit.io/uvma3bkbp/desaku/IMG-20240611-WA0008-954928265_F01FD4q1D.webp', '<p>Danau Toba – Tanah Air terkenal kaya akan rempah-rempah nusantara. Salah satunya rempah Andaliman atau bernama latin zanthoxylum acanthopodium yang merupakan rempah khas Danau Toba, Sumatera Utara.</p><p>&nbsp;</p><p>Rempah yang memiliki rasa pedas, getir, panas, mentol, dan aroma harum seperti bau jeruk ini dapat diolah menjadi bumbu masak serta dapat pula dibuat keripik, bandrek, dan berbagai makanan-minuman lainnya.</p><p>&nbsp;</p><p>Marandus Sirait, salah satu pelaku usaha rempah Andaliman di Desa Sionggang Utara, Kecamatan Lumban Julu, Kabupaten Toba, Sumatera Utara menjadi yang pertama kali membudidayakan Andaliman di Lumban Julu.</p><p>&nbsp;</p><p>Inisiatifnya tersebut menginspirasi masyarakat sekitarnya turut serta membuat usaha yang sama.</p><p>&nbsp;</p><p>Sirait memulai usaha andaliman pada 2017 dengan nama UMKM CV Andaliman Mangintir dengan membudidayakan dan menjual rempah Andaliman, baik yang masih segar maupun dalam kemasan, serta produk-produk turunannya ke dalam dan luar negeri.</p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:20:19', '2024-06-12 12:20:19'),
	('e605259f-ad9f-42ca-85f3-acdc7b7b36a0', 'Direktur Kepatuhan Bank BPD DIY Dian Ari Ani Raih Penghargaan Most Outstanding Women 2024', 'direktur-kepatuhan-bank-bpd-diy-dian-ari-ani-raih-penghargaan-most-outstanding-women-2024', 'Direktur Kepatuhan Bank BPD DIY, Dian Ari Ani mendapat penghargaan sebagai Most Outstanding Women 2024 dari Majalah Infobank.', '3d660b0b-3598-409f-be62-42644a55c588', 'https://ik.imagekit.io/uvma3bkbp/desaku/Most_Outstanding_Women_20241JPG-2448972759_ZtskFWXLd.webp', '<p>Krjogja.com – Denpasar – Direktur Kepatuhan&nbsp;<a href="https://www.krjogja.com/tag/bank-bpd-diy" rel="noopener noreferrer" target="_blank" style="color: rgb(218, 43, 38);">Bank BPD DIY</a>, Dian Ari Ani mendapat penghargaan sebagai Most Outstanding Women 2024 dari Majalah&nbsp;<a href="https://www.krjogja.com/tag/infobank" rel="noopener noreferrer" target="_blank" style="color: rgb(218, 43, 38);">Infobank</a>. Penghargaan tersebut diterima langsung oleh Dian Ari Ani di The Stone Hotel, Bali pada Sabtu, 1 Juni 2024.</p><p><br></p><p>Majalah Infobank menerbitkan laporan khusus bertajuk “500 Most Outstanding Women 2024” yang merupakan kumpulan pemimpin wanita pilihan Infobank di seluruh tanah air dari industri jasa keuangan yakni perbankan (bank umum dan BPR), asuransi, multifinance, sekuritas, perusahaan teknologi keuangan serta dari Badan Usaha Milik Negara.</p><p><br></p><p>Direktur Kepatuhan, Dian Ari Ani dalam kesempatan tersebut menyampaiakan ucapan terimakasih atas apresiasi yang diberikan kepadanya sekaligus ungkapan bangga dirinya menjadi salah satu wanita yang masuk dalam jajaran 500 Most Outstanding Women oleh Infobank.</p><p><br></p><p>“Penghargaan ini menjadi bukti bahwa wanita juga mampu memberikan kontribusi dan menjadi pemimpin dalam berbagai bidang. Saya juga mengajak seluruh wanita Indonesia untuk terus berkarya dan mengukir prestasi untuk kemajuan Indonesia” ungkapnya</p><p><br></p><p>Ada dua kriteria utama yang menjadikan para tokoh wanita di Indonesia ini masuk dalam daftar 500 Most Outstanding Women 2024. Yang pertama yaitu basis kinerja perusahaan yang dipimpin dan yang kedua adalah hasil pertimbangan Dewan Redaksi Majalah Infobank.</p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:22:05', '2024-06-12 12:22:05');

CREATE TABLE IF NOT EXISTS `footer` (
  `uuid` char(50) DEFAULT NULL,
  `profile` text,
  `address` text,
  `copyright` text
) ENGINE=InnoDB;

INSERT INTO `footer` (`uuid`, `profile`, `address`, `copyright`) VALUES
	('1', 'Website desa dibangun sebagai bagian dari SISTEM INFORMASI DESA yang berfungsi sebagai portal informasi, transparansi, dan sosialisasi pemerintah terkait tata kelola pembangunan kawasan perdesaan (pembangunan, pembinaan dan pemberdayaan) yang dirasakan langsung oleh masyarakat sebagai penerima manfaat.', 'Desa Medalsari, Kecamatan Pangkalan, Kabupaten Karawang, Jawa Barat, Indonesia.', '2024 © Desa Medalsari, Kecamatan Pangkalan, Kabupaten Karawang, Jawa Barat.');

CREATE TABLE IF NOT EXISTS `gambar` (
  `uuid` char(50) DEFAULT NULL,
  `image_id` char(50) DEFAULT NULL,
  `url` char(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `gambar` (`uuid`, `image_id`, `url`, `created_at`) VALUES
	('a155defa-1388-4d13-b749-dcd0d5ce62af', '66698c4737b244ef54a17059', 'https://ik.imagekit.io/uvma3bkbp/desaku/logo_header%20(2)_xXPbuDCGq.png', '2024-06-12 11:53:43'),
	('1da33526-ad7e-430f-ad71-44aed311c296', '66698ce737b244ef54a359c8', 'https://ik.imagekit.io/uvma3bkbp/desaku/fikri-rasyid-IBb_Y65z5ZU-unsplash%20(2)_FjElb7X0B.jpg', '2024-06-12 11:56:23'),
	('14067f9f-6b20-41d5-8588-2a8f3225e37b', '66698e6237b244ef54ad586f', 'https://ik.imagekit.io/uvma3bkbp/desaku/helene-nguyen-UG87YRaLpL8-unsplash_D3XvnJtbl.jpg', '2024-06-12 12:02:42'),
	('f4726aec-8018-441b-9b0d-8cd7d5b29ea8', '66698ecd37b244ef54b11be2', 'https://ik.imagekit.io/uvma3bkbp/desaku/ivan-hermawan-ju3cS0vqlhY-unsplash_o-ajAPFdC.jpg', '2024-06-12 12:04:29'),
	('27363c99-326b-4fa2-a5b5-73c90a8f4a12', '66698edd37b244ef54b1c30e', 'https://ik.imagekit.io/uvma3bkbp/desaku/ruben-hutabarat-VCJpIYAX_AU-unsplash_jG8Al3pcD.jpg', '2024-06-12 12:04:45'),
	('7f0023da-3a4c-4029-9eea-153b6e4b4a2a', '66698f1837b244ef54b33572', 'https://ik.imagekit.io/uvma3bkbp/desaku/ds_d6onoSg2m.jpg', '2024-06-12 12:05:44'),
	('a61671e6-5aa6-4c83-b977-745138e055fe', '66698f3837b244ef54b41218', 'https://ik.imagekit.io/uvma3bkbp/desaku/fikri-rasyid-IBb_Y65z5ZU-unsplash%20(2)_Fu-Kr4Xer.jpg', '2024-06-12 12:06:16'),
	('de65d351-bc9d-4f80-8037-678f287542f2', '66698fd537b244ef54b96f2d', 'https://ik.imagekit.io/uvma3bkbp/desaku/tikus_fS58RoOxf.jpg', '2024-06-12 12:08:53'),
	('9e48f515-27b5-4685-9af2-9c5d9abbdd19', '6669908c37b244ef54c07baa', 'https://ik.imagekit.io/uvma3bkbp/desaku/ikn-proyek_q_j4uDa_q.jpg', '2024-06-12 12:11:56'),
	('17aa3592-9948-4f73-bfe5-0a65f51e5614', '666990ea37b244ef54c17cfc', 'https://ik.imagekit.io/uvma3bkbp/desaku/karangmiri_Oia7NfWtx.jpg', '2024-06-12 12:13:30'),
	('797b27b4-5f41-418b-8ab0-8cfff57cb131', '666991a837b244ef54c3a7f5', 'https://ik.imagekit.io/uvma3bkbp/desaku/6666f90a7969f-aksi-penolakan-tapera-yang-dilakukan-oleh-organisasi-mahasiswa-cipayung-plus-di-halaman-kantor-dprd-diy-senin-1062024_1265_711_7b1MFKMWB.jpg', '2024-06-12 12:16:40'),
	('2382f1c7-80b2-4c19-8533-76cfdaa53cce', '666991fa37b244ef54c47c2c', 'https://ik.imagekit.io/uvma3bkbp/desaku/bintekk-3730704934_otpwqLySP.webp', '2024-06-12 12:18:02'),
	('fb23c66f-e2ec-486a-bc82-071c03d76bd7', '6669926237b244ef54c6576c', 'https://ik.imagekit.io/uvma3bkbp/desaku/IMG-20240611-WA0008-954928265_F01FD4q1D.webp', '2024-06-12 12:19:46'),
	('c35bf6a4-ce55-46ac-b389-78d0a7e8b456', '666992d937b244ef54c93852', 'https://ik.imagekit.io/uvma3bkbp/desaku/Most_Outstanding_Women_20241JPG-2448972759_ZtskFWXLd.webp', '2024-06-12 12:21:45');

CREATE TABLE IF NOT EXISTS `gambar_beranda` (
  `uuid` char(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `gambar_beranda` (`uuid`, `description`, `url`, `created_at`, `updated_at`) VALUES
	('b8ac100c-832d-42fb-bc06-d901bb20ff34', 'Jajanan Khas Kelapa Bakar', 'https://ik.imagekit.io/uvma3bkbp/desaku/helene-nguyen-UG87YRaLpL8-unsplash_D3XvnJtbl.jpg', '2024-06-12 12:02:47', '2024-06-12 12:02:47'),
	('4f96fdba-f129-420e-a4f5-56cbff56141d', 'Keindahan Tepi Desa', 'https://ik.imagekit.io/uvma3bkbp/desaku/ds_d6onoSg2m.jpg', '2024-06-12 12:05:51', '2024-06-12 12:05:51'),
	('735b71e6-2891-41ba-98f5-8f83fc7d4bb9', 'Kegiatan Becak di Pasar Tradisional', 'https://ik.imagekit.io/uvma3bkbp/desaku/fikri-rasyid-IBb_Y65z5ZU-unsplash%20(2)_Fu-Kr4Xer.jpg', '2024-06-12 12:06:21', '2024-06-12 12:06:21');

CREATE TABLE IF NOT EXISTS `gambar_galeri` (
  `uuid` char(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `url` char(200) DEFAULT NULL,
  `user_id` char(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `header` (
  `uuid` char(50) DEFAULT NULL,
  `no_telp` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `logo` text,
  `site_name` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `header` (`uuid`, `no_telp`, `email`, `logo`, `site_name`, `description`) VALUES
	('1', '022-3123-222', 'admin@demangan.desaku.id', 'https://ik.imagekit.io/uvma3bkbp/desaku/logo_header%20(2)_xXPbuDCGq.png', 'Desa Demangan', 'Kabupaten Sleman');

CREATE TABLE IF NOT EXISTS `jabatan` (
  `uuid` char(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `order` tinyint DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB;

INSERT INTO `jabatan` (`uuid`, `name`, `order`) VALUES
	('bfb5092c-d32a-4da8-a754-3de6ea51271f', 'Ketua RW', 2),
	('3a84ee5a-f017-43ae-adc0-c136b56c313b', 'Ketua RT', 3),
	('82dc2752-23cc-4f9f-a535-3749662fec81', 'Kepala Desa', 1);

CREATE TABLE IF NOT EXISTS `kategori_berita` (
  `uuid` char(50) DEFAULT NULL,
  `name` char(200) DEFAULT NULL,
  `slug` char(200) DEFAULT NULL,
  `user_id` char(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `kategori_berita` (`uuid`, `name`, `slug`, `user_id`, `created_at`) VALUES
	('859f39a9-b0c4-4811-a741-2e2eb8473205', 'Informasi Umum', 'informasi-umum', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-05-31 13:20:44'),
	('f3eb3ccf-6cf2-4bcf-9c35-c4d7dffdecbf', 'Pendidikan', 'pendidikan', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-05-31 13:20:47'),
	('4dce6db5-8a37-42c9-a632-f452f3d0a40a', 'Ekonomi', 'ekonomi', '376738e4-d859-42a5-b50c-728fab99dd49', NULL),
	('3d660b0b-3598-409f-be62-42644a55c588', 'Keuangan', 'keuangan', '376738e4-d859-42a5-b50c-728fab99dd49', NULL);

CREATE TABLE IF NOT EXISTS `kategori_potensi` (
  `uuid` char(50) DEFAULT NULL,
  `name` char(200) DEFAULT NULL,
  `slug` char(200) DEFAULT NULL,
  `user_id` char(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `kategori_potensi` (`uuid`, `name`, `slug`, `user_id`, `created_at`) VALUES
	('1d41331a-eb37-4941-8d44-6b0e32671717', 'Potensi Peternakan', 'potensi-peternakan', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-05-31 13:20:39'),
	('e861055a-89b7-484f-9a0d-c30ea358deef', 'Potensi Pariwisata', 'potensi-pariwisata', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-05-31 13:20:40');

CREATE TABLE IF NOT EXISTS `kegiatan` (
  `uuid` char(50) DEFAULT NULL,
  `title` text,
  `slug` varchar(100) DEFAULT NULL,
  `description` text,
  `thumbnail` varchar(200) DEFAULT NULL,
  `content` text,
  `user_id` char(50) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `lembaga` (
  `uuid` char(50) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `surname` char(50) DEFAULT NULL,
  `visi` text,
  `address` text,
  `tugas` text,
  `profile` text,
  `image` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `lokasi_desa` (
  `uuid` char(50) DEFAULT NULL,
  `desa` char(50) DEFAULT NULL,
  `kecamatan` char(50) DEFAULT NULL,
  `kabupaten` char(50) DEFAULT NULL,
  `kelurahan` char(50) DEFAULT NULL,
  `maps` longtext,
  `rt` char(50) DEFAULT NULL,
  `rw` char(50) DEFAULT NULL,
  `provinsi` char(50) DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `lokasi_desa` (`uuid`, `desa`, `kecamatan`, `kabupaten`, `kelurahan`, `maps`, `rt`, `rw`, `provinsi`) VALUES
	('1', 'Demangan', 'Selomartani', 'Sleman Barat', NULL, '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63423.036076987206!2d107.180374!3d-6.5292935!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69a3f6e5d5c351%3A0xcbb6af6ec515730a!2sMedalsari%2C%20Kec.%20Pangkalan%2C%20Karawang%2C%20Jawa%20Barat!5e0!3m2!1sid!2sid!4v1717379498766!5m2!1sid!2sid" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>', '06', '06', 'Jawa Barat');

CREATE TABLE IF NOT EXISTS `pengumuman` (
  `uuid` char(50) DEFAULT NULL,
  `title` text,
  `slug` varchar(200) DEFAULT NULL,
  `description` text,
  `content` text,
  `user_id` char(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `pengumuman` (`uuid`, `title`, `slug`, `description`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
	('8cde0233-9940-4081-9dbb-eadca9e6115b', 'Jadwal Pemilihan Ulang Mitra Kerjasama Pemanfaatan (KSP) Mal Dan Hotel Di Jalan Malioboro Nomor 52 - 58 Yogyakarta', 'jadwal-pemilihan-ulang-mitra-kerjasama-pemanfaatan-ksp-mal-dan-hotel-di-jalan-malioboro-nomor-52-58-yogyakarta', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque.', '<p class="ql-align-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque. Quisque neque felis, consequat sit amet dignissim pellentesque, tincidunt quis purus. Nullam in orci quis eros porttitor ultrices. In vel arcu a massa molestie tincidunt at posuere nisi. Nulla facilisi. Aenean ut semper diam. Maecenas sodales, massa in consectetur fermentum, felis ex lobortis nunc, sed molestie ligula metus eget massa. Aliquam hendrerit dolor sed sem pretium ultricies sit amet at nulla. Integer nec diam non leo sodales feugiat vitae a velit. Fusce ut orci ex.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Vestibulum viverra nulla vel consectetur egestas. Nulla sagittis magna ut ipsum vestibulum, eu rutrum odio aliquam. Pellentesque cursus vel risus a vehicula. Vestibulum lectus ipsum, fringilla dignissim ipsum non, cursus vestibulum nisl. Fusce eget hendrerit mi. Aliquam condimentum ac tortor non egestas. Nunc a magna nec diam mattis accumsan. Aliquam dolor tellus, euismod non porttitor eu, posuere id magna. Suspendisse sit amet blandit nulla. Ut metus nisl, ullamcorper quis venenatis at, interdum a arcu. Ut non eros elit. Aenean quis nibh at turpis tempor faucibus nec sit amet velit. Morbi volutpat vitae orci et rhoncus. Quisque sed vestibulum nulla, id cursus urna.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Fusce semper ornare porta. Fusce vehicula elit nisl, vitae varius nisi convallis tempus. Integer mollis purus et tellus laoreet congue. Maecenas a pretium est. Donec rhoncus mi eu nunc euismod, a dignissim nibh lacinia. Sed venenatis, risus sed vehicula posuere, ipsum turpis vestibulum tellus, eget convallis neque sem vel est. Integer lectus dolor, faucibus eu laoreet id, molestie id lorem. Mauris aliquet augue nec egestas condimentum. Nam nec nunc nec eros pharetra pulvinar. Quisque quam dui, auctor quis malesuada eget, tincidunt id elit. Ut mattis, urna non dignissim molestie, massa dui imperdiet libero, quis egestas orci orci vitae est.</p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:25:10', '2024-06-12 12:25:35'),
	('b05ea29e-25ac-4d2d-8c48-2b8f6b07f7ee', 'Jadwal Pemilihan Ulang Mitra Kerjasama Pemanfaatan (KSP) Mal', 'jadwal-pemilihan-ulang-mitra-kerjasama-pemanfaatan-ksp-mal', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque.', '<p class="ql-align-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque. Quisque neque felis, consequat sit amet dignissim pellentesque, tincidunt quis purus. Nullam in orci quis eros porttitor ultrices. In vel arcu a massa molestie tincidunt at posuere nisi. Nulla facilisi. Aenean ut semper diam. Maecenas sodales, massa in consectetur fermentum, felis ex lobortis nunc, sed molestie ligula metus eget massa. Aliquam hendrerit dolor sed sem pretium ultricies sit amet at nulla. Integer nec diam non leo sodales feugiat vitae a velit. Fusce ut orci ex.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Vestibulum viverra nulla vel consectetur egestas. Nulla sagittis magna ut ipsum vestibulum, eu rutrum odio aliquam. Pellentesque cursus vel risus a vehicula. Vestibulum lectus ipsum, fringilla dignissim ipsum non, cursus vestibulum nisl. Fusce eget hendrerit mi. Aliquam condimentum ac tortor non egestas. Nunc a magna nec diam mattis accumsan. Aliquam dolor tellus, euismod non porttitor eu, posuere id magna. Suspendisse sit amet blandit nulla. Ut metus nisl, ullamcorper quis venenatis at, interdum a arcu. Ut non eros elit. Aenean quis nibh at turpis tempor faucibus nec sit amet velit. Morbi volutpat vitae orci et rhoncus. Quisque sed vestibulum nulla, id cursus urna.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Fusce semper ornare porta. Fusce vehicula elit nisl, vitae varius nisi convallis tempus. Integer mollis purus et tellus laoreet congue. Maecenas a pretium est. Donec rhoncus mi eu nunc euismod, a dignissim nibh lacinia. Sed venenatis, risus sed vehicula posuere, ipsum turpis vestibulum tellus, eget convallis neque sem vel est. Integer lectus dolor, faucibus eu laoreet id, molestie id lorem. Mauris aliquet augue nec egestas condimentum. Nam nec nunc nec eros pharetra pulvinar. Quisque quam dui, auctor quis malesuada eget, tincidunt id elit. Ut mattis, urna non dignissim molestie, massa dui imperdiet libero, quis egestas orci orci vitae est.</p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:26:19', '2024-06-12 12:26:19'),
	('b4ebc9d7-5fa9-4871-b9e0-5b4496a51d01', 'Pengumuman Pengadaan Pegawai Pemerintah dengan Perjanjian Kerja (PPPK) Tenaga Teknis Di Lingkungan Pemerintah', 'pengumuman-pengadaan-pegawai-pemerintah-dengan-perjanjian-kerja-pppk-tenaga-teknis-di-lingkungan-pemerintah', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque. Quisque neque felis, consequat sit amet dignissim pellentesque, tincidunt quis purus.', '<p class="ql-align-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque. Quisque neque felis, consequat sit amet dignissim pellentesque, tincidunt quis purus. Nullam in orci quis eros porttitor ultrices. In vel arcu a massa molestie tincidunt at posuere nisi. Nulla facilisi. Aenean ut semper diam. Maecenas sodales, massa in consectetur fermentum, felis ex lobortis nunc, sed molestie ligula metus eget massa. Aliquam hendrerit dolor sed sem pretium ultricies sit amet at nulla. Integer nec diam non leo sodales feugiat vitae a velit. Fusce ut orci ex.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Vestibulum viverra nulla vel consectetur egestas. Nulla sagittis magna ut ipsum vestibulum, eu rutrum odio aliquam. Pellentesque cursus vel risus a vehicula. Vestibulum lectus ipsum, fringilla dignissim ipsum non, cursus vestibulum nisl. Fusce eget hendrerit mi. Aliquam condimentum ac tortor non egestas. Nunc a magna nec diam mattis accumsan. Aliquam dolor tellus, euismod non porttitor eu, posuere id magna. Suspendisse sit amet blandit nulla. Ut metus nisl, ullamcorper quis venenatis at, interdum a arcu. Ut non eros elit. Aenean quis nibh at turpis tempor faucibus nec sit amet velit. Morbi volutpat vitae orci et rhoncus. Quisque sed vestibulum nulla, id cursus urna.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Fusce semper ornare porta. Fusce vehicula elit nisl, vitae varius nisi convallis tempus. Integer mollis purus et tellus laoreet congue. Maecenas a pretium est. Donec rhoncus mi eu nunc euismod, a dignissim nibh lacinia. Sed venenatis, risus sed vehicula posuere, ipsum turpis vestibulum tellus, eget convallis neque sem vel est. Integer lectus dolor, faucibus eu laoreet id, molestie id lorem. Mauris aliquet augue nec egestas condimentum. Nam nec nunc nec eros pharetra pulvinar. Quisque quam dui, auctor quis malesuada eget, tincidunt id elit. Ut mattis, urna non dignissim molestie, massa dui imperdiet libero, quis egestas orci orci vitae est.</p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:27:16', '2024-06-12 12:27:16'),
	('bc79f04b-d23a-4726-a9bf-682fa2325cc4', 'Pengumuman Test Wawancara Calon Direksi PT. AMI', 'pengumuman-test-wawancara-calon-direksi-pt-ami', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque.', '<p class="ql-align-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque. Quisque neque felis, consequat sit amet dignissim pellentesque, tincidunt quis purus. Nullam in orci quis eros porttitor ultrices. In vel arcu a massa molestie tincidunt at posuere nisi. Nulla facilisi. Aenean ut semper diam. Maecenas sodales, massa in consectetur fermentum, felis ex lobortis nunc, sed molestie ligula metus eget massa. Aliquam hendrerit dolor sed sem pretium ultricies sit amet at nulla. Integer nec diam non leo sodales feugiat vitae a velit. Fusce ut orci ex.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Vestibulum viverra nulla vel consectetur egestas. Nulla sagittis magna ut ipsum vestibulum, eu rutrum odio aliquam. Pellentesque cursus vel risus a vehicula. Vestibulum lectus ipsum, fringilla dignissim ipsum non, cursus vestibulum nisl. Fusce eget hendrerit mi. Aliquam condimentum ac tortor non egestas. Nunc a magna nec diam mattis accumsan. Aliquam dolor tellus, euismod non porttitor eu, posuere id magna. Suspendisse sit amet blandit nulla. Ut metus nisl, ullamcorper quis venenatis at, interdum a arcu. Ut non eros elit. Aenean quis nibh at turpis tempor faucibus nec sit amet velit. Morbi volutpat vitae orci et rhoncus. Quisque sed vestibulum nulla, id cursus urna.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Fusce semper ornare porta. Fusce vehicula elit nisl, vitae varius nisi convallis tempus. Integer mollis purus et tellus laoreet congue. Maecenas a pretium est. Donec rhoncus mi eu nunc euismod, a dignissim nibh lacinia. Sed venenatis, risus sed vehicula posuere, ipsum turpis vestibulum tellus, eget convallis neque sem vel est. Integer lectus dolor, faucibus eu laoreet id, molestie id lorem. Mauris aliquet augue nec egestas condimentum. Nam nec nunc nec eros pharetra pulvinar. Quisque quam dui, auctor quis malesuada eget, tincidunt id elit. Ut mattis, urna non dignissim molestie, massa dui imperdiet libero, quis egestas orci orci vitae est.</p><p><br></p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:29:42', '2024-06-12 12:29:42'),
	('7a2d527b-6339-480c-860b-82c24bb87bc4', 'Pengumuman Pendaftaran Anggota Lembaga Ombudsman DIY Periode Tahun 2024-2028', 'pengumuman-pendaftaran-anggota-lembaga-ombudsman-diy-periode-tahun-2024-2028', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque.', '<p class="ql-align-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque. Quisque neque felis, consequat sit amet dignissim pellentesque, tincidunt quis purus. Nullam in orci quis eros porttitor ultrices. In vel arcu a massa molestie tincidunt at posuere nisi. Nulla facilisi. Aenean ut semper diam. Maecenas sodales, massa in consectetur fermentum, felis ex lobortis nunc, sed molestie ligula metus eget massa. Aliquam hendrerit dolor sed sem pretium ultricies sit amet at nulla. Integer nec diam non leo sodales feugiat vitae a velit. Fusce ut orci ex.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Vestibulum viverra nulla vel consectetur egestas. Nulla sagittis magna ut ipsum vestibulum, eu rutrum odio aliquam. Pellentesque cursus vel risus a vehicula. Vestibulum lectus ipsum, fringilla dignissim ipsum non, cursus vestibulum nisl. Fusce eget hendrerit mi. Aliquam condimentum ac tortor non egestas. Nunc a magna nec diam mattis accumsan. Aliquam dolor tellus, euismod non porttitor eu, posuere id magna. Suspendisse sit amet blandit nulla. Ut metus nisl, ullamcorper quis venenatis at, interdum a arcu. Ut non eros elit. Aenean quis nibh at turpis tempor faucibus nec sit amet velit. Morbi volutpat vitae orci et rhoncus. Quisque sed vestibulum nulla, id cursus urna.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Fusce semper ornare porta. Fusce vehicula elit nisl, vitae varius nisi convallis tempus. Integer mollis purus et tellus laoreet congue. Maecenas a pretium est. Donec rhoncus mi eu nunc euismod, a dignissim nibh lacinia. Sed venenatis, risus sed vehicula posuere, ipsum turpis vestibulum tellus, eget convallis neque sem vel est. Integer lectus dolor, faucibus eu laoreet id, molestie id lorem. Mauris aliquet augue nec egestas condimentum. Nam nec nunc nec eros pharetra pulvinar. Quisque quam dui, auctor quis malesuada eget, tincidunt id elit. Ut mattis, urna non dignissim molestie, massa dui imperdiet libero, quis egestas orci orci vitae est.</p><p><br></p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:30:09', '2024-06-12 12:30:09'),
	('1635e42d-7533-4db8-b90b-1b86dc675ac9', 'Pengumuman Seleksi Calon Anggota Direksi Perseroan Terbatas (PT) Anindya Mitra Internasional', 'pengumuman-seleksi-calon-anggota-direksi-perseroan-terbatas-pt-anindya-mitra-internasional', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque.', '<p class="ql-align-justify">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vel tortor lorem. Morbi venenatis porta nisi, porttitor elementum sem placerat quis. Nunc tincidunt quis ligula ornare pellentesque. Quisque neque felis, consequat sit amet dignissim pellentesque, tincidunt quis purus. Nullam in orci quis eros porttitor ultrices. In vel arcu a massa molestie tincidunt at posuere nisi. Nulla facilisi. Aenean ut semper diam. Maecenas sodales, massa in consectetur fermentum, felis ex lobortis nunc, sed molestie ligula metus eget massa. Aliquam hendrerit dolor sed sem pretium ultricies sit amet at nulla. Integer nec diam non leo sodales feugiat vitae a velit. Fusce ut orci ex.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Vestibulum viverra nulla vel consectetur egestas. Nulla sagittis magna ut ipsum vestibulum, eu rutrum odio aliquam. Pellentesque cursus vel risus a vehicula. Vestibulum lectus ipsum, fringilla dignissim ipsum non, cursus vestibulum nisl. Fusce eget hendrerit mi. Aliquam condimentum ac tortor non egestas. Nunc a magna nec diam mattis accumsan. Aliquam dolor tellus, euismod non porttitor eu, posuere id magna. Suspendisse sit amet blandit nulla. Ut metus nisl, ullamcorper quis venenatis at, interdum a arcu. Ut non eros elit. Aenean quis nibh at turpis tempor faucibus nec sit amet velit. Morbi volutpat vitae orci et rhoncus. Quisque sed vestibulum nulla, id cursus urna.</p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Fusce semper ornare porta. Fusce vehicula elit nisl, vitae varius nisi convallis tempus. Integer mollis purus et tellus laoreet congue. Maecenas a pretium est. Donec rhoncus mi eu nunc euismod, a dignissim nibh lacinia. Sed venenatis, risus sed vehicula posuere, ipsum turpis vestibulum tellus, eget convallis neque sem vel est. Integer lectus dolor, faucibus eu laoreet id, molestie id lorem. Mauris aliquet augue nec egestas condimentum. Nam nec nunc nec eros pharetra pulvinar. Quisque quam dui, auctor quis malesuada eget, tincidunt id elit. Ut mattis, urna non dignissim molestie, massa dui imperdiet libero, quis egestas orci orci vitae est.</p><p><br></p>', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-12 12:30:38', '2024-06-12 12:30:38');

CREATE TABLE IF NOT EXISTS `perangkat_desa` (
  `uuid` char(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `slug` text,
  `nip` tinytext,
  `visi` text,
  `job` varchar(200) DEFAULT NULL,
  `job_id` char(50) DEFAULT NULL,
  `image` text,
  `created_at` datetime DEFAULT NULL,
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `potensi_desa` (
  `uuid` char(50) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `slug` text,
  `description` text,
  `category` varchar(200) DEFAULT NULL,
  `thumbnail` text,
  `user_id` char(50) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `profil_desa` (
  `uuid` char(36) NOT NULL,
  `visi` longtext NOT NULL,
  `tentang` longtext,
  `sejarah` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB;

INSERT INTO `profil_desa` (`uuid`, `visi`, `tentang`, `sejarah`, `created_at`, `updated_at`) VALUES
	('1', '<p><strong>VISI : “ Terwujudnya Masyarakat Pangkalan yang aman tertib, maju, demokratis, dan berdayaguna dengan bertumpu pada sumber daya manusia yang berkualitas”</strong> </p><p>TUJUAN DAN SASARAN </p><p><strong>Misi 1. “Meningkatkan kualitas kenerja pelayanan publik lingkup kecamatan” </strong></p><p>Tujuan : a. Meningkatkan kapasitas kelembagaan dan ketatalaksanaan kecamatan; </p><p>b. Memberikan pelayanan administrasi public yang telah dilaksanakan di kecamatan; </p><p>Sasaran: a. Meningkatkan kapasitas SDM aparatur; </p><p>b. Terpenuhinya kebutuhan sarana dan prasarana perkantoran; </p><p>c. Terpenuhinya kebutuhan administrasi perkantoran;</p><p>d. Terselenggaranya administrasi kependudukan, perijinan terbatas dan kegiatan administrasi lainnya sesuai penugasan. </p><p><br></p><p><strong>Misi 2. “Meningkatkan kualitas fungsi koordinasi penyelenggaraan pemerintahan umum lingkup kecamatan” </strong></p><p>Tujuan: a. Mengembangkan pola koordinasi, pemerintahan dan pembangunan antar instansi di wilayah kecamatan; </p><p>b. Meningkatkan pelaksanaan fasilitas penyelenggaraan pemerintahan desa dan pembangunan pedesaan; </p><p>Sasaran: a. Meningkatnya koordinasi, itegritas, sinergritas dan singkronisasi penyelenggaraan fungsi pemerintahan dan pembangunan diwilayah kecamatan; </p><p>b. Meningkatkan kapasitas kelembagaan dan kinerja penyelenggaraan pemerintah desa dan pembangunan pedesaan. </p><p><br></p><p><strong>Misi 3. “Meningkatkan Pemberdayaan Masyarakat” </strong></p><p>Tujuan: Meningkatkan peran masyarakat dan lembaga kemasyarakatan di wilayah kecamatan Sasaran: a. Meningkatnya aktivitas sosial dan keagamaan di masyarakat; </p><p>b. Mendorong terciptanya pembangunan daerah di wilayah kecamatan. 1.1 STRATEGI DAN KEBIJAKAN Misi 1. “Meningkatkan kualitas kenerja pelayanan publik lingkup kecamatan” </p><p>Strategi : a. Pengembangan konpentensi aparatur kecamatan; </p><p>b. Pengadaan sarana dan prasarana perkantoran; </p><p>c. Penyediaan administrasi pelayanan perkantoran; </p><p>d. Penyediaan pelayanan administrasi publik sesuai pendelegasian dari bupati. </p><p>Kebijakan: a. Mengikutsertakan aparatur kecamatan dalam pelaksanaan kegiatan bintek/diklat/workshop/sosialiasasi; </p><p>b. Melaksanakan pengadaan sesuai rencana kebutuhan barang; </p><p>c. Menyediakan kebutuhan administrasi pelayanan perkantoran; </p><p>d. Pelayanan administrasi publik sesuai standar dan prosedur yang berlaku. </p><p><br></p><p><strong>Misi 2. “Meningkatkan kualitas fungsi koordinasi penyelenggaraan pemerintahan umum lingkup kecamatan” </strong></p><p>Strategi : a. Penyelenggaraan koordinasi integrasi sinergritas dan singkronisasi kegiatan pemerintahan umum ditingkat wilayah; </p><p>b. Pembinaan administrasi, kelembagaan dan SDM penyelenggara pemerintah desa. </p><p>Kebijakan: a. Mengoptimalkan peran kecamatan dalam penyelenggaraan kegiatan pemerintahan umum; </p><p>b. Meningkatkan konpentensi SDM penyelenggara pemerintah desa; </p><p>c. Penyelenggaraan tertib administrasi pemerintah desa. </p><p><br></p><p><strong>Misi 3. “Meningkatkan pemberdayaan masyarakat” </strong></p><p>Strategi : a. Fasilitas dan pembinaan kegiatan sosial dan keagamaan di masyarakat; </p><p>b. Pelaksanaan penyusunan perencanaan pembangunan secara partisipatif di wilayah kecamatan. </p><p>Kebijakan: a. Menyediakan, fasilitasi dan stimulasi bagi terselenggaranya kegiatan sosial dan keagamaan di masyarakat; </p><p>b. Meningkatkan kualitas proses dan hasil penyusunan rencana pembangunan wilayah kecamatan.&nbsp;</p>', '<p><span style="color: rgb(32, 33, 36);">Desa Medalsari merupakan&nbsp;</span><span style="background-color: rgb(211, 227, 253);">salah satu desa yeng memiliki objek wisata alam</span><span style="color: rgb(32, 33, 36);">, Desa Medalsari berada di Kecamatan Pangkalan Kabupaten Karawang, terletak 43 km dari kota Karawang dan 14 km jarak dari Kecamatan pangkalan. Desa Medalsari memiliki luas ±1.471.38 Ha dan memiliki jumlah penduduk sebanyak 3790 jiwa.</span></p><p><span style="color: rgb(112, 117, 122);">27 Des 2023.</span></p>', '<p><strong>Desa Medalsari </strong>merupakan salah satu desa yang berada di Kecamatan Pangkalan, Kabupaten Karawang, Jawa Barat. Untuk memberikan gambaran lebih jelas tentang sejarah desa ini, beberapa poin penting dapat diuraikan sebagai berikut:</p><p><br></p><p><strong>Asal Usul dan Nama Desa</strong></p><p>Nama Medalsari berasal dari dua kata dalam bahasa Sunda, yaitu "medal" yang berarti muncul atau lahir, dan "sari" yang berarti inti atau esensi. Dengan demikian, Medalsari dapat diartikan sebagai "lahirnya esensi" atau "munculnya inti". Nama ini kemungkinan besar mencerminkan harapan atau filosofi masyarakat setempat tentang desa ini.</p><p><br></p><p><strong>Sejarah Pembentukan</strong></p><p>Desa Medalsari kemungkinan dibentuk sebagai hasil pemekaran dari desa atau wilayah yang lebih besar pada masa lalu. Seperti banyak desa lainnya di Indonesia, proses pembentukan desa ini mungkin dipengaruhi oleh faktor-faktor seperti pertumbuhan populasi, kebutuhan administratif, dan pengelolaan sumber daya alam.</p><p><br></p><p><strong>Perkembangan Ekonomi dan Sosial</strong></p><p>Selama perkembangannya, Desa Medalsari mengalami perubahan dan perkembangan di berbagai aspek:</p><p>- Pertanian: Sebagian besar penduduk Desa Medalsari mungkin bekerja sebagai petani, dengan komoditas utama berupa padi, sayuran, dan tanaman palawija lainnya.</p><p>- Perkebunan dan Kehutanan: Karena terletak di daerah yang mungkin memiliki potensi alam berupa hutan atau lahan perkebunan, sektor ini juga bisa menjadi sumber penghidupan bagi warga desa.</p><p>- Kehidupan Sosial dan Budaya: Tradisi dan budaya Sunda sangat mungkin masih kental di desa ini, dengan adat istiadat dan kegiatan sosial yang mencerminkan nilai-nilai kearifan lokal.</p><p><br></p><p><strong>Infrastruktur dan Fasilitas Umum</strong></p><p>Seiring berjalannya waktu, pembangunan infrastruktur seperti jalan, fasilitas pendidikan, dan layanan kesehatan di Desa Medalsari terus mengalami peningkatan. Pemerintah daerah maupun desa berupaya untuk menyediakan fasilitas yang memadai bagi warganya.</p><p><br></p><p><strong>Peran Pemerintah dan Swadaya Masyarakat</strong></p><p>Pemerintah desa bersama masyarakat berperan aktif dalam membangun dan mengembangkan Desa Medalsari. Swadaya masyarakat seringkali menjadi motor penggerak utama dalam berbagai kegiatan pembangunan dan pengembangan desa.</p><p><br></p><p><strong>Tantangan dan Prospek</strong></p><p>Seperti desa-desa lainnya, Medalsari menghadapi tantangan seperti perubahan iklim, urbanisasi, dan perubahan sosial ekonomi. Namun, dengan potensi sumber daya alam dan semangat gotong royong masyarakat, desa ini memiliki prospek untuk terus berkembang dan meningkatkan kesejahteraan warganya.</p>', '2024-04-24 02:54:22', '2024-05-08 19:31:30');

CREATE TABLE IF NOT EXISTS `reset_password` (
  `uuid` char(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `token` char(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS `sosial_media` (
  `name` text,
  `link` text
) ENGINE=InnoDB;

INSERT INTO `sosial_media` (`name`, `link`) VALUES
	('Instagram', 'asasas'),
	('Twitter', 'halo'),
	('Whatsapp', 'a'),
	('Youtube', 'a');

CREATE TABLE IF NOT EXISTS `struktur_organisasi` (
  `uuid` char(50) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB;

INSERT INTO `struktur_organisasi` (`uuid`, `content`) VALUES
	('1', '<p><span style="color: rgb(4, 12, 40);">Struktur organisasi</span><span style="color: rgb(32, 33, 36);">&nbsp;adalah sistem yang digunakan untuk mendefinisikan hierarki dalam sebuah&nbsp;</span><span style="color: rgb(4, 12, 40);">organisasi</span><span style="color: rgb(32, 33, 36);">&nbsp;dengan tujuan menetapkan cara sebuah&nbsp;</span><span style="color: rgb(4, 12, 40);">organisasi</span><span style="color: rgb(32, 33, 36);">&nbsp;dapat beroperasi, dan membantu&nbsp;</span><span style="color: rgb(4, 12, 40);">organisasi</span><span style="color: rgb(32, 33, 36);">&nbsp;tersebut dalam mencapai tujuan yang telah ditetapkan di masa depan. <span class="ql-cursor">﻿﻿</span></span></p>');

CREATE TABLE IF NOT EXISTS `user` (
  `uuid` char(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `name` char(50) DEFAULT NULL,
  `password` char(50) DEFAULT NULL,
  `is_admin` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `user` (`uuid`, `email`, `name`, `password`, `is_admin`, `created_at`) VALUES
	('376738e4-d859-42a5-b50c-728fab99dd49', 'admin@desaku.id', 'Jokowi Dodo', '123', 1, '2024-05-31 13:19:43'),
	('c2a7d546-b5f7-43a0-a71c-363c9019efb3', 'ichsanfadhil67@gmail.com', 'Muhammad Ichsan', '123', 0, '2024-05-31 13:19:46');

CREATE TABLE IF NOT EXISTS `video_galeri` (
  `uuid` char(50) DEFAULT NULL,
  `description` text,
  `url` text,
  `user_id` char(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB;

INSERT INTO `video_galeri` (`uuid`, `description`, `url`, `user_id`, `created_at`) VALUES
	('25ea88f1-e0a6-456e-8efa-88964a80c880', 'KABAR GELAR BAKTI SOSIAL JUMAT BERKAH DI DESA MEDALSARI PANGKALAN', 'https://www.youtube.com/embed/usoLOZPukXc?si=Dn9WexktsCRtzyKq', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-03 20:12:35'),
	('c9edf264-ff36-4d17-b91d-ee2b6ee52298', 'PENGEBORAN SUMUR DI DESA MEDALSARI KECAMATAN PANGKALAN KAB. KARAWANG', 'https://www.youtube.com/embed/BwJP0bxUFDw?si=QHFD1KFoHd-DWz7_', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-03 20:12:36'),
	('eec6a7b8-8f7a-4f9b-ae02-5b128b5f41bb', 'Profile Medalsari', 'https://www.youtube.com/embed/HRDMutYaOSE?si=HWpgdGDz-s6wNaPT', '376738e4-d859-42a5-b50c-728fab99dd49', '2024-06-03 20:12:37');