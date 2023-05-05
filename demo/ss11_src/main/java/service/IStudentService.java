package service;

import model.Student;

import java.util.List;

public interface IStudentService {

    List<Student> getAll();

    void saveStudent(Student student);
}
