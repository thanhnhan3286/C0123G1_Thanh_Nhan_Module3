USE quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    *
FROM
    subjects
WHERE
    credit = (SELECT 
            MAX(credit)
        FROM
            subjects)
GROUP BY sub_id;
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT 
    *
FROM
    marks
WHERE
    mark = (SELECT 
            MAX(mark)
        FROM
            marks)
GROUP BY mark_id;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT 
    students.*, AVG(marks.mark) AS diem_trung_binh
FROM
    students
        JOIN
    marks ON students.student_id = marks.student_id
GROUP BY student_id
ORDER BY diem_trung_binh DESC , student_id;