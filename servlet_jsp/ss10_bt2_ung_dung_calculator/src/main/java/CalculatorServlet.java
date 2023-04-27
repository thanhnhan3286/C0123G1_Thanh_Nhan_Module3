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
        float result = 0;
        try {
            Calculate calculate = new Calculate();
            switch (c.charAt(0)) {
                case '+':
                    result = calculate.addition(a, b);
                    break;
                case '-':
                    result = calculate.subtraction(a, b);
                    break;
                case 'x':
                    result = calculate.times(a, b);
                    break;
                case '/':
                    if (b != 0) {
                        result = calculate.division(a, b);
                        break;
                    } else {
                        throw new ArithmeticException("Can't divide by zero, please try again.");
                    }
            }
        }catch (ArithmeticException e){
            exception = e.getMessage();
        }

        request.setAttribute("result", result);
        request.setAttribute("a", a);
        request.setAttribute("b", b);
        request.setAttribute("c", c);
        request.setAttribute("exception", exception);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
