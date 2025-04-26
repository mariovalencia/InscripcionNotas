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
CREATE PROCEDURE sp_InsertarNota 
	-- Add the parameters for the stored procedure here
	@id_estudiante INT,
	@id_materia INT,
	@id_carrera INT,
	@nota1 DECIMAL(5,2),
	@nota2 DECIMAL(5,2),
	@nota3 DECIMAL(5,2)
AS
BEGIN
	DECLARE @nota_final DECIMAL(5,2) SET @nota_final = (@nota1 * 0.3) + (@nota2 * 0.3) + (@nota3 * 0.4)

	INSERT INTO Nota(id_estudiante,id_materia,id_carrera,nota1,nota2,nota3,nota_final) VALUES(@id_estudiante,@id_materia,@id_carrera,@nota1,@nota2,@nota3,@nota_final)
END
GO
