USE [master]
GO
/****** Object:  Database [EmployeeDB]    Script Date: 5/25/2015 12:01:28 PM ******/
CREATE DATABASE [EmployeeDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeDB', FILENAME = N'I:\SetupFiles\SQLServer\MSSQL11.SQLEXPRESS\MSSQL\DATA\EmployeeDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeDB_log', FILENAME = N'I:\SetupFiles\SQLServer\MSSQL11.SQLEXPRESS\MSSQL\DATA\EmployeeDB_1.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[tbl_Designation]    Script Date: 5/25/2015 12:01:28 PM ******/
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
/****** Object:  Table [dbo].[tbl_EmployeeInfo]    Script Date: 5/25/2015 12:01:28 PM ******/
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

INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (21, N'101DH', N'Doctor')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (22, N'102DH', N'Senior Executive')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (23, N'103DH', N'Engineer')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (24, N'123gh', N'CEO')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (25, N'120GH', N'Jr. Executive')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (26, N'203JU', N'Accountant')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (27, N'1234FH', N'dfv efe')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (28, N'405TY', N'Driver')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (29, N'234KJ', N'Driver1')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (30, N'1234fhf', N'DR1')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (31, N'dgf123', N'Sales Officer')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (32, N'fg456', N'Shop Keeper')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (33, N'1011DF', N'Nurse')
INSERT [dbo].[tbl_Designation] ([Id], [Code], [Title]) VALUES (34, N'1023JU', N'Teacher')
SET IDENTITY_INSERT [dbo].[tbl_Designation] OFF
SET IDENTITY_INSERT [dbo].[tbl_EmployeeInfo] ON 

INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1037, N'Mahmud', N'm@gmail.com', N'Sylhet', 22)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1038, N'Hamid', N'h@gmail.com', N'Dhaka', 23)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1039, N'dscsdsd', N'df', N'dfsg ', 24)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1040, N'sdfd', N'dfg', N'suydw ', 24)
INSERT [dbo].[tbl_EmployeeInfo] ([Id], [Name], [Email], [Address], [DesignationId]) VALUES (1041, N'Mijan', N'mm@gmail.com', N'Lokkipur', 31)
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
