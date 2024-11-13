<%@ page import="java.sql.*" %>
<%
    // Obtener los parámetros del formulario
    String titulo = request.getParameter("titulo");
    String descripcion = request.getParameter("descripcion");
    String nombre = (String) session.getAttribute("nombre");

    // Variables de conexión a la base de datos
    String dbUrl = "jdbc:mysql://localhost:3306/ListaTareas";
    String dbUser = "root";
    String dbPassword = "Admin$1234";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Consulta para insertar la nueva tarea
        String insertQuery = "INSERT INTO tareas (titulo, descripcion, creador, statuss,  releaseDate) VALUES (?, ?, ?,?, now())";
        pstmt = conn.prepareStatement(insertQuery);
        pstmt.setString(1, titulo);
        pstmt.setString(2, descripcion);
        pstmt.setString(3, nombre);
        pstmt.setString(4, "En Proceso");
        
        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<p>Tarea agregada con éxito.</p>");
        } else {
            out.println("<p>Error: No se pudo agregar la tarea.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p style='color: red;'>Error de conexión a la base de datos.</p>");
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Redirigir de vuelta a la lista de tareas
    response.sendRedirect("tabla.jsp");
%>
