USE furama;
-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT 
    *
FROM
    nhan_vien
WHERE
    ho_ten REGEXP '^[HTK]'
        AND CHAR_LENGTH(ho_ten) <= 15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT * FROM khach_hang WHERE (dia_chi LIKE '%Đà Nẵng' OR dia_chi LIKE '%Quảng Trị') AND (ROUND(DATEDIFF(curdate(), ngay_sinh)/365) BETWEEN 18 AND 50);

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT kh.ma_khach_hang, kh.ho_ten, COUNT(ma_hop_dong) AS so_lan_dat_phong FROM khach_hang AS kh
INNER JOIN hop_dong AS hd ON kh.ma_khach_hang = hd.ma_khach_hang
INNER JOIN loai_khach AS lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang
ORDER BY so_lan_dat_phong;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    IFNULL(SUM(IFNULL(hdct.so_luong * dvdk.gia, 0)) + dv.chi_phi_thue,
            0) AS tong_tien
FROM
    khach_hang AS kh
        INNER JOIN
    loai_khach AS lk ON kh.ma_loai_khach = lk.ma_loai_khach
        LEFT JOIN
    hop_dong AS hd ON kh.ma_khach_hang = hd.ma_khach_hang
        LEFT JOIN
    dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet AS hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem AS dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY kh.ma_khach_hang , hd.ma_hop_dong
ORDER BY kh.ma_khach_hang;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu AS dv
        INNER JOIN
    loai_dich_vu AS ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE
    ma_dich_vu NOT IN (SELECT 
            dich_vu.ma_dich_vu
        FROM
            dich_vu
                INNER JOIN
            hop_dong ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
        WHERE
            QUARTER(hop_dong.ngay_lam_hop_dong) = 1); 

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT DISTINCT
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.so_nguoi_toi_da,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu AS dv
        INNER JOIN
    loai_dich_vu AS ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        INNER JOIN
    hop_dong AS hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2020
        AND dv.ma_dich_vu NOT IN (SELECT 
            hd.ma_dich_vu
        FROM
            hop_dong AS hd
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021);
 
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
SELECT DISTINCT ho_ten FROM khach_hang;
SELECT ho_ten FROM khach_hang GROUP BY ho_ten;
SELECT ho_ten FROM khach_hang UNION SELECT ho_ten FROM khach_hang;

-- 9.1	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

-- 9.2 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu doanh thu.
CREATE VIEW v_tong_tien AS
SELECT 
    hd.ma_hop_dong,
    MONTH(hd.ngay_lam_hop_dong) AS thang,
    IFNULL(SUM(IFNULL(hdct.so_luong * dvdk.gia, 0)) + dv.chi_phi_thue,
            0) AS tong_tien
FROM
    hop_dong AS hd
        LEFT JOIN
    dich_vu AS dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet AS hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem AS dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY hd.ma_hop_dong
ORDER BY thang;

SELECT v.thang, SUM(tong_tien) FROM v_tong_tien AS v GROUP BY thang;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).


-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (
-- Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

    SELECT 
        dvdk.ma_dich_vu_di_kem,
        dvdk.ten_dich_vu_di_kem,
        (SUM(hdct.so_luong)) AS so_luong_dich_vu_di_kem
    FROM
        dich_vu_di_kem AS dvdk
            JOIN
        hop_dong_chi_tiet AS hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
    GROUP BY dvdk.ma_dich_vu_di_kem
    HAVING so_luong_dich_vu_di_kem = (SELECT SUM(hdct.so_luong) AS so_luong_dich_vu_di_kem FROM dich_vu_di_kem AS dvdk
            JOIN
        hop_dong_chi_tiet AS hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
        GROUP BY dvdk.ma_dich_vu_di_kem
        ORDER BY so_luong_dich_vu_di_kem DESC
        LIMIT 1)
    ORDER BY dvdk.ma_dich_vu_di_kem;
WITH source AS (
SELECT 
        dvdk.ma_dich_vu_di_kem,
        dvdk.ten_dich_vu_di_kem,
        (SUM(hdct.so_luong)) AS so_luong_dich_vu_di_kem
    FROM
        dich_vu_di_kem AS dvdk
            JOIN
        hop_dong_chi_tiet AS hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
    GROUP BY dvdk.ma_dich_vu_di_kem
    )
    SELECT s.ma_dich_vu_di_kem,
        s.ten_dich_vu_di_kem,
        MAX(s.so_luong_dich_vu_di_kem) AS max_so_luong_dich_vu_di_kem
        FROM source AS s
        WHERE so_luong_dich_vu_di_kem IN (SELECT MAX(s.so_luong_dich_vu_di_kem)FROM source AS s)
        GROUP BY s.ma_dich_vu_di_kem;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
