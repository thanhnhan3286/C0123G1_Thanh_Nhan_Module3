package service.impl;

import model.Student;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {

    private IStudentRepository iStudentRepository = new StudentRepository();

    @Override
    public List<Student> getAll() {
        List<Student> studentList = iStudentRepository.getAll();
        if(studentList.size() == 0) {
            System.out.println("Không có dữ liệu");
            return null;
        }
        return studentList;
    }

    @Override
    public void saveStudent(Student student) {
        iStudentRepository.save(student);
    }
}
