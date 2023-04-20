USE furama;
-- task 11: Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”
 SELECT 
    dich_vu_di_kem.*, khach_hang.ma_khach_hang
FROM
    khach_hang
        INNER JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
        INNER JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
        INNER JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        INNER JOIN
    dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
WHERE
    loai_khach.ten_loai_khach = 'Diamond'
        AND ((khach_hang.dia_chi LIKE '%Vinh')
        OR (khach_hang.dia_chi LIKE '%Quảng Ngãi'))
ORDER BY khach_hang.ma_khach_hang , dich_vu_di_kem.ma_dich_vu_di_kem;

 -- task 12: Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, 
 -- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ 
 -- đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021
 SELECT 
    hd.ma_hop_dong,
    nv.ho_ten AS ho_ten_nhan_vien,
    kh.ho_ten AS ho_ten_khach_hang,
    kh.so_dien_thoai AS so_dien_thoai_khach_hang,
    dv.ten_dich_vu,
    IFNULL(SUM(hdct.so_luong),0) AS so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
FROM
    hop_dong AS hd
        LEFT JOIN
    nhan_vien AS nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
        LEFT JOIN
    khach_hang AS kh ON hd.ma_khach_hang = kh.ma_khach_hang
        LEFT JOIN
    dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet AS hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE
    ((QUARTER(hd.ngay_lam_hop_dong) = 4)
        AND (YEAR(hd.ngay_lam_hop_dong) = 2020))
        AND hd.ma_hop_dong NOT IN (
        SELECT 
            hd.ma_hop_dong
        FROM
            hop_dong AS hd
        WHERE
            ((QUARTER(hd.ngay_lam_hop_dong) < 3)
                AND (YEAR(hd.ngay_lam_hop_dong) = 2021)))
GROUP BY hd.ma_hop_dong
ORDER BY hd.ma_hop_dong;

-- task 13:	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
 CREATE VIEW so_luong_dich_vu_di_kem_view AS
    SELECT 
        dvdk.ma_dich_vu_di_kem,
        dvdk.ten_dich_vu_di_kem,
        (SUM(hdct.so_luong)) AS so_luong_dich_vu_di_kem
    FROM
        dich_vu_di_kem AS dvdk
            JOIN
        hop_dong_chi_tiet AS hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
    GROUP BY dvdk.ma_dich_vu_di_kem
    ORDER BY dvdk.ma_dich_vu_di_kem , dvdk.ten_dich_vu_di_kem;
 SELECT 
    so_luong_dich_vu_di_kem_view.ma_dich_vu_di_kem,
    so_luong_dich_vu_di_kem_view.ten_dich_vu_di_kem,
    MAX(so_luong_dich_vu_di_kem) AS max_so_luong_dich_vu_di_kem
FROM
    so_luong_dich_vu_di_kem_view
WHERE
    so_luong_dich_vu_di_kem IN (SELECT 
            MAX(so_luong_dich_vu_di_kem)
        FROM
            so_luong_dich_vu_di_kem_view)
GROUP BY so_luong_dich_vu_di_kem_view.ma_dich_vu_di_kem
ORDER BY so_luong_dich_vu_di_kem_view.ma_dich_vu_di_kem , so_luong_dich_vu_di_kem_view.ten_dich_vu_di_kem;
 
 -- task 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
 -- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
SELECT 
    hop_dong.ma_hop_dong,
    loai_dich_vu.ten_loai_dich_vu,
    dich_vu_di_kem.ten_dich_vu_di_kem,
    COUNT(hop_dong_chi_tiet.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    hop_dong
        INNER JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        INNER JOIN
    loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
        INNER JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        INNER JOIN
    dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
WHERE
    dich_vu_di_kem.ten_dich_vu_di_kem IN (SELECT 
            dich_vu_di_kem.ten_dich_vu_di_kem
        FROM
            dich_vu_di_kem
                INNER JOIN
            hop_dong_chi_tiet ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
        GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem
        HAVING COUNT(hop_dong_chi_tiet.ma_dich_vu_di_kem) = 1)
GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem , hop_dong.ma_hop_dong;

-- task 15: Hiển thi thông tin của tất cả nhân viên bao gồm 
-- ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT 
    nhan_vien.ma_nhan_vien,
    nhan_vien.ho_ten,
    trinh_do.ten_trinh_do,
    bo_phan.ten_bo_phan,
    nhan_vien.so_dien_thoai,
    nhan_vien.dia_chi
FROM
    nhan_vien
        INNER JOIN
    trinh_do ON nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
        INNER JOIN
    bo_phan ON nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
        INNER JOIN
    hop_dong ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
WHERE
    YEAR(hop_dong.ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY nhan_vien.ma_nhan_vien
HAVING COUNT(hop_dong.ma_nhan_vien) <= 3
ORDER BY nhan_vien.ma_nhan_vien;

    