CREATE TABLE `users` (
  `id` int PRIMARY KEY,
  `nama_user` varchar(255),
  `email_user` varchar(255),
  `password_user` varchar(255),
  `foto_user` varchar(255),
  `level_user` tinyint,
  `remember_token` varchar(255),
  `created_at` timestamp,
  `deleted_at` timestamp
);

CREATE TABLE `kategori` (
  `id_kategori` int PRIMARY KEY,
  `nama_kategori` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `produk` (
  `id_produk` int PRIMARY KEY,
  `id_kategori` int,
  `nama_produk` varchar(255),
  `merk_produk` varchar(255),
  `harga_beli_produk` int,
  `diskon_produk` int,
  `harga_jual_produk` int,
  `stok_produk` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `member` (
  `id_member` int PRIMARY KEY,
  `kode_member` varchar(255),
  `nama_member` varchar(255),
  `alamat_member` text,
  `telepon_member` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `supplier` (
  `id_supplier` int PRIMARY KEY,
  `nama_supplier` varchar(255),
  `alamat_supplier` text,
  `telepon_supplier` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int PRIMARY KEY,
  `deskripsi_pengeluaran` text,
  `nominal_pengeluaran` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `pembelian` (
  `id_pembelian` int PRIMARY KEY,
  `id_supplier` int,
  `total_item_pembelian` int,
  `total_harga_pembelian` int,
  `diskon_pembelian` int,
  `bayar_pembelian` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `pembelian_detail` (
  `id_pembelian_detail` int PRIMARY KEY,
  `id_pembelian` int,
  `id_produk` int,
  `harga_pembelian_detail` int,
  `jumlah_pembelian_detail` int,
  `subtotal_pembelian_detail` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `penjualan` (
  `id_penjualan` int PRIMARY KEY,
  `id_member` int,
  `total_item_penjualan` int,
  `total_harga_penjualan` int,
  `diskon_penjualan` int,
  `bayar_penjualan` int,
  `diterima_penjualan` int,
  `id_user` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `penjualan_detail` (
  `id_penjualan_detail` int PRIMARY KEY,
  `id_penjualan` int,
  `id_produk` int,
  `harga_penjualan_detail` int,
  `jumlah_penjualan_detail` int,
  `diskon_penjualan_detail` int,
  `subtotal_penjualan_detail` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `setting` (
  `id_setting` int PRIMARY KEY,
  `alamat` text,
  `telepon` varchar(255),
  `path_logo` varchar(255),
  `tipe_nota` tinyint,
  `path_kartu_member` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

ALTER TABLE `produk` ADD FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);

ALTER TABLE `pembelian` ADD FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`);

ALTER TABLE `pembelian_detail` ADD FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`);

ALTER TABLE `pembelian_detail` ADD FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

ALTER TABLE `penjualan` ADD FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`);

ALTER TABLE `penjualan_detail` ADD FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`);

ALTER TABLE `penjualan_detail` ADD FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);
