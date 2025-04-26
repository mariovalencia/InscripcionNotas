<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresarEstudiante.aspx.cs" Inherits="NotasEstudiantesWeb.IngresarEstudiante" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro de Estudiantes</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            // Cargar las carreras al cargar la página
            $.ajax({
                url: 'IngresarEstudiante.aspx/ObtenerCarreras',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    var carreras = JSON.parse(data.d);
                    var options = '';
                    $.each(carreras, function (i, carrera) {
                        options += '<option value="' + carrera.id + '">' + carrera.nombre_carrera + '</option>';
                    });
                    $('#ddlCarrera').append(options);
                },
                error: function (error) {
                    alert('Error al cargar las carreras: ' + error.responseText);
                }
            });

            // Manejar el envío del formulario
            $('#btnGuardar').click(function (e) {
                e.preventDefault();
                
                var estudiante = {
                    nombre: $('#txtNombre').val(),
                    apellido: $('#txtApellido').val(),
                    carnet: $('#txtCarnet').val(),
                    id_carrera: parseInt($('#ddlCarrera').val())
                };

                $.ajax({
                    url: 'IngresarEstudiante.aspx/GuardarEstudiante',
                    type: 'POST',
                    data: JSON.stringify({ estudiante: estudiante }),
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data) {
                        alert('Estudiante guardado exitosamente');
                        $('#form1')[0].reset();
                        $('#ddlCarrera').val($('#ddlCarrera option:first').val());
                    },
                    error: function (error) {
                        alert('Error al guardar el estudiante: ' + error.responseText);
                    }
                });
            });
        });
    </script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Registro de Estudiantes</h2>
        <form id="form1" runat="server">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="txtNombre" class="form-label">Nombre:</label>
                    <input type="text" id="txtNombre" class="form-control" required="required" />
                </div>
                <div class="col-md-6">
                    <label for="txtApellido" class="form-label">Apellido:</label>
                    <input type="text" id="txtApellido" class="form-control" required="required" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="txtCarnet" class="form-label">Carnet:</label>
                    <input type="text" id="txtCarnet" class="form-control" required="required" />
                </div>
                <div class="col-md-6">
                    <label for="ddlCarrera" class="form-label">Carrera:</label>
                    <select id="ddlCarrera" class="form-select" required="required">
                        <option value="">-- Seleccione una carrera --</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <button id="btnGuardar" class="btn btn-primary">Guardar</button>
                    <a href="Default.aspx" class="btn btn-secondary">Regresar</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>