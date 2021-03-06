USE [master]
GO
/****** Object:  Database [Proyecto]    Script Date: 27/4/2018 11:59:54 a. m. ******/
CREATE DATABASE [Proyecto]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Proyecto', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Proyecto.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Proyecto_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Proyecto_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Proyecto] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Proyecto].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Proyecto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Proyecto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Proyecto] SET ARITHABORT OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Proyecto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Proyecto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Proyecto] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Proyecto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Proyecto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Proyecto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Proyecto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Proyecto] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Proyecto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Proyecto] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Proyecto] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Proyecto] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Proyecto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Proyecto] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Proyecto] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Proyecto] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Proyecto] SET  MULTI_USER 
GO
ALTER DATABASE [Proyecto] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Proyecto] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Proyecto] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Proyecto] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Proyecto]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 27/4/2018 11:59:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Encontrado]    Script Date: 27/4/2018 11:59:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Encontrado](
	[IdEncontrado] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [varchar](50) NULL,
	[IdCategoria] [varchar](50) NULL,
	[NombreEncontrado] [varchar](50) NULL,
	[FechaEncontrado] [date] NULL,
	[LugarEncontrado] [varchar](50) NULL,
	[ImagenEncontrado] [varchar](50) NULL,
	[DescripcionEncontrado] [varchar](500) NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Encontrado] PRIMARY KEY CLUSTERED 
(
	[IdEncontrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Perdido]    Script Date: 27/4/2018 11:59:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Perdido](
	[IdPerdido] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [varchar](50) NULL,
	[IdCategoria] [varchar](50) NULL,
	[NombrePerdido] [varchar](50) NULL,
	[FechaPerdido] [date] NULL,
	[LugarPerdido] [varchar](50) NULL,
	[ImagenPerdido] [varchar](50) NULL,
	[DescripcionPerdido] [varchar](500) NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Perdido] PRIMARY KEY CLUSTERED 
(
	[IdPerdido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 27/4/2018 11:59:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NULL,
	[Mail] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Contraseña] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[BuscarEncontrado]    Script Date: 27/4/2018 11:59:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BuscarEncontrado] 
	
@categoria varchar (50), @fechaencontrado varchar(50)

AS
BEGIN

SELECT * FROM Encontrado INNER JOIN Categoria  ON Encontrado.IdCategoria = Categoria.IdCategoria
WHERE @categoria = Encontrado.IdCategoria;

END

GO
/****** Object:  StoredProcedure [dbo].[CargarEncontrado]    Script Date: 27/4/2018 11:59:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarEncontrado] 
@idusuario varchar(50), @idcategoria varchar(50), @nombreencontrado varchar(50), @fechaencontrado date, @lugarencontrado varchar(50), @imagenencontrado varchar(50), @descripcionencontrado varchar(50), @activo bit
AS
BEGIN

INSERT INTO Encontrado (IdUsuario , IdCategoria, NombreEncontrado, FechaEncontrado, LugarEncontrado, ImagenEncontrado, DescripcionEncontrado, Activo) 
VALUES (@idusuario, @idcategoria,  @nombreencontrado, @fechaencontrado, @lugarencontrado, @imagenencontrado, @descripcionencontrado, @activo);
	
END

GO
/****** Object:  StoredProcedure [dbo].[CargarPerdido]    Script Date: 27/4/2018 11:59:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CargarPerdido]
@idusuario varchar(50), @idcategoria varchar(50), @nombreperdido varchar(50), @fechaperdido date, @lugarperdido varchar(50), @imagenperdido varchar(50), @descripcionperdido varchar(50), @activo bit
AS
BEGIN
INSERT INTO Perdido (IdUsuario , IdCategoria, NombrePerdido, FechaPerdido, LugarPerdido, ImagenPerdido, DescripcionPerdido, Activo) 
VALUES (@idusuario, @idcategoria,  @nombreperdido, @fechaperdido, @lugarperdido, @imagenperdido, @descripcionperdido, @activo);
	
END

GO
USE [master]
GO
ALTER DATABASE [Proyecto] SET  READ_WRITE 
GO
