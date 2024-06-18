

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/deleteToCarrito")
public class deleteToCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId = request.getParameter("id");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto", "dba", "123456789.eT");
            
            PreparedStatement ps = con.prepareStatement("DELETE FROM carritotemp WHERE id_select = ?");
            ps.setString(1, productId);
            
            int rowsInserted = ps.executeUpdate(); // Debes usar ps2 en lugar de ps

            if (rowsInserted > 0) {
                response.sendRedirect("tienda");
            }
            
		}catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
