package ss9.bai_tap;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountServlet", value = "/calculator")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        float price = Float.parseFloat(request.getParameter("price"));
        int discount_percent = Integer.parseInt(request.getParameter("discount"));
        float discount = (float) (price * discount_percent * 0.01);
        float total = price - discount;
        request.setAttribute("description", description);
        request.setAttribute("price", price);
        request.setAttribute("discount_percent", discount_percent);
        request.setAttribute("discount", discount);
        request.setAttribute("total", total);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("discount2.jsp");
        requestDispatcher.forward(request, response);

    }
}
