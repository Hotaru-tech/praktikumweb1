#Nomor1
CREATE DATABASE AnandaPembelian009;
USE AnandaPembelian009;

#Nomor2
CREATE TABLE kue
(
kode_kue INT (5),
nama_kue VARCHAR(25)
);

#Nomor3
ALTER TABLE kue ADD COLUMN harga_satuan INT;

#Nomor4
ALTER TABLE kue ADD PRIMARY KEY (kode_kue);
ALTER TABLE kue CHANGE kode_kue pk_kue INT (5);

#Nomor5
CREATE TABLE bahan_baku
(
kode_bhn_baku INT(5),
nama_bhn_baku VARCHAR(25),
satuan INT,
PRIMARY KEY (kode_bhn_baku)
);

#Nomor6
CREATE TABLE bom
(
kode_kue INT(5),
kode_bhn_baku INT(5),
jumlah INT
);

#Nomor7
ALTER TABLE bom ADD FOREIGN KEY (kode_kue) REFERENCES kue(pk_kue);
ALTER TABLE bom CHANGE kode_kue fk_kode_kue INT(5);
ALTER TABLE bom ADD FOREIGN KEY (kode_bhn_baku) REFERENCES bahan_baku(kode_bhn_baku);
ALTER TABLE bom CHANGE kode_bhn_baku fk_kode_bhn_baku INT(5);

#Nomor8
ALTER TABLE bom ADD COLUMN keterangan VARCHAR(100);

#Nomor9
ALTER TABLE bom CHANGE keterangan keterangan TEXT;

#Nomor10
ALTER TABLE bom DROP keterangan;

#Nomor11
CREATE TABLE pembelian
(
no_nota INT(5),
tgl_beli DATE,
total_jual INT,
discount VARCHAR(10),
total_bayar VARCHAR(10),
jatuh_tempo DATE,
kode_pemasok INT(5),
CONSTRAINT kode_pemasok FOREIGN KEY (kode_pemasok) REFERENCES pemasok(kode_pemasok)
);

#Nomor12


#Nomor13
CREATE TABLE pemasok
(
kode_pemasok INT(5),
nama_pemasok VARCHAR(25),
PRIMARY KEY (kode_pemasok)
);

#Nomor14
CREATE TABLE pembelian
(
no_nota INT(5),
tgl_beli DATE,
total_jual INT,
discount VARCHAR(10),
total_bayar VARCHAR(10),
jatuh_tempo DATE,
kode_pemasok INT(5),
PRIMARY KEY (no_nota),
CONSTRAINT kode_pemasok FOREIGN KEY (kode_pemasok) REFERENCES pemasok(kode_pemasok)
);

#Nomor15
CREATE TABLE detail_beli
(
no_nota INT(5),
kode_bhn_baku INT(5),
harga_satuan INT(10),
subtotal INT(25),
jumlah INT(25),
CONSTRAINT no_nota FOREIGN KEY(no_nota) REFERENCES pembelian(no_nota),
CONSTRAINT kode_bhn_baku FOREIGN KEY(kode_bhn_baku) REFERENCES bahan_baku(kode_bhn_baku)
);

#Nomor16
ALTER TABLE detail_beli ADD PRIMARY KEY (kode_bhn_baku, no_nota);

#Nomor17
CREATE TABLE pembayaran
(
no_kuitansi INT(5),
no_nota INT(5),
total_bayar INT(10),
tgl_pelunasan DATE,
PRIMARY KEY(no_kuitansi),
CONSTRAINT FOREIGN KEY(no_nota) REFERENCES pembelian(no_nota)
);

#Nomor18
CREATE TABLE akun
(
kode_akun INT(5),
nama_akun VARCHAR(25),
header_akun VARCHAR(10),
PRIMARY KEY(kode_akun)
);

#Nomor19
CREATE TABLE jurnal_pembelian
(
no_nota INT(5),
kode_akun INT(5),
posisi_dr_cr VARCHAR(10),
nominal INT(10),
PRIMARY KEY(no_nota, kode_akun),
CONSTRAINT FOREIGN KEY(no_nota) REFERENCES pembelian(no_nota),
CONSTRAINT FOREIGN KEY(kode_akun) REFERENCES akun(kode_akun)
);

#Nomor20
CREATE TABLE jurnal_pembayaran
(
no_kuitansi INT(5),
kode_akun INT(5),
posisi_dr_cr VARCHAR(10),
nominal INT(10),
CONSTRAINT no_kuitansi FOREIGN KEY(no_kuitansi) REFERENCES pembayaran(no_kuitansi),
CONSTRAINT kode_akun FOREIGN KEY(kode_akun) REFERENCES akun(kode_akun)
);


