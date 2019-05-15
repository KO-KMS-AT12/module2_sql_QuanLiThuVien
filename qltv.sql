use qltv;

create table SinhVien(
	ma_sv int(11) not null primary key auto_increment,
    ten_sv nvarchar(100) not null,
    ngay_sinh date not null,
	dia_chi nvarchar(200) not null,
    email nvarchar(80) not null,
    so_dien_thoai nvarchar(15) not null,
    anh_sinh_vien int 
);

create table Sach(
	ma_sach int(11) not null primary key auto_increment,
    ten_sach nvarchar(100) not null,
    the_loai int(11) not null,
    nha_xuat_ban nvarchar(100) not null,
    tac_gia nvarchar(100) not null,
    nam_xuat_ban nvarchar(4) not null,
    so_lan_xuat_ban nvarchar(2) not null,
    gia decimal(10,2),
    anh_sach int
);

alter table Sach
add constraint pk_tl_s foreign key (the_loai) references TheLoaiSach(id);

create table TheLoaiSach(
	id int(11) not null primary key auto_increment,
    ten_the_loai nvarchar(100) not null
);

create table QuanLi(
	ma_ql int(11) auto_increment primary key not null,
    ten_ql nvarchar(100) not null,
    ngay_sinh date not null,
    so_dien_thoai nvarchar(15) not null,
    ma_phieu int(11) 
);

alter table QuanLi
add constraint pk_ql_pm foreign key (ma_phieu) references PhieuMuon(ma_phieu);

create table PhieuMuon(
	ma_phieu int(11) auto_increment not null primary key,
    ngay_muon date not null,
    ngay_tra date not null,
    han_muon nvarchar(30) default '30 ngay',
    ma_sv int(11) not null,
    ma_sach int(11) not null,
    constraint fk_sv_pm foreign key (ma_sv) references SinhVien(ma_sv),
    constraint fk_sach_pm foreign key (ma_sach) references Sach(ma_sach)
);	


