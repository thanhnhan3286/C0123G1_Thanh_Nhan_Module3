USE furama;

-- task 16: Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021
SET SQL_SAFE_UPDATES=0;
DELETE
FROM
    nhan_vien
WHERE
    nhan_vien.ma_nhan_vien NOT IN (SELECT 
            hop_dong.ma_nhan_vien
        FROM
            hop_dong
        WHERE
            YEAR(hop_dong.ngay_lam_hop_dong) BETWEEN 2019 AND 2021);
SET SQL_SAFE_UPDATES=1;

-- task 17:	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ. 

CREATE VIEW tong_tien_hop_dong_view AS
    SELECT 
        kh.ma_khach_hang,
        IFNULL((SUM(IFNULL((hdct.so_luong * dvdk.gia), 0)) + dv.chi_phi_thue),
                0) AS tong_tien
    FROM
        khach_hang AS kh
            INNER JOIN
        loai_khach AS lk ON kh.ma_loai_khach = lk.ma_loai_khach
            INNER JOIN
        hop_dong AS hd ON kh.ma_khach_hang = hd.ma_khach_hang
            INNER JOIN
        dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu
            INNER JOIN
        hop_dong_chi_tiet AS hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
            INNER JOIN
        dich_vu_di_kem AS dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    WHERE
        lk.ten_loai_khach = 'Platinium'
            AND YEAR(hd.ngay_lam_hop_dong) = 2021
    GROUP BY hd.ma_hop_dong
    HAVING tong_tien > 1000000;
    
SET SQL_SAFE_UPDATES=0;
UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_khach_hang IN (SELECT 
            ma_khach_hang
        FROM
            tong_tien_hop_dong_view);
SET SQL_SAFE_UPDATES=1;

SET SQL_SAFE_UPDATES=0;
UPDATE khach_hang 
SET 
    ma_loai_khach = 1
WHERE
    ma_khach_hang IN (SELECT 
            ma_khach_hang
        FROM
            (SELECT 
                kh.ma_khach_hang,
                    (SUM(IFNULL((hdct.so_luong * dvdk.gia), 0)) + dv.chi_phi_thue) AS tong_tien
            FROM
                khach_hang kh
            LEFT JOIN hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
            LEFT JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
            LEFT JOIN hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
            LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            LEFT JOIN loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
            WHERE
                YEAR(hd.ngay_lam_hop_dong) = 2021
                    AND lk.ten_loai_khach = 'Platinium'
            GROUP BY ma_khach_hang , hd.ma_hop_dong
            HAVING tong_tien > 1000000) AS temp);
SET SQL_SAFE_UPDATES=1;

 -- task 18: Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
 SET FOREIGN_KEY_CHECKS =  0 ;
DELETE FROM khach_hang 
WHERE
    khach.hang.ma_khach_hang IN (SELECT 
        hd.ma_khach_hang
    FROM
        hop_dong AS hd
    WHERE
        YEAR(hd.ngay_lam_hop_dong) < 2021);
 SET FOREIGN_KEY_CHECKS =  1 ;
 
 -- task 19: Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi
 
-- SELECT dvdk.ma_dich_vu_di_kem, SUM(hdct.so_luong) AS so_lan_su_dung FROM
--  hop_dong_chi_tiet AS hdct 
--  INNER JOIN dich_vu_di_kem AS dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
--  GROUP BY hdct.ma_dich_vu_di_kem
--  HAVING so_lan_su_dung > 10;
SET SQL_SAFE_UPDATES=0;
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    dich_vu_di_kem.ma_dich_vu_di_kem IN (
    SELECT ma_dich_vu_di_kem 
    FROM (
    SELECT 
            dvdk.ma_dich_vu_di_kem, SUM(hdct.so_luong) AS so_lan_su_dung
        FROM
            hop_dong_chi_tiet AS hdct
                INNER JOIN
            dich_vu_di_kem AS dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        GROUP BY hdct.ma_dich_vu_di_kem
        HAVING so_lan_su_dung > 10) AS temp);
SET SQL_SAFE_UPDATES=1;

-- task 20:	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT ma_nhan_vien AS ID, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM nhan_vien
UNION ALL
SELECT ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM khach_hang;