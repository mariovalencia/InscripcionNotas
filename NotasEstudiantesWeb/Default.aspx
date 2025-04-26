<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NotasEstudiantesWeb.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistema de Gestión Académica</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card {
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="text-center mb-5">
            <h1 class="display-4">Sistema de Gestión Académica</h1>
            <p class="lead">Administración de estudiantes y registro de notas</p>
        </div>
        
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <h3 class="card-title">Registro de Estudiantes</h3>
                        <p class="card-text">Permite ingresar nuevos estudiantes al sistema.</p>
                        <a href="IngresarEstudiante.aspx" class="btn btn-primary">Acceder</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <h3 class="card-title">Registro de Notas</h3>
                        <p class="card-text">Permite ingresar y actualizar notas de los estudiantes.</p>
                        <a href="IngresarNotas.aspx" class="btn btn-primary">Acceder</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <h3 class="card-title">Consulta de Notas</h3>
                        <p class="card-text">Permite consultar las notas de los estudiantes.</p>
                        <a href="ConsultarNotas.aspx" class="btn btn-primary">Acceder</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>