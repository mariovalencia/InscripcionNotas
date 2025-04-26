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
CREATE PROCEDURE sp_InsertarEstudiante 
	-- Add the parameters for the stored procedure here
	@nombre nvarchar(100),
	@apellido nvarchar(100),
	@carnet nvarchar(50),
	@id_carrera int
AS
BEGIN
	INSERT INTO Estudiante (nombre,apellido,carnet,id_carrera)values(@nombre,@apellido,@carnet,@id_carrera)
END
GO
