USE furama;
-- task 21: Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
CREATE VIEW v_nhan_vien AS
SELECT * FROM nhan_vien AS nv
INNER JOIN hop_dong AS hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE nv.dia_chi LIKE '% Đà Nẵng';--  hd.ngay_lam_hop_dong = 2019/12/12;