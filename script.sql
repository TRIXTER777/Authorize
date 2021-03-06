USE [master]
GO
/****** Object:  Database [ShopIluyas1]    Script Date: 08.05.2021 21:24:54 ******/
CREATE DATABASE [ShopIluyas1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopIluyas1', FILENAME = N'D:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopIluyas1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopIluyas1_log', FILENAME = N'D:\SQL\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopIluyas1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopIluyas1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopIluyas1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopIluyas1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopIluyas1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopIluyas1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopIluyas1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopIluyas1] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopIluyas1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopIluyas1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopIluyas1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopIluyas1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopIluyas1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopIluyas1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopIluyas1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopIluyas1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopIluyas1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopIluyas1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopIluyas1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopIluyas1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopIluyas1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopIluyas1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopIluyas1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopIluyas1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopIluyas1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopIluyas1] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopIluyas1] SET  MULTI_USER 
GO
ALTER DATABASE [ShopIluyas1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopIluyas1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopIluyas1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopIluyas1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopIluyas1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopIluyas1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopIluyas1', N'ON'
GO
ALTER DATABASE [ShopIluyas1] SET QUERY_STORE = OFF
GO
USE [ShopIluyas1]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 08.05.2021 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientHasOrder]    Script Date: 08.05.2021 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientHasOrder](
	[ClientId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_ClientHasOrder_1] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC,
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListOfProductsInOrder]    Script Date: 08.05.2021 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListOfProductsInOrder](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_ListOfProductsInOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 08.05.2021 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[id] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08.05.2021 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id_Order] [int] NOT NULL,
	[OrderName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 08.05.2021 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](10) NULL,
	[Price] [decimal](7, 2) NULL,
	[Description] [nvarchar](30) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08.05.2021 21:24:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SurName] [nvarchar](15) NULL,
	[FirstName] [nvarchar](15) NULL,
	[LastName] [nvarchar](15) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Client] ([ID], [UserID]) VALUES (1, 4)
INSERT [dbo].[Client] ([ID], [UserID]) VALUES (2, 5)
INSERT [dbo].[Client] ([ID], [UserID]) VALUES (3, 6)
GO
INSERT [dbo].[ClientHasOrder] ([ClientId], [OrderId]) VALUES (1, 1)
INSERT [dbo].[ClientHasOrder] ([ClientId], [OrderId]) VALUES (2, 2)
INSERT [dbo].[ClientHasOrder] ([ClientId], [OrderId]) VALUES (3, 3)
GO
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (1, 1)
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (1, 2)
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (1, 3)
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (2, 2)
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (3, 1)
INSERT [dbo].[ListOfProductsInOrder] ([OrderID], [ProductID]) VALUES (3, 3)
GO
INSERT [dbo].[Manager] ([id], [UserID], [Login], [Password]) VALUES (1, 1, N'LoginPassword', N'Asdcxzaseqw')
INSERT [dbo].[Manager] ([id], [UserID], [Login], [Password]) VALUES (2, 2, N'PasswordLogin', N'VZXcasdasdqw')
INSERT [dbo].[Manager] ([id], [UserID], [Login], [Password]) VALUES (3, 3, N'Parol', N'45645adSq')
GO
INSERT [dbo].[Order] ([id_Order], [OrderName]) VALUES (1, N'order_1')
INSERT [dbo].[Order] ([id_Order], [OrderName]) VALUES (2, N'order_2')
INSERT [dbo].[Order] ([id_Order], [OrderName]) VALUES (3, N'order_3')
GO
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (1, N'Tea', CAST(13.37 AS Decimal(7, 2)), N'')
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (2, N'Chocolate', CAST(420.69 AS Decimal(7, 2)), N'')
INSERT [dbo].[Products] ([ID], [Name], [Price], [Description]) VALUES (3, N'Apple', CAST(14.88 AS Decimal(7, 2)), N'')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [SurName], [FirstName], [LastName]) VALUES (1, N'Иван', N'Иванов', N'Петрович')
INSERT [dbo].[User] ([id], [SurName], [FirstName], [LastName]) VALUES (2, N'Петр', N'Данилов', N'Иванович')
INSERT [dbo].[User] ([id], [SurName], [FirstName], [LastName]) VALUES (3, N'Елизавета', N'Пашковская', N'Олеговна')
INSERT [dbo].[User] ([id], [SurName], [FirstName], [LastName]) VALUES (4, N'Савелий', N'Уваров', N'Игоревич')
INSERT [dbo].[User] ([id], [SurName], [FirstName], [LastName]) VALUES (5, N'Роберт', N'Никонов', N'Максимович')
INSERT [dbo].[User] ([id], [SurName], [FirstName], [LastName]) VALUES (6, N'Кабанов', N'Эльдар', N'Максович')
INSERT [dbo].[User] ([id], [SurName], [FirstName], [LastName]) VALUES (8, N'svwerv', N'dsfgsg', N'sdfwe')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_User]
GO
ALTER TABLE [dbo].[ClientHasOrder]  WITH CHECK ADD  CONSTRAINT [FK_ClientHasOrder_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientHasOrder] CHECK CONSTRAINT [FK_ClientHasOrder_Client]
GO
ALTER TABLE [dbo].[ClientHasOrder]  WITH CHECK ADD  CONSTRAINT [FK_ClientHasOrder_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([id_Order])
GO
ALTER TABLE [dbo].[ClientHasOrder] CHECK CONSTRAINT [FK_ClientHasOrder_Order]
GO
ALTER TABLE [dbo].[ListOfProductsInOrder]  WITH CHECK ADD  CONSTRAINT [FK_ListOfProductsInOrder_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([id_Order])
GO
ALTER TABLE [dbo].[ListOfProductsInOrder] CHECK CONSTRAINT [FK_ListOfProductsInOrder_Order]
GO
ALTER TABLE [dbo].[ListOfProductsInOrder]  WITH CHECK ADD  CONSTRAINT [FK_ListOfProductsInOrder_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[ListOfProductsInOrder] CHECK CONSTRAINT [FK_ListOfProductsInOrder_Products]
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD  CONSTRAINT [FK_Manager_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Manager] CHECK CONSTRAINT [FK_Manager_User]
GO
USE [master]
GO
ALTER DATABASE [ShopIluyas1] SET  READ_WRITE 
GO
