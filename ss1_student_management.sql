CREATE DATABASE ss1_students_management;
USE ss1_student_management;
CREATE TABLE students (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
CREATE TABLE classes (
    id INT PRIMARY KEY,
    `name` VARCHAR(50)
);
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    `name` VARCHAR(50),
    age INT,
    country VARCHAR(50)
);
SELECT * FROM students;
SELECT * FROM teachers; 
SELECT * FROM classes;