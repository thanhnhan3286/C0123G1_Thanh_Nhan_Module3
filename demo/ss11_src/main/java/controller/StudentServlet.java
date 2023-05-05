package controller;

import model.Student;
import service.IStudentService;
import service.impl.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private IStudentService iStudentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String action = request.getParameter("action");
       if(action == null) {
           action="";

       }
       switch (action) {
           case "create": {
               request.getRequestDispatcher("/create.jsp").forward(request, response);
               break;
           }
           default: {
               showList(request, response);
           }
       }
    }

    public void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> studentList = iStudentService.getAll();
        if (studentList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            request.setAttribute("studentList", studentList);
            request.getRequestDispatcher("/list.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action ="";
        }
        switch (action) {
            case "create": {
                createStudent(request, response);
                break;
            }
        }
    }

    public void createStudent(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        int genderView = Integer.valueOf(request.getParameter("gender"));
        Boolean gender;
        if(genderView == 0) {
            gender = false;
        } else {
            gender = true;
        }
        float point = Float.parseFloat(request.getParameter("point"));
        Integer classId = Integer.valueOf(request.getParameter("classId"));
        Student student = new Student(id, name, gender, point, classId);
        iStudentService.saveStudent(student);
        response.sendRedirect("/student");
    }
}
