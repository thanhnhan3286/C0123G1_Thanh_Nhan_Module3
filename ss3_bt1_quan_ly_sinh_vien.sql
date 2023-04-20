CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    `status` BIT
);
INSERT INTO classes
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO classes
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO classes
VALUES (3, 'B3', current_date, 0);
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(50),
    `status` BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES classes (class_id)
);
INSERT INTO students
VALUES (1,'Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO students
VALUES (2,'Hoa', 'Hai phong',NULL, 1, 1);
INSERT INTO students
VALUES (3,'Manh', 'HCM', '0123123123', 0, 2);
CREATE TABLE subjects (
    sub_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (credit >= 1),
    `status` BIT DEFAULT 1
);
INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
CREATE TABLE marks (
    mark_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_id INT,
    FOREIGN KEY (sub_id)
        REFERENCES subjects (sub_id),
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1
);
INSERT INTO marks(sub_id,student_id,mark,exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
-- hiển thị tất cả các sinh viên có tên bắt đầu băng chữ "h"
SELECT 
    *
FROM
    students
WHERE
    students.student_name LIKE 'h%';
-- hiển thị thông tin lớp học có thời gian bắt đầu vào tháng 12
SELECT 
    *
FROM
    classes
WHERE
    MONTH(classes.start_date) = 12 ;
-- hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
SELECT 
    *
FROM
    subjects
WHERE
    subjects.credit BETWEEN 3 AND 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET SQL_SAFE_UPDATES = 0;
UPDATE students
SET 
    class_id = 2
WHERE
    student_name LIKE 'Hung';
SET SQL_SAFE_UPDATES = 1;
SELECT 
    *
FROM
    students;
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT 
    students.student_name, subjects.sub_name, marks.mark
FROM
    marks
        JOIN
    students ON marks.student_id = students.student_id
        JOIN
    subjects ON marks.sub_id = subjects.sub_id
ORDER BY marks.mark DESC , students.student_name;