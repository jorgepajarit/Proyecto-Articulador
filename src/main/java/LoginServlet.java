import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
    	dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto", "root", "12345678");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM usuarios WHERE nombre_usuario=? AND contrasena=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Usuario autenticado correctamente, establecer sesión
                HttpSession session = request.getSession();
                session.setAttribute("nombreUsuario", username); // Almacena el nombre de usuario en la sesión

                response.sendRedirect("home");
            } else {
                // Autenticación fallida, redirigir a la página de inicio de sesión
                response.sendRedirect("login");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


