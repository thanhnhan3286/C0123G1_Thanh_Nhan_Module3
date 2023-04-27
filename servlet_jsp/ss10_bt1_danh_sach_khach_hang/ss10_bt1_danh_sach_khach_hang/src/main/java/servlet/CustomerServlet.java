package servlet;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer(1, "Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://khoinguonsangtao.vn/wp-content/uploads/2022/09/hinh-anh-che-mat.jpg"));
        customerList.add(new Customer(2, "Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://khoinguonsangtao.vn/wp-content/uploads/2022/09/anh-che-mat-nam-cam-dien-thoai.jpg"));
        customerList.add(new Customer(3, "Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://khoinguonsangtao.vn/wp-content/uploads/2022/09/anh-che-mat-girl-cute-chup-truoc-guong.jpg"));
        customerList.add(new Customer(4, "Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://khoinguonsangtao.vn/wp-content/uploads/2022/09/anh-che-mat-nu-chup-truoc-guong-xinh-dep.jpg"));
        customerList.add(new Customer(5, "Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://khoinguonsangtao.vn/wp-content/uploads/2022/09/anh-che-mat-nu-cam-dien-thoai-truoc-guong-ngot-ngao.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
