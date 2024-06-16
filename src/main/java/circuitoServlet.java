import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;


@WebServlet("/circuito")
public class circuitoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
	    String sessionId = session.getId();
	    Integer visitCount = (Integer) session.getAttribute("visitCount");

    	
    	 if (visitCount == null) {
		        visitCount = 0;
		    }
		    visitCount++;
		    session.setAttribute("visitCount", visitCount);
		    PrintWriter out = response.getWriter();		    
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("circuitos.jsp");
	    	request.setAttribute("visitas", visitCount);
	    	request.setAttribute("autor", "Juan David Castaneda Tenjo");
	    	dispatcher.forward(request, response);
		    
    }	   
		       
    
    
    }