<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String nombre = request.getParameter("txtnombre");
    String password = request.getParameter("txtpassword");
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String dbUrl = "jdbc:mysql://localhost:3306/ListaTareas"; 
    String dbUser = "root";  
    String dbPassword = "Admin$1234";  

    if (nombre != null && password != null) {
        try {
            // Establecer la conexión con la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Consultar la tabla de usuarios
            String query = "SELECT * FROM usuarios WHERE nombre = ? AND password = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, nombre);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            // Si hay un registro con ese email y contraseña entra
            
            if (rs.next()) {
                // Las credenciales son correctas
                int usuarioId = rs.getInt("id");  // Obtener el id del usuario
                session.setAttribute("usuarioId", usuarioId);  // Guardar el id en la sesión
                session.setAttribute("nombre", nombre);  // Guardar el nombre en la sesión
                response.sendRedirect("tabla.jsp");
            } else {
                // Las credenciales son incorrectas
                out.println("<h3 style='color: red;'>Error: Usuario o contraseña incorrectos</h3>");
                // Agregar el botón para volver al tabla.jsp
                out.println("<form action='login.jsp' method='get'>");
                out.println("<input type='submit' value='Volver al inicio' />");
                out.println("</form>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color: red;'>Error de conexión a la base de datos</h3>");
            // Agregar el botón para volver al index.jsp
            out.println("<form action='login.jsp' method='get'>");
            out.println("<input type='submit' value='Volver al inicio' />");
            out.println("</form>");
        } finally {
            // Cerrar recursos
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
