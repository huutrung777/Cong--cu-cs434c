create database if not exists phong_kham;
use phong_kham;
create table nguoi_dung (
    ma_nguoi_dung int auto_increment primary key,
    ho_ten varchar(50),
    email varchar(50) unique,
    mat_khau varchar(100),
    vai_tro varchar(20),
    ngay_sinh date,
    gioi_tinh varchar(10),
    dia_chi varchar(100),
    so_dien_thoai varchar(20),
    ngay_dang_ky datetime
);

create table ho_so_suc_khoe (
    ma_ho_so int auto_increment primary key,
    ma_nguoi_dung int,
    can_nang float,
    chieu_cao float,
    nhip_tim int,
    huyet_ap varchar(20),
    ngay_cap_nhat datetime,
    foreign key (ma_nguoi_dung) references nguoi_dung(ma_nguoi_dung)
);

create table benh_nen (
    ma_benh_nen int auto_increment primary key,
    ma_ho_so int,
    ten_benh_nen varchar(50),
    foreign key (ma_ho_so) references ho_so_suc_khoe(ma_ho_so)
);

create table chuan_doan (
    ma_chuan_doan int auto_increment primary key,
    ma_nguoi_dung int null,
    loai_chuan_doan varchar(50),
    ket_qua varchar(500),
    ngay_chuan_doan datetime,
    foreign key (ma_nguoi_dung) references nguoi_dung(ma_nguoi_dung)
);

create table trieu_chung (
    ma_trieu_chung int auto_increment primary key,
    ma_chuan_doan int,
    ten_trieu_chung varchar(100),
    foreign key (ma_chuan_doan) references chuan_doan(ma_chuan_doan)
);
create table dich_vu (
    ma_dich_vu int auto_increment primary key,
    ten_dich_vu varchar(100),
    mo_ta varchar(300)
);
create table dang_ky_dich_vu (
    ma_dang_ky int auto_increment primary key,
    ma_nguoi_dung int,
    ma_dich_vu int,
    ngay_dang_ky datetime,
    trang_thai varchar(50),
    foreign key (ma_nguoi_dung) references nguoi_dung(ma_nguoi_dung),
    foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table phan_hoi (
    ma_phan_hoi int auto_increment primary key,
    ma_nguoi_dung int,
    noi_dung varchar(300),
    ngay_gui datetime,
    foreign key (ma_nguoi_dung) references nguoi_dung(ma_nguoi_dung)
);

create table thong_bao (
    ma_thong_bao int auto_increment primary key,
    ma_nguoi_dung int,
    ngay_gui datetime,
    trang_thai varchar(20),
    foreign key (ma_nguoi_dung) references nguoi_dung(ma_nguoi_dung)
);

create table thong_ke_bao_cao (
    ma_bao_cao int auto_increment primary key,
    ngay_bao_cao datetime,
    so_luong_nguoi_dung int,
    so_luong_chuan_doan int,
    so_luong_phan_hoi int,
    ghi_chu varchar(200)
);
