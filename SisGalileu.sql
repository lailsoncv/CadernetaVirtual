CREATE DATABASE [SisGalileu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SisGalileu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SisGalileu.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SisGalileu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SisGalileu_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SisGalileu] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SisGalileu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SisGalileu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SisGalileu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SisGalileu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SisGalileu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SisGalileu] SET ARITHABORT OFF 
GO
ALTER DATABASE [SisGalileu] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SisGalileu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SisGalileu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SisGalileu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SisGalileu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SisGalileu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SisGalileu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SisGalileu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SisGalileu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SisGalileu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SisGalileu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SisGalileu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SisGalileu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SisGalileu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SisGalileu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SisGalileu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SisGalileu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SisGalileu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SisGalileu] SET  MULTI_USER 
GO
ALTER DATABASE [SisGalileu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SisGalileu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SisGalileu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SisGalileu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SisGalileu] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SisGalileu]
GO
/****** Object:  Table [dbo].[Aluno]    Script Date: 29/04/2016 15:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aluno](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](80) NOT NULL,
	[responsavel] [varchar](80) NOT NULL,
	[cod_sala] [int] NOT NULL,
	[cod_serie] [int] NOT NULL,
	[cod_turma] [int] NOT NULL,
 CONSTRAINT [PK__Aluno__3213E83FF852669E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Aula]    Script Date: 29/04/2016 15:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aula](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [date] NOT NULL,
	[horaentrada] [varchar](5) NOT NULL,
	[horasaida] [varchar](5) NOT NULL,
	[cod_disciplina] [int] NOT NULL,
	[cod_professor] [int] NOT NULL,
	[cod_sala] [int] NOT NULL,
	[cod_serie] [int] NOT NULL,
	[cod_turma] [int] NOT NULL,
 CONSTRAINT [PK_Aula] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Disciplina]    Script Date: 29/04/2016 15:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Disciplina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Disciplina] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Faltas]    Script Date: 29/04/2016 15:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faltas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[data] [date] NOT NULL,
	[presente] [int] NOT NULL,
	[ausente] [int] NOT NULL,
	[cod_disciplina] [int] NOT NULL,
	[cod_id_aluno] [int] NOT NULL,
	[cod_professor] [int] NOT NULL,
 CONSTRAINT [PK_Faltas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professor]    Script Date: 29/04/2016 15:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Professor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Professor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sala]    Script Date: 29/04/2016 15:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sala](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Sala] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Serie]    Script Date: 29/04/2016 15:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Serie](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Serie] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Turma]    Script Date: 29/04/2016 15:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Turma](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Turma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 29/04/2016 15:37:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[nomeusuario] [varchar](25) NOT NULL,
	[senha] [varbinary](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNQ_Usuario_nomeusuario] UNIQUE NONCLUSTERED 
(
	[nomeusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_Sala] FOREIGN KEY([cod_sala])
REFERENCES [dbo].[Sala] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Aluno] CHECK CONSTRAINT [FK_Aluno_Sala]
GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_Serie] FOREIGN KEY([cod_serie])
REFERENCES [dbo].[Serie] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Aluno] CHECK CONSTRAINT [FK_Aluno_Serie]
GO
ALTER TABLE [dbo].[Aluno]  WITH CHECK ADD  CONSTRAINT [FK_Aluno_Turma] FOREIGN KEY([cod_turma])
REFERENCES [dbo].[Turma] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Aluno] CHECK CONSTRAINT [FK_Aluno_Turma]
GO
ALTER TABLE [dbo].[Aula]  WITH CHECK ADD  CONSTRAINT [FK_Aula_Disciplina] FOREIGN KEY([cod_disciplina])
REFERENCES [dbo].[Disciplina] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [FK_Aula_Disciplina]
GO
ALTER TABLE [dbo].[Aula]  WITH CHECK ADD  CONSTRAINT [FK_Aula_Professor] FOREIGN KEY([cod_professor])
REFERENCES [dbo].[Professor] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [FK_Aula_Professor]
GO
ALTER TABLE [dbo].[Aula]  WITH CHECK ADD  CONSTRAINT [FK_Aula_Sala] FOREIGN KEY([cod_sala])
REFERENCES [dbo].[Sala] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [FK_Aula_Sala]
GO
ALTER TABLE [dbo].[Aula]  WITH CHECK ADD  CONSTRAINT [FK_Aula_Serie] FOREIGN KEY([cod_serie])
REFERENCES [dbo].[Serie] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [FK_Aula_Serie]
GO
ALTER TABLE [dbo].[Aula]  WITH CHECK ADD  CONSTRAINT [FK_Aula_Turma] FOREIGN KEY([cod_turma])
REFERENCES [dbo].[Turma] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Aula] CHECK CONSTRAINT [FK_Aula_Turma]
GO
ALTER TABLE [dbo].[Faltas]  WITH CHECK ADD  CONSTRAINT [FK_Faltas_Aluno] FOREIGN KEY([cod_id_aluno])
REFERENCES [dbo].[Aluno] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Faltas] CHECK CONSTRAINT [FK_Faltas_Aluno]
GO
ALTER TABLE [dbo].[Faltas]  WITH CHECK ADD  CONSTRAINT [FK_Faltas_Disciplina2] FOREIGN KEY([cod_disciplina])
REFERENCES [dbo].[Disciplina] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Faltas] CHECK CONSTRAINT [FK_Faltas_Disciplina2]
GO
ALTER TABLE [dbo].[Faltas]  WITH CHECK ADD  CONSTRAINT [FK_Faltas_Professor] FOREIGN KEY([cod_professor])
REFERENCES [dbo].[Professor] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Faltas] CHECK CONSTRAINT [FK_Faltas_Professor]
GO
USE [master]
GO
ALTER DATABASE [SisGalileu] SET  READ_WRITE 
GO
