-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Jul 2020 pada 06.16
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `nim` int(8) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `prodi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_anggota`
--

INSERT INTO `tb_anggota` (`nim`, `nama`, `tempat_lahir`, `tgl_lahir`, `jk`, `prodi`) VALUES
(18060100, 'Ajeng', 'Tegal', '1999-04-05', 'P', 'Ilmu Komunikasi'),
(18070112, 'Eka', 'Tegal', '2000-02-09', 'P', 'Teknik Infromatika'),
(18090125, 'Fauzi', 'Brebes', '2000-03-03', 'L', 'Sistem Informasi'),
(189083846, 'okta', 'brebes', '2021-05-14', 'P', 'Kebidanan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id` int(9) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(150) NOT NULL,
  `tahun_terbit` varchar(4) NOT NULL,
  `isbn` varchar(25) NOT NULL,
  `jumlah_buku` int(4) NOT NULL,
  `lokasi` enum('rak1','rak2','rak3') NOT NULL,
  `tgl_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_buku`
--

INSERT INTO `tb_buku` (`id`, `judul`, `pengarang`, `penerbit`, `tahun_terbit`, `isbn`, `jumlah_buku`, `lokasi`, `tgl_input`) VALUES
(1, 'belajar laraver', 'asa', 'asas', '2018', '123456789', 6, 'rak3', '2020-04-11'),
(2, 'belajar codeigniter', 'dad', 'add', '2020', '1234567890', 10, 'rak3', '2020-04-11'),
(7, 'Android Studio', 'Ahmad Jalil', 'Muhammad Aziz', '2010', '54', 18, 'rak3', '2009-12-02'),
(8, 'photoshop', 'as', 'qwq', '2008', '121', 32, 'rak2', '2020-07-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id` int(9) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `isbn` varchar(25) NOT NULL,
  `nim` int(8) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `tgl_pinjam` varchar(30) NOT NULL,
  `tgl_kembali` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id`, `judul`, `isbn`, `nim`, `nama`, `tgl_pinjam`, `tgl_kembali`, `status`) VALUES
(1, 'belajar laraver', '', 18060100, 'Ajeng', '04-04-2020', '10-04-2020', 'kembali'),
(2, 'belajar codeigniter', '', 18070112, 'Eka', '10-07-2020', '15-07-2020', 'pinjam'),
(3, 'Photoshop', '', 18090125, 'Fauzi', '01-07-2020', '15-07-2020', 'pinjam'),
(4, 'belajar laraver', '', 18060100, 'Ajeng', '18-04-2020', '25-04-2020', 'kembali'),
(5, 'belajar laraver', '', 18060100, 'Ajeng', '18-04-2020 ', '09-05-2020', 'kembali'),
(6, 'JavaScript', '', 18060100, 'Ajeng', '21-04-2020 ', '05-05-2020', 'kembali'),
(7, 'belajar codeigniter', '', 18090125, 'Fauzi', '08-07-2020 ', '15-07-2020 ', 'kembali'),
(8, 'belajar laraver', '', 18060100, 'Ajeng', '08-07-2020 ', '15-07-2020 ', 'kembali'),
(9, 'JavaScript', '', 18060100, 'Ajeng', '08-07-2020 ', '15-07-2020 ', 'kembali'),
(10, 'belajar laraver', '', 189083846, 'okta', '13-07-2020 ', '27-07-2020', 'kembali'),
(11, 'Android Studio', '', 18060100, 'Ajeng', '13-07-2020 ', '20-07-2020 ', 'pinjam'),
(12, 'Android Studio', '', 18090125, 'Fauzi', '14-07-2020 ', '28-07-2020', 'pinjam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `level` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `nama`, `level`) VALUES
(1, 'admin', 'admin', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`nim`);

--
-- Indeks untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
