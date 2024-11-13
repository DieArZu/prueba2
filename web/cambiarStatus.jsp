<%@ page import="java.sql.*" %>
<%
    // Obtener los parámetros del formulario
    int id = Integer.parseInt(request.getParameter("id"));
    String status = request.getParameter("statuss");

    // Conectar a la base de datos
    String dbUrl = "jdbc:mysql://localhost:3306/ListaTareas";
    String dbUser = "root";
    String dbPassword = "Admin$1234";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Actualizar el estado en la base de datos
        String updateQuery = "UPDATE tareas SET statuss = ? WHERE id = ?";
        pstmt = conn.prepareStatement(updateQuery);
        pstmt.setString(1, status);
        pstmt.setInt(2, id);

        int rowsUpdated = pstmt.executeUpdate();
        if (rowsUpdated > 0) {
            out.println("<p>Estado actualizado con éxito.</p>");
        } else {
            out.println("<p>Error: No se pudo actualizar el estado.</p>");
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
