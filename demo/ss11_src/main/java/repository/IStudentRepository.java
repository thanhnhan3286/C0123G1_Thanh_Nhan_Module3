package repository;

import model.Student;

import java.util.List;

public interface IStudentRepository {

    List<Student> getAll();

    void save(Student student);
}
