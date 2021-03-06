USE [master]
GO
/****** Object:  Database [EmployeeDB]    Script Date: 5/25/2015 12:15:02 PM ******/
CREATE DATABASE [EmployeeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\EmployeeDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\EmployeeDB_1.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EmployeeDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmployeeDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmployeeDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EmployeeDB] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [EmployeeDB]
GO
/****** Object:  Table [dbo].[tbl_Designation]    Script Date: 5/25/2015 12:15:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Title] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_EmployeeInfo]    Script Date: 5/25/2015 12:15:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_EmployeeInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[DesignationId] [int] NULL,
 CONSTRAINT [PK_tblEmployeeInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Designation] ON 

INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (1, N'01', N'CEO')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (2, N'02', N'CTO')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (3, N'03', N'CFO')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (4, N'04', N'COO')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (5, N'05', N'GM')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (6, N'07', N'AGM')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (7, N'08', N'Manager')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (8, N'19', N'Executive')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (9, N'38', N'Officer')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (15, N'110', N'Doctor')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (16, N'777', N'Engineer')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (17, N'12', N'sr.officer')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (18, N'123', N'worker')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (19, N'14', N'Programmer')
SET IDENTITY_INSERT [dbo].[tbl_Designation] OFF
SET IDENTITY_INSERT [dbo].[tbl_EmployeeInfo] ON 

INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (27, N'Shahjahan Salim', N'salim@gmail.com', N'Road 12, Block - A, Shawrapara, Mirpur, Dhaka', 1)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (28, N'Aman Kobir', N'kabyo@yahoo.com', N'13 Puranapaltan, Dhaka', 1)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (31, N'Nur-E Jahan', N'jahan@mail.com', N'102 Bhuter goli, Kathal Bagan', 3)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (32, N'Nazmul Hasan', N'nh@gmail.com', N'Ctg', 4)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (33, N'Habib', N'hb@mail.com', N'Dhaka', 8)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1032, N'Mituc C. Paul', N'mailtommrr@gmail.com', N'Farmgate Dhaka...', 15)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1034, N'fdf', N'kjyi', N'ogyufiyt', 1)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1035, N'Mizan', N'M@yahoo.com', N'laxmipur', 1)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1036, N'nahid', N'n@gmail.com', N'feni', 17)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1037, N'mizna', N'fhjl', N'dhaka', 1)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1038, N'Monir', N'mo@gmail.com', N'Dhaka', 19)
SET IDENTITY_INSERT [dbo].[tbl_EmployeeInfo] OFF
ALTER TABLE [dbo].[tbl_EmployeeInfo]  WITH CHECK ADD  CONSTRAINT [FK_tbl_EmployeeInfo_tbl_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[tbl_Designation] ([Id])
GO
ALTER TABLE [dbo].[tbl_EmployeeInfo] CHECK CONSTRAINT [FK_tbl_EmployeeInfo_tbl_Designation]
GO
USE [master]
GO
ALTER DATABASE [EmployeeDB] SET  READ_WRITE 
GO
