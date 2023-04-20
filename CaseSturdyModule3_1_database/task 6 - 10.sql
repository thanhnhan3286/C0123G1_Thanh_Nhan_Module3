USE furama;
-- task 6:	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 
-- (Quý 1 là tháng 1, 2, 3).
SELECT 
    dich_vu.ma_dich_vu,
    dich_vu.ten_dich_vu,
    dich_vu.dien_tich,
    dich_vu.chi_phi_thue,
    loai_dich_vu.ten_loai_dich_vu
FROM
    dich_vu
        JOIN
    loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
WHERE
    dich_vu.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM hop_dong
        WHERE
            (QUARTER(hop_dong.ngay_lam_hop_dong) = 1)
                AND (YEAR(hop_dong.ngay_lam_hop_dong) = 2021))
GROUP BY dich_vu.ma_dich_vu
ORDER BY loai_dich_vu.ten_loai_dich_vu DESC;
-- task 7:	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT DISTINCT
    dich_vu.ma_dich_vu,
    dich_vu.ten_dich_vu,
    dich_vu.dien_tich,
    dich_vu.so_nguoi_toi_da,
    dich_vu.chi_phi_thue,
    loai_dich_vu.ten_loai_dich_vu
FROM
    dich_vu
        JOIN
    loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
        JOIN
    hop_dong ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
WHERE (YEAR(hop_dong.ngay_lam_hop_dong) = 2020) AND
    (dich_vu.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM hop_dong
        WHERE
            YEAR(hop_dong.ngay_lam_hop_dong) = 2021));
-- task 8:	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- -- Cách 1
SELECT ho_ten
FROM khach_hang
GROUP BY ho_ten;
-- -- Cách 2
SELECT DISTINCT ho_ten
FROM khach_hang;
-- -- Cách 3
SELECT ho_ten
FROM khach_hang
UNION
SELECT ho_ten
FROM khach_hang;
-- task 9:	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng
SELECT MONTH(hop_dong.ngay_lam_hop_dong) AS thang, COUNT(hop_dong.ma_khach_hang) AS so_luong_khach_dat_phong
FROM hop_dong
WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;
-- task 10:	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT	hop_dong.ma_hop_dong, 
		hop_dong.ngay_lam_hop_dong, 
        hop_dong.ngay_ket_thuc,
        hop_dong.tien_dat_coc, 
        IFNULL(SUM(hop_dong_chi_tiet.so_luong),0) AS so_luong_dich_vu_di_kem
FROM hop_dong
LEFT JOIN hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY hop_dong.ma_hop_dong
ORDER BY ma_hop_dong;