-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sp_ObtenerNotasPorEstudiante 
	-- Add the parameters for the stored procedure here
	@id_estudiante INT
AS
BEGIN
	SELECT m.nombre_materia,c.nombre_carrera,n.nota1,n.nota2,n.nota3,n.nota_final
	FROM Nota n
	INNER JOIN Materia m ON n.id_materia = m.id
	INNER JOIN Carrera c ON n.id_carrera = c.id
	WHERE n.id_estudiante = @id_estudiante
END
GO
