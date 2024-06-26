import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/tienda")
public class productServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
  //Redirección a products.jsp
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher dispatcher = request.getRequestDispatcher("products.jsp");
    	request.setAttribute("autor", "Cristian Rivera");
    	dispatcher.forward(request, response);
    }
}