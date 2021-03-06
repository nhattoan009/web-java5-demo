USE [master]
GO
/****** Object:  Database [J5Shop]    Script Date: 6/21/2021 4:58:40 AM ******/
CREATE DATABASE [J5Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J5Shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\J5Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J5Shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\J5Shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [J5Shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J5Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J5Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J5Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J5Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [J5Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J5Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J5Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J5Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J5Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J5Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J5Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J5Shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [J5Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J5Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J5Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J5Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J5Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J5Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J5Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J5Shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J5Shop] SET  MULTI_USER 
GO
ALTER DATABASE [J5Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J5Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J5Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J5Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [J5Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [J5Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [J5Shop] SET QUERY_STORE = OFF
GO
USE [J5Shop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 6/21/2021 4:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/21/2021 4:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[image] [nvarchar](100) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 6/21/2021 4:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/21/2021 4:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](12) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/21/2021 4:58:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[image] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [char](4) NOT NULL,
	[DESCRIPTION] [nvarchar](100) NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_Produts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Activated], [Admin]) VALUES (N'nhattoan', N'123123', N'huynh nhat toan', N'toan@gmail.com', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Activated], [Admin]) VALUES (N'nhattoan123', N'1234', N'huynh toan', N'toan123@gmail.com', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Activated], [Admin]) VALUES (N'teonv', N'1234', N'huynh vawn tan', N'teo@gmail.com.vn', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Activated], [Admin]) VALUES (N'toan', N'123', N'huynh nhat toan', N'toan@gmail.com', 1, 1)
GO
INSERT [dbo].[Categories] ([Id], [Name], [image]) VALUES (N'    ', N'', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [image]) VALUES (N'CHO1', N'Chuối cambodia', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [image]) VALUES (N'KHO2', N'Đồ hộp', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [image]) VALUES (N'NUEP', N'Nước ép', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [image]) VALUES (N'NUOC', N'Hoa qua', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [image]) VALUES (N'RAU1', N'Rau tươi', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [image]) VALUES (N'RAU2', N'Hoa quả tươi', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [image]) VALUES (N'TCAY', N'Trái cây tươi', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [image]) VALUES (N'THIT', N'Thịt sống', NULL)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Phone]) VALUES (5, NULL, CAST(N'2021-06-20T00:00:00.000' AS DateTime), N'', N'0123123123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Phone]) VALUES (6, NULL, CAST(N'2021-06-20T00:00:00.000' AS DateTime), N'can tho 288', N'0123123123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Phone]) VALUES (23, NULL, CAST(N'2021-06-21T00:00:00.000' AS DateTime), N'can tho 288 222', N'0123123123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Phone]) VALUES (24, NULL, CAST(N'2021-06-21T00:00:00.000' AS DateTime), N'can tho 288', N'0123123123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Phone]) VALUES (25, NULL, CAST(N'2021-06-21T00:00:00.000' AS DateTime), N'can tho 288', N'0123123123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Phone]) VALUES (26, NULL, CAST(N'2021-06-21T00:00:00.000' AS DateTime), N'can tho 288', N'0123123123')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Phone]) VALUES (27, NULL, CAST(N'2021-06-21T00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Phone]) VALUES (28, NULL, CAST(N'2021-06-21T00:00:00.000' AS DateTime), N'', N'')
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Phone]) VALUES (29, NULL, CAST(N'2021-06-21T00:00:00.000' AS DateTime), N'', N'')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId], [DESCRIPTION], [discount]) VALUES (25, N'rau', N'1', 3000, CAST(N'2021-06-15' AS Date), 1, N'TCAY', N'tao ngot', 10)
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId], [DESCRIPTION], [discount]) VALUES (26, N'Táo đỏ', N'1', 3000, CAST(N'2021-06-15' AS Date), 1, N'RAU2', N'tao ngot', 10)
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId], [DESCRIPTION], [discount]) VALUES (35, N'Nho khô', N'1', 2000, CAST(N'2021-06-18' AS Date), 1, N'RAU2', N'Nho khô nhập khẩu', 0)
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId], [DESCRIPTION], [discount]) VALUES (36, N'Táo đỏ', N'1', 5000, CAST(N'2021-06-18' AS Date), 1, N'TCAY', N'Táo đài loan thơm ngon', 0)
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId], [DESCRIPTION], [discount]) VALUES (37, N'Xoài Malaysia', N'1', 13000, CAST(N'2021-06-18' AS Date), 1, N'RAU2', N'Xoài rất ngon', 0)
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId], [DESCRIPTION], [discount]) VALUES (38, N'Rau cải', N'1', 3200, CAST(N'2021-06-18' AS Date), 1, N'RAU1', N'Rau tươi', 0)
INSERT [dbo].[Products] ([Id], [Name], [image], [Price], [CreateDate], [Available], [CategoryId], [DESCRIPTION], [discount]) VALUES (39, N'Bơ chín Mianma', N'1', 32000, CAST(N'2021-06-18' AS Date), 1, N'TCAY', N'Bơ chín dẻo ngon', 20)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [UK_OrderDetails]    Script Date: 6/21/2021 4:58:41 AM ******/
ALTER TABLE [dbo].[OrderDetails] ADD  CONSTRAINT [UK_OrderDetails] UNIQUE NONCLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Produts_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Produts_Categories]
GO
USE [master]
GO
ALTER DATABASE [J5Shop] SET  READ_WRITE 
GO
