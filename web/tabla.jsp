<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Tareas</title>

    <!-- Incluir Bootstrap desde el CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJ+JahMu/1RY+pJYeJN5p4z7kYZ5t8Ck/iYkwiYFzp8vF1cYFZy2W2HgKp3p" crossorigin="anonymous">

    <!-- Estilos CSS personalizados -->
    <style>
        body {
            background: linear-gradient(to right, #007bff, #00d2ff);
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
        }
        .fondo-verde {
            background-color: #28a745; /* Color verde */
        }

        .navbar {
            margin-bottom: 100px;
            font-size: 2rem;
            color: #007bff;
        }
        .navbar-nav .nav-link {
            color: #fff; /* Cambiar los enlaces a color blanco */
        }

        .navbar-nav .nav-link:hover {
            color: #ffd700; /* Cambiar el color al pasar el mouse */
        }


        .form-container {
            background-color: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 0 auto;
            margin-bottom: 50px;
        }

        h2 {
            font-size: 2rem;
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }

        .form-group {
            margin-bottom: 20px;
            max-width: 200px;
        }

        .form-control, .form-select {
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            padding: 12px;
            width: 450px;
            max-width: 200px;
        }

        .btn-primary {
            width: 100%;
            background-color: #007bff;
            border-radius: 10px;
            padding: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            transition: background-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .table {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin: 0 auto;
        }

        th, td {
            text-align: center;
            padding: 10px;
        }

        thead {
            background-color: #007bff;
            color: white;
        }

        tbody tr:hover {
            background-color: #e9ecef;
        }

        .table-bordered {
            border: 1px solid #007bff;
        }

        .btn-warning {
            background-color: #f39c12;
            border-color: #f39c12;
            border-radius: 10px;
        }

        .btn-warning:hover {
            background-color: #e67e22;
            border-color: #e67e22;
        }

        .container {
            margin-top: 50px;
        }

        .section-divider {
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <!-- Barra de navegación -->
    <!-- Barra de navegación -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="collapse navbar-collapse" id="navbarNav">
            <a class="navbar-brand" href="#"></a>
            <ul class="navbar-nav ml-auto"> <!-- ml-auto para alinear a la derecha -->
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </nav>


    <div class="container">

        <%
            // Obtener el usuarioId desde la sesión
            String nombre = (String) session.getAttribute("nombre");

            if (nombre == null) {
                response.sendRedirect("login.jsp"); // Redirigir al login si no hay usuario en sesión
                return;
            }

            // Variables para la conexión a la base de datos
            String dbUrl = "jdbc:mysql://localhost:3306/ListaTareas";
            String dbUser = "root";
            String dbPassword = "Admin$1234";

            Connection conn = null;
            Statement stmttareas = null;
            ResultSet rstareas = null;

            try {
                // Establecer la conexión con la base de datos
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                // Consulta para obtener todas las tareas
                String querytareas = "SELECT * FROM tareas";
                stmttareas = conn.createStatement();
                rstareas = stmttareas.executeQuery(querytareas);

                // Mostrar las tareas en una tabla HTML
                if (rstareas.next()) {
        %>

        <!-- Formulario para agregar nueva tarea -->
        <div class="form-container">
            <h2>Agregar Nueva Tarea</h2>
            <form action="agregarTarea.jsp" method="post">
                <div class="form-group">
                    <label for="titulo" class="form-label">Título:</label>
                    <input type="text" id="titulo" name="titulo" class="form-control" required />
                </div>

                <div class="form-group">
                    <label for="descripcion" class="form-label">Descripción:</label>
                    <textarea id="descripcion" name="descripcion" class="form-control" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Agregar Tarea</button>
            </form>
        </div>

        <hr>

        <!-- Tareas -->
        <h2 class="mb-4">Lista de Tareas</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tarea</th>
                    <th>Descripción</th>
                    <th>Creada por</th>
                    <th>Fecha creada</th>
                    <th>Status</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <%
                    do {
                %>
                <tr class="<%= "listo".equals(rstareas.getString("statuss")) ? "fondo-verde" : "" %>">
    <td><%= rstareas.getInt("id")%></td>
    <td><%= rstareas.getString("titulo")%></td>
    <td><%= rstareas.getString("descripcion")%></td>
    <td><%= rstareas.getString("creador")%></td>
    <td><%= rstareas.getDate("releaseDate")%></td>
    <td><%= rstareas.getString("statuss")%></td>
    <td>
        <!-- Formulario para cambiar el estado -->
        <form action="cambiarStatus.jsp" method="post">
            <input type="hidden" name="id" value="<%= rstareas.getInt("id")%>" />
            <select name="statuss" class="form-select">
                <option value="en_proceso" <%= "en_proceso".equals(rstareas.getString("statuss")) ? "selected" : ""%>>En Proceso</option>
                <option value="listo" <%= "listo".equals(rstareas.getString("statuss")) ? "selected" : ""%>>Listo</option>
            </select>
            <button type="submit" class="btn btn-warning mt-2">Actualizar</button>
        </form>
    </td>
</tr>
                <%
                    } while (rstareas.next());
                %>
            </tbody>
        </table>

        <%
            } else {
                out.println("<p>No se encontraron tareas.</p>");
            }
        %>

        <div class="section-divider"></div>

        <%
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p style='color: red;'>Error de conexión a la base de datos.</p>");
            } finally {
                // Cerrar recursos
                try {
                    if (rstareas != null) {
                        rstareas.close();
                    }
                    if (stmttareas != null) {
                        stmttareas.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>

    <!-- Incluir el script de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity
