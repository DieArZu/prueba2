<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Iniciar Sesión</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

        <!-- Estilos personalizados -->
        <style>
            body {
                background: linear-gradient(to right, #007bff, #00d2ff);
                font-family: 'Roboto', sans-serif;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0;
            }

            .login-container {
                background-color: white;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
                box-sizing: border-box;
            }

            .logo h2 {
                text-align: center;
                font-size: 2rem;
                margin-bottom: 30px;
                color: #007bff;
            }

            .form-label {
                font-weight: 500;
                color: #333;
            }

            .form-control {
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                padding: 10px;
                margin-bottom: 20px;
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

            .text-center p {
                margin-top: 20px;
                color: #555;
            }

            .text-center a {
                color: #007bff;
                text-decoration: none;
            }

            .text-center a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <div class="login-container">
            <div class="logo">
                <h2><strong>Administrador de Tareas Grupal</strong></h2>
            </div>

            <!-- Formulario de inicio de sesión -->
            <form action="ValidateLogin.jsp">
                <div class="mb-4">
                    <label for="txtnombre" class="form-label">Nombre:</label>
                    <input type="text" class="form-control" id="txtnombre" name="txtnombre" required>
                </div>

                <div class="mb-4">
                    <label for="txtpassword" class="form-label">Contraseña:</label>
                    <input type="password" class="form-control" id="txtpassword" name="txtpassword" required>
                </div>

                <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
            </form>

            <div class="text-center">
                <p>¿No tienes una cuenta? <a href="registro.jsp">Regístrate aquí</a></p>
            </div>
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>
