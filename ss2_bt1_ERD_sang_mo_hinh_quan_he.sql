CREATE DATABASE cung_cap_vat_tu;
USE cung_cap_vat_tu;
CREATE TABLE phieu_xuat (
    so_phieu_xuat INT PRIMARY KEY,
    ngay_xuat DATE
);
CREATE TABLE phieu_nhap (
    so_phieu_nhap INT PRIMARY KEY,
    ngay_nhap DATE
);
CREATE TABLE vat_tu (
    ma_vat_tu INT PRIMARY KEY,
    ten_vat_tu VARCHAR(50)
); 
CREATE TABLE xuat_vat_tu (
    so_phieu_xuat INT,
    ma_vat_tu INT,
    don_gia_xuat FLOAT NOT NULL,
    so_luong_xuat INT NOT NULL,
    PRIMARY KEY (so_phieu_xuat , ma_vat_tu),
    FOREIGN KEY (so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);
CREATE TABLE nhap_vat_tu (
    so_phieu_nhap INT,
    ma_vat_tu INT,
    don_gia_nhap FLOAT NOT NULL,
    so_luong_nhap INT NOT NULL,
    PRIMARY KEY (so_phieu_nhap , ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap)
        REFERENCES phieu_nhap (so_phieu_nhap),
    FOREIGN KEY (ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);
CREATE TABLE so_dien_thoai_cung_cap (
	ma_nha_cung_cap VARCHAR(15),
    so_dien_thoai VARCHAR(12) PRIMARY KEY,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_so_dien_thoai)
);
CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap VARCHAR(15) PRIMARY KEY,
    ten_nha_cung_cap VARCHAR(50),
    dia_chi VARCHAR(50)
);
CREATE TABLE don_dat_hang (
    so_don_hang INT PRIMARY KEY,
    ma_nha_cung_cap VARCHAR(15),
    ngay_dat_hang DATE,
    FOREIGN KEY (ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);
CREATE TABLE vat_tu_dat_hang (
    ma_vat_tu INT,
    so_don_hang INT,
    PRIMARY KEY (ma_vat_tu , so_don_hang),
    FOREIGN KEY (ma_vat_Tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_don_hang)
        REFERENCES don_dat_hang (so_don_hang)
);