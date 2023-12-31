USE [master]
GO
/****** Object:  Database [WebFormsStudentManagement]    Script Date: 30/07/2023 10:21:52 pm ******/
CREATE DATABASE [WebFormsStudentManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebFormsStudentManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WebFormsStudentManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebFormsStudentManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\WebFormsStudentManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebFormsStudentManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebFormsStudentManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebFormsStudentManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebFormsStudentManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebFormsStudentManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebFormsStudentManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebFormsStudentManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebFormsStudentManagement] SET  MULTI_USER 
GO
ALTER DATABASE [WebFormsStudentManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebFormsStudentManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebFormsStudentManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebFormsStudentManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebFormsStudentManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebFormsStudentManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebFormsStudentManagement] SET QUERY_STORE = OFF
GO
USE [WebFormsStudentManagement]
GO
/****** Object:  Table [dbo].[tblClass]    Script Date: 30/07/2023 10:21:52 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClass](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchive] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblClass] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSection]    Script Date: 30/07/2023 10:21:52 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSection](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [nvarchar](50) NOT NULL,
	[ClassID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchive] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblSection] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStudent]    Script Date: 30/07/2023 10:21:52 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStudent](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NOT NULL,
	[StudentFatherName] [nvarchar](50) NOT NULL,
	[SectionID] [int] NOT NULL,
	[AdmissionDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsArchive] [bit] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblStudent] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblClass] ON 

INSERT [dbo].[tblClass] ([ClassID], [ClassName], [IsActive], [IsArchive], [CreatedOn], [UpdatedOn]) VALUES (1, N'1', 1, 0, CAST(N'2023-06-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblClass] ([ClassID], [ClassName], [IsActive], [IsArchive], [CreatedOn], [UpdatedOn]) VALUES (2, N'2', 1, 0, CAST(N'2023-06-27T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblClass] OFF
GO
SET IDENTITY_INSERT [dbo].[tblSection] ON 

INSERT [dbo].[tblSection] ([SectionID], [SectionName], [ClassID], [IsActive], [IsArchive], [CreatedOn], [UpatedOn]) VALUES (1, N'A', 1, 1, 0, CAST(N'2023-06-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblSection] ([SectionID], [SectionName], [ClassID], [IsActive], [IsArchive], [CreatedOn], [UpatedOn]) VALUES (2, N'B', 1, 1, 0, CAST(N'2023-06-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblSection] ([SectionID], [SectionName], [ClassID], [IsActive], [IsArchive], [CreatedOn], [UpatedOn]) VALUES (3, N'C', 1, 1, 0, CAST(N'2023-06-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblSection] ([SectionID], [SectionName], [ClassID], [IsActive], [IsArchive], [CreatedOn], [UpatedOn]) VALUES (4, N'A', 2, 1, 0, CAST(N'2023-06-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblSection] ([SectionID], [SectionName], [ClassID], [IsActive], [IsArchive], [CreatedOn], [UpatedOn]) VALUES (5, N'B', 2, 1, 0, CAST(N'2023-06-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tblSection] ([SectionID], [SectionName], [ClassID], [IsActive], [IsArchive], [CreatedOn], [UpatedOn]) VALUES (6, N'C', 2, 1, 0, CAST(N'2023-06-27T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tblSection] OFF
GO
ALTER TABLE [dbo].[tblSection]  WITH CHECK ADD  CONSTRAINT [FK_tblSection_tblClass] FOREIGN KEY([ClassID])
REFERENCES [dbo].[tblClass] ([ClassID])
GO
ALTER TABLE [dbo].[tblSection] CHECK CONSTRAINT [FK_tblSection_tblClass]
GO
ALTER TABLE [dbo].[tblStudent]  WITH CHECK ADD  CONSTRAINT [FK_tblStudent_tblSection] FOREIGN KEY([SectionID])
REFERENCES [dbo].[tblSection] ([SectionID])
GO
ALTER TABLE [dbo].[tblStudent] CHECK CONSTRAINT [FK_tblStudent_tblSection]
GO
USE [master]
GO
ALTER DATABASE [WebFormsStudentManagement] SET  READ_WRITE 
GO
