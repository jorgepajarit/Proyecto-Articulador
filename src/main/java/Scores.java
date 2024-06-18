

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Scores
 */
@WebServlet("/Scores")
public class Scores extends HttpServlet {
	  private static final long serialVersionUID = 1L;
	    
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("scoresTable.jsp");
	    	dispatcher.forward(request, response);
	    }

}
