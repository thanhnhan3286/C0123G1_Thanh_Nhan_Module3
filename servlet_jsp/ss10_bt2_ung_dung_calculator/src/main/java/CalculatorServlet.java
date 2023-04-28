import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float a = Float.parseFloat(request.getParameter("firstOperand"));
        float b = Float.parseFloat(request.getParameter("secondOperand"));
        String c = request.getParameter("operator");
        String exception = "";
        String equal = " = ";
        float result = 0;
        try {
            switch (c.charAt(0)) {
                case '+':
                    result = a + b;
                    break;
                case '-':
                    result = a - b;
                    break;
                case 'x':
                    result = a * b;
                    break;
                case '/':
                    if (b != 0) {
                        result = a / b;
                        break;
                    } else {
                        throw new ArithmeticException("Can't divide by zero, please try again.");
                    }
            }
        } catch (ArithmeticException e) {
            exception = e.getMessage();
        }
        request.setAttribute("result", result);
        request.setAttribute("a", a);
        request.setAttribute("b", b);
        request.setAttribute("c", c);
        request.setAttribute("equal", equal);
        request.setAttribute("exception", exception);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
