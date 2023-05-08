package repository.impl;

import model.Clazz;
import model.Student;
import model.Student1;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class StudentRepository implements IStudentRepository {
     private final String  SELECT_ALL ="select s.*,c.name as class_name from student s join class c on s.class_id = c.id;";
     private final String  SEARCH ="select s.*,c.name as class_name from student s join class c on s.class_id = c.id where s.name like ? and s.class_id like ?;";
     private final String  DELETE_BY_ID ="call delete_student_by_id(?);";
     private final String  INSERT_INTO ="insert into student(name,gender,point,class_id) values(?,?,?,?);";
    @Override
    public List<Student1> findAll() {
        List<Student1> studentList = new ArrayList<>();
        // kết nối db và trả về list
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
             ResultSet resultSet =preparedStatement.executeQuery();
             while (resultSet.next()){
                 int id = resultSet.getInt("id"); // id tên cột trong db
                 String name = resultSet.getString("name");
                 boolean gender = resultSet.getBoolean("gender");
                 float point = resultSet.getFloat("point");
                 int classId= resultSet.getInt("class_id");
                 String className= resultSet.getString("class_name");
                 Clazz clazz = new Clazz(classId,className);
                 Student1 student = new Student1(id, name,gender,point,clazz);
                 studentList.add(student);
             }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    @Override
    public boolean save(Student student) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,student.getName());
            preparedStatement.setBoolean(2,student.isGender());
            preparedStatement.setFloat(3,student.getPoint());
            preparedStatement.setInt(4,student.getClassId());
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_BY_ID);
            callableStatement.setInt(1,id);
            return callableStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    @Override
    public List<Student1> search(String searchName, String searchClassId) {
        List<Student1> studentList = new ArrayList<>();
        // kết nối db và trả về list
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,'%'+searchName+'%');
            preparedStatement.setString(2,'%'+searchClassId+'%');
            ResultSet resultSet =preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id"); // id tên cột trong db
                String name = resultSet.getString("name");
                boolean gender = resultSet.getBoolean("gender");
                float point = resultSet.getFloat("point");
                int classId= resultSet.getInt("class_id");
                String className= resultSet.getString("class_name");
                Clazz clazz = new Clazz(classId,className);
                Student1 student = new Student1(id, name,gender,point,clazz);
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }

    @Override
    public Student findById(int id) {
        return null;
    }

    @Override
    public String transaction() {
        String msg = "OK, transaction successfully!";
        Connection connection = BaseRepository.getConnectDB();
        Savepoint savepoint1=null;
        Savepoint savepoint2=null;
        try {
            connection.setAutoCommit(false);// cần set là false => tạo transaction
            // thêm mới 1 class
            PreparedStatement pSInsertClass =
                    connection.prepareStatement(
                            "insert into class (`name`)values (?)");
            pSInsertClass.setString(1, "C08");

            int rowAffect = pSInsertClass.executeUpdate();

            savepoint1= connection.setSavepoint();
            // thêm mới 1 room
            PreparedStatement pSInsertRoom =
                    connection.prepareStatement(
                            "insert into room(id,name,class_id) values(?,?,?);");
            pSInsertRoom.setString(1, "2");
            pSInsertRoom.setString(2, "Ada");
            pSInsertRoom.setString(3, "1");

             rowAffect += pSInsertRoom.executeUpdate();

            savepoint2= connection.setSavepoint();
            // thêm mới 1 học viên
            if (rowAffect == 2) {
                PreparedStatement pSInsertStudent
                        = connection.prepareStatement(
                        "insert into student(name,gender,point,class_id) values(?,?,?,?);");

                pSInsertStudent.setString(1,"Nguyễn Thành Công");
                pSInsertStudent.setBoolean(2,true);
                pSInsertStudent.setFloat(3,7);
                pSInsertStudent.setInt(4,100);
                rowAffect += pSInsertStudent.executeUpdate();
            }
            // kiểm tra nếu cả 3 hoạt động thêm mới thành công thì mới commit
            if (rowAffect == 3) {
                connection.commit();
            } else {
                msg = "rollback try";
                connection.rollback();
            }

        } catch (SQLException e) {
            try {
                msg = "rollback catch";
                connection.rollback(savepoint1);
                connection.commit();

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return msg;
    }



}
