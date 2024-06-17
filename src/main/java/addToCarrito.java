
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/addToCarrito")
public class addToCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;
       	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String nombre = null;
	    int precio = 0;
	    String productId = request.getParameter("item");
	    HttpSession session = request.getSession();
	    System.out.println("Hola. Tu producto es " + productId + " desde el servlet!");
        	try {
        		Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto", "dba", "123456789.eT");
                
                PreparedStatement ps = con.prepareStatement("SELECT nombre, precio FROM productos WHERE id_producto = ?");
                ps.setString(1, productId);
                
                ResultSet rs = ps.executeQuery();
                
                if (rs.next()) {
                	nombre = rs.getString("nombre");
                    precio = rs.getInt("precio");
                }
                
                PreparedStatement ps2 = con.prepareStatement("INSERT INTO carritotemp (id_producto, nombre, valor) VALUES (?, ?, ?)");
                ps2.setString(1, productId); // id_producto
                ps2.setString(2, nombre); // nombre
                ps2.setInt(3, precio); // valor

                int rowsInserted = ps2.executeUpdate(); // Debes usar ps2 en lugar de ps

                if (rowsInserted > 0) {
                    response.sendRedirect("tienda");
                }

                
        	}catch (Exception e) {
                e.printStackTrace();
            }
       
                     
    }
}
