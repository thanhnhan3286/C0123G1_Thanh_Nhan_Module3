package repository.impl;

import model.Student;
import repository.IStudentRepository;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    //DI
    private static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(1,"An Khang",true,8,1));
        studentList.add(new Student(2,"Trường An",false,5,1));
        studentList.add(new Student(3,"Hồ Viễn",true,7,1));
        studentList.add(new Student(4,"Quốc Hoà",false,4,1));
        studentList.add(new Student(5,"An Khang",true,8,1));
    }

    @Override
    public List<Student> getAll() {
        return studentList;
    }

    @Override
    public void save(Student student) {
        studentList.add(student);
    }
}
