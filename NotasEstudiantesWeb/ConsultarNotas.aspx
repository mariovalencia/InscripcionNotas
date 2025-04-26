<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultarNotas.aspx.cs" Inherits="NotasEstudiantesWeb.ConsultarNotas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Consulta de Notas</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            // Cargar los estudiantes al cargar la página
            $.ajax({
                url: 'ConsultarNotas.aspx/ObtenerEstudiantes',
                type: 'POST',
                contentType: 'application/json',
                dataType: 'json',
                success: function (data) {
                    var estudiantes = JSON.parse(data.d);
                    var options = '<option value="">-- Seleccione un estudiante --</option>';
                    $.each(estudiantes, function (i, estudiante) {
                        options += '<option value="' + estudiante.id + '">' + estudiante.nombre + ' ' + estudiante.apellido + ' (' + estudiante.carnet + ')</option>';
                    });
                    $('#ddlEstudiante').append(options);
                },
                error: function (error) {
                    alert('Error al cargar los estudiantes: ' + error.responseText);
                }
            });

            // Manejar el envío del formulario de búsqueda
            $('#btnBuscar').click(function (e) {
                e.preventDefault();
                
                var idEstudiante = $('#ddlEstudiante').val();
                if (!idEstudiante) {
                    alert('Por favor seleccione un estudiante');
                    return;
                }

                $.ajax({
                    url: 'ConsultarNotas.aspx/ObtenerNotasPorEstudiante',
                    type: 'POST',
                    data: JSON.stringify({ idEstudiante: idEstudiante }),
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data) {
                        var notas = JSON.parse(data.d);
                        mostrarNotas(notas);
                    },
                    error: function (error) {
                        alert('Error al obtener las notas: ' + error.responseText);
                    }
                });
            });

            function mostrarNotas(notas) {
                var tbody = $('#tbodyNotas');
                tbody.empty();

                if (notas.length === 0) {
                    $('#resultadosNotas').hide();
                    alert('No se encontraron notas para este estudiante');
                    return;
                }

                $.each(notas, function (i, nota) {
                    var row = '<tr>' +
                        '<td>' + nota.nombre_materia + '</td>' +
                        '<td>' + nota.nombre_carrera + '</td>' +
                        '<td>' + nota.nota1.toFixed(2) + '</td>' +
                        '<td>' + nota.nota2.toFixed(2) + '</td>' +
                        '<td>' + nota.nota3.toFixed(2) + '</td>' +
                        '<td>' + nota.nota_final.toFixed(2) + '</td>' +
                        '<td>' + getEstadoNota(nota.nota_final) + '</td>' +
                        '</tr>';
                    tbody.append(row);
                });

                $('#resultadosNotas').show();
            }

            function getEstadoNota(notaFinal) {
                return notaFinal >= 6 ? '<span class="text-success">Aprobado</span>' : '<span class="text-danger">Reprobado</span>';
            }
        });
    </script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Consulta de Notas</h2>
        <form id="form1" runat="server">
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="ddlEstudiante" class="form-label">Estudiante:</label>
                    <select id="ddlEstudiante" class="form-select" required="required">
                        <option value="">-- Seleccione un estudiante --</option>
                    </select>
                </div>
                <div class="col-md-6 d-flex align-items-end">
                    <button id="btnBuscar" class="btn btn-primary">Buscar</button>
                </div>
            </div>
            
            <div id="resultadosNotas" class="mt-4" style="display: none;">
                <h4>Resultados Académicos</h4>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Materia</th>
                            <th>Carrera</th>
                            <th>Nota 1 (30%)</th>
                            <th>Nota 2 (30%)</th>
                            <th>Nota 3 (40%)</th>
                            <th>Nota Final</th>
                            <th>Estado</th>
                        </tr>
                    </thead>
                    <tbody id="tbodyNotas">
                    </tbody>
                </table>
            </div>
            
            <div class="row mt-3">
                <div class="col-md-12">
                    <a href="Default.aspx" class="btn btn-secondary">Regresar</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>