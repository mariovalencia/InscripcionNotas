<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresarNotas.aspx.cs" Inherits="NotasEstudiantesWeb.IngresarNotas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro de Notas</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            // Cargar las carreras al cargar la página
            cargarCarreras();

            // Evento para cuando cambia la carrera seleccionada
            $('#ddlCarrera').change(function () {
                var idCarrera = $(this).val();
                if (idCarrera) {
                    cargarEstudiantes(idCarrera);
                    cargarMaterias(idCarrera);
                } else {
                    $('#ddlEstudiante').empty().append('<option value="">-- Seleccione un estudiante --</option>');
                    $('#ddlMateria').empty().append('<option value="">-- Seleccione una materia --</option>');
                }
            });

            // Manejar el envío del formulario
            $('#btnGuardar').click(function (e) {
                e.preventDefault();
                
                if (validarNotas()) {
                    var nota = {
                        id_estudiante: parseInt($('#ddlEstudiante').val()),
                        id_materia: parseInt($('#ddlMateria').val()),
                        id_carrera: parseInt($('#ddlCarrera').val()),
                        nota1: parseFloat($('#txtNota1').val()),
                        nota2: parseFloat($('#txtNota2').val()),
                        nota3: parseFloat($('#txtNota3').val())
                    };

                    $.ajax({
                        url: 'IngresarNotas.aspx/GuardarNota',
                        type: 'POST',
                        data: JSON.stringify({ nota: nota }),
                        contentType: 'application/json',
                        dataType: 'json',
                        success: function (data) {
                            alert('Nota guardada exitosamente');
                            limpiarFormulario();
                        },
                        error: function (error) {
                            alert('Error al guardar la nota: ' + error.responseText);
                        }
                    });
                }
            });

            function cargarCarreras() {
                $.ajax({
                    url: 'IngresarNotas.aspx/ObtenerCarreras',
                    type: 'POST',
                    contentType: 'application/json',
                    data: '{}',
                    dataType: 'json',
                    success: function (data) {
                        var carreras = JSON.parse(data.d);
                        var options = '<option value="">-- Seleccione una carrera --</option>';
                        $.each(carreras, function (i, carrera) {
                            options += '<option value="' + carrera.id + '">' + carrera.nombre_carrera + '</option>';
                        });
                        $('#ddlCarrera').empty().append(options);
                    },
                    error: function (error) {
                        alert('Error al cargar las carreras: ' + error.responseText);
                    }
                });
            }

            function cargarEstudiantes(idCarrera) {
                $.ajax({
                    url: 'IngresarNotas.aspx/ObtenerEstudiantesPorCarrera',
                    type: 'POST',
                    data: JSON.stringify({ idCarrera: idCarrera }),
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data) {
                        var estudiantes = JSON.parse(data.d);
                        var options = '<option value="">-- Seleccione un estudiante --</option>';
                        $.each(estudiantes, function (i, estudiante) {
                            options += '<option value="' + estudiante.id + '">' + estudiante.nombre + ' ' + estudiante.apellido + ' (' + estudiante.carnet + ')</option>';
                        });
                        $('#ddlEstudiante').empty().append(options);
                    },
                    error: function (error) {
                        alert('Error al cargar los estudiantes: ' + error.responseText);
                    }
                });
            }

            function cargarMaterias(idCarrera) {
                $.ajax({
                    url: 'IngresarNotas.aspx/ObtenerMateriasPorCarrera',
                    type: 'POST',
                    data: JSON.stringify({ idCarrera: idCarrera }),
                    contentType: 'application/json',
                    dataType: 'json',
                    success: function (data) {
                        var materias = JSON.parse(data.d);
                        var options = '<option value="">-- Seleccione una materia --</option>';
                        $.each(materias, function (i, materia) {
                            options += '<option value="' + materia.id + '">' + materia.nombre_materia + '</option>';
                        });
                        $('#ddlMateria').empty().append(options);
                    },
                    error: function (error) {
                        alert('Error al cargar las materias: ' + error.responseText);
                    }
                });
            }

            function validarNotas() {
                var nota1 = parseFloat($('#txtNota1').val());
                var nota2 = parseFloat($('#txtNota2').val());
                var nota3 = parseFloat($('#txtNota3').val());

                if (isNaN(nota1) || isNaN(nota2) || isNaN(nota3)) {
                    alert('Por favor ingrese valores numéricos para las notas');
                    return false;
                }

                if (nota1 < 0 || nota1 > 10 || nota2 < 0 || nota2 > 10 || nota3 < 0 || nota3 > 10) {
                    alert('Las notas deben estar entre 0 y 10');
                    return false;
                }

                return true;
            }

            function limpiarFormulario() {
                $('#txtNota1').val('');
                $('#txtNota2').val('');
                $('#txtNota3').val('');
                $('#ddlMateria').val('');
                $('#ddlEstudiante').val('');
                $('#ddlCarrera').val('');
            }
        });
    </script>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Registro de Notas</h2>
        <form id="form1" runat="server">
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="ddlCarrera" class="form-label">Carrera:</label>
                    <select id="ddlCarrera" class="form-select" required="required">
                        <option value="">-- Seleccione una carrera --</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="ddlEstudiante" class="form-label">Estudiante:</label>
                    <select id="ddlEstudiante" class="form-select" required="required">
                        <option value="">-- Seleccione un estudiante --</option>
                    </select>
                </div>
                <div class="col-md-4">
                    <label for="ddlMateria" class="form-label">Materia:</label>
                    <select id="ddlMateria" class="form-select" required="required">
                        <option value="">-- Seleccione una materia --</option>
                    </select>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-4">
                    <label for="txtNota1" class="form-label">Nota 1 (30%):</label>
                    <input type="number" id="txtNota1" class="form-control" min="0" max="10" step="0.01" required="required" />
                </div>
                <div class="col-md-4">
                    <label for="txtNota2" class="form-label">Nota 2 (30%):</label>
                    <input type="number" id="txtNota2" class="form-control" min="0" max="10" step="0.01" required="required" />
                </div>
                <div class="col-md-4">
                    <label for="txtNota3" class="form-label">Nota 3 (40%):</label>
                    <input type="number" id="txtNota3" class="form-control" min="0" max="10" step="0.01" required="required" />
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