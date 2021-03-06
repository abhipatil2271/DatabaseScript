USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 2020-08-09 3:09:45 PM ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = OFF
GO
USE [TestDB]
GO
/****** Object:  Table [dbo].[books]    Script Date: 2020-08-09 3:09:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[id] [int] NOT NULL,
	[title] [varchar](250) NULL,
	[year] [int] NULL,
	[author] [varchar](250) NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Info]    Script Date: 2020-08-09 3:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Info](
	[Product_Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product_Info] PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 2020-08-09 3:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ratings](
	[reviewer_id] [int] NULL,
	[book_id] [int] NULL,
	[rating] [int] NULL,
	[rating_date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviewers]    Script Date: 2020-08-09 3:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviewers](
	[id] [int] NOT NULL,
	[name] [varchar](250) NULL,
 CONSTRAINT [PK_reviewers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[books] ([id], [title], [year], [author]) VALUES (101, N'A Tale Of Two Cities', 1859, N'Charles Dickens')
INSERT [dbo].[books] ([id], [title], [year], [author]) VALUES (102, N'The Lord of the Rings ', 1955, N' J. R. R. Tolkien')
INSERT [dbo].[books] ([id], [title], [year], [author]) VALUES (103, N'The Hobbit', 1937, NULL)
INSERT [dbo].[books] ([id], [title], [year], [author]) VALUES (104, N'The Little Prince', 1943, N'Antoine de Saint-Exupéry')
INSERT [dbo].[Product_Info] ([Product_Id], [Name], [Description], [Price], [Image]) VALUES (N'6fce1d0b-1751-4537-82e5-c17bb314accb', N'Laptop', N'Dell 3525', 8888, N'Images/laptop.jpg')
INSERT [dbo].[Product_Info] ([Product_Id], [Name], [Description], [Price], [Image]) VALUES (N'e1dd4861-4cfd-4153-a500-eeea1eb68b5a', N'Rohini Chinta', N'Demo Des', 1122, N'Images/1610025.jpg')
INSERT [dbo].[ratings] ([reviewer_id], [book_id], [rating], [rating_date]) VALUES (15201, 101, 2, CAST(N'2015-02-11' AS Date))
INSERT [dbo].[ratings] ([reviewer_id], [book_id], [rating], [rating_date]) VALUES (15201, 101, 4, CAST(N'2015-06-16' AS Date))
INSERT [dbo].[ratings] ([reviewer_id], [book_id], [rating], [rating_date]) VALUES (53202, 103, 4, NULL)
INSERT [dbo].[reviewers] ([id], [name]) VALUES (15201, N'Joe Martinez')
INSERT [dbo].[reviewers] ([id], [name]) VALUES (44203, N'John Smith')
INSERT [dbo].[reviewers] ([id], [name]) VALUES (53202, N' Alice Lewis')
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD  CONSTRAINT [FK_ratings_books] FOREIGN KEY([book_id])
REFERENCES [dbo].[books] ([id])
GO
ALTER TABLE [dbo].[ratings] CHECK CONSTRAINT [FK_ratings_books]
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD  CONSTRAINT [FK_ratings_reviewers] FOREIGN KEY([reviewer_id])
REFERENCES [dbo].[reviewers] ([id])
GO
ALTER TABLE [dbo].[ratings] CHECK CONSTRAINT [FK_ratings_reviewers]
GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
