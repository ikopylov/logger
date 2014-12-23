USE [TestLog]
GO
/****** Object:  StoredProcedure [dbo].[LogInsertEvent]    Script Date: 04.09.2012 16:00:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogInsert]
	@Time datetime,
           @Level tinyint,
           @Modul varchar(50),
           @Namespace varchar(max) = NULL,
           @Class varchar(50) = NULL,
           @Method varchar(50) = NULL,
           @Message varchar(max),
           @Exception varchar(max) = NULL,
           @Stacksources varchar(max) = NULL,
           @Context xml = NULL
AS
BEGIN
	BEGIN TRANSACTION
	
	INSERT INTO [dbo].[Logs]
           ([Time]
           ,[Level]
           ,[Modul]
           ,[Namespace]
           ,[Class]
           ,[Method]
           ,[Message]
           ,[Exception]
           ,[Stacksources]
           ,[Context])
     VALUES
           (@Time,
		   @Level,
           @Modul,
           @Namespace,
           @Class,
           @Method,
           @Message,
           @Exception,
           @Stacksources,
           @Context)

	COMMIT TRANSACTION
END
