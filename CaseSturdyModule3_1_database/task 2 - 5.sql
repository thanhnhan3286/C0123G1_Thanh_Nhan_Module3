USE furama;
-- task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
-- 			và có tối đa 15 kí tự.
SELECT 
    *
FROM
    nhan_vien
WHERE
    ho_ten REGEXP '^[HTK]'
        AND CHAR_LENGTH(ho_ten) < 16;
-- task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT 
    *
FROM
    khach_hang
WHERE
    (dia_chi LIKE '%Đà Nẵng'
        OR dia_chi LIKE '%Quảng Trị')
        AND (ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365) BETWEEN 18 AND 50);
-- task 4:	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- 			Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- 			Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten,
    COUNT(ma_hop_dong) AS so_lan_dat_phong
FROM
    khach_hang
        INNER JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        INNER JOIN
    loai_khach ON loai_khach.ma_loai_khach = khach_hang.ma_loai_khach
WHERE
    loai_khach.ten_loai_khach = 'Diamond'
GROUP BY ma_khach_hang
ORDER BY so_lan_dat_phong;
-- task 5:	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten AS ho_ten_khach_hang,
    loai_khach.ten_loai_khach,
    hop_dong.ma_hop_dong,
    dich_vu.ten_dich_vu,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    IFNULL((SUM(IFNULL((hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia),0)) + dich_vu.chi_phi_thue),0) AS tong_tien
FROM
    khach_hang
        JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
        LEFT JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        LEFT JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
GROUP BY hop_dong.ma_hop_dong , khach_hang.ma_khach_hang
ORDER BY khach_hang.ma_khach_hang;