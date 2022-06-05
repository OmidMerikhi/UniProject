USE [master]
GO
/****** Object:  Database [UniProject]    Script Date: 6/5/2022 8:54:36 PM ******/
CREATE DATABASE [UniProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\UniProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\UniProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UniProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniProject] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UniProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UniProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniProject] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [UniProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniProject] SET  MULTI_USER 
GO
ALTER DATABASE [UniProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UniProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UniProject] SET QUERY_STORE = OFF
GO
USE [UniProject]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/5/2022 8:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 6/5/2022 8:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Family] [nvarchar](max) NOT NULL,
	[MedicalCode] [nvarchar](max) NOT NULL,
	[Gender] [bit] NOT NULL,
	[OfficeAddress] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[OfficePhone] [nvarchar](max) NOT NULL,
	[UserId] [int] NULL,
	[SpecialtyId] [int] NOT NULL,
	[SpecialtyTitle] [nvarchar](max) NOT NULL,
	[OfficeName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorToPresents]    Script Date: 6/5/2022 8:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorToPresents](
	[DoctorId] [int] NOT NULL,
	[PresentId] [int] NOT NULL,
 CONSTRAINT [PK_DoctorToPresents] PRIMARY KEY CLUSTERED 
(
	[DoctorId] ASC,
	[PresentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prepresents]    Script Date: 6/5/2022 8:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prepresents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DayPresent] [nvarchar](max) NOT NULL,
	[HoursPresent] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Prepresents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservs]    Script Date: 6/5/2022 8:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[VisitDate] [nvarchar](max) NOT NULL,
	[ReservationCode] [nvarchar](max) NOT NULL,
	[RequestDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Reservs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sickness]    Script Date: 6/5/2022 8:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sickness](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpecialityId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Sickness] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialtys]    Script Date: 6/5/2022 8:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialtys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Specialtys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/5/2022 8:54:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Family] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[MeliCode] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[JoinDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220519154017_CreateDbAnd3Tbls', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220525115956_EditUserModel', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220603075335_EditModel1', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220603142158_Edit2', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220604100136_ModelEdit3', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220605132440_EditDoctorModel', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220605133719_EditReservModel', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220605135416_EditReservModelForCode', N'6.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220605151854_EditReservModelForRequestDate', N'6.0.5')
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (6, N'علی', N'رضوانی', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'ali.r@gmail.com', N'تهران', N'32424324324', NULL, 4, N'متخصص کودکان', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (7, N'محمد', N'ارمقان', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'm.armaghan@gmail.com', N'تهران', N'32424324324', NULL, 1, N'پزشک عمومی', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (8, N'طناز', N'زاهدی', N'234324', 0, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N't.zahedi@gmail.com', N'تهران', N'32424324324', NULL, 2, N'متخصص گوش و حلق و بینی', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (9, N'شهرام', N'محمدی', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'ali.r@gmail.com', N'تهران', N'32424324324', NULL, 1, N'پزشک عمومی', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (10, N'زهرا', N'مروندی', N'234324', 0, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'm.armaghan@gmail.com', N'تهران', N'32424324324', NULL, 1, N'پزشک عمومی', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (11, N'رامین', N'باقری', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N't.zahedi@gmail.com', N'تهران', N'32424324324', NULL, 2, N'متخصص گوش و حلق و بینی', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (12, N'عاطفه', N'علیمرادی', N'234324', 0, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'ali.r@gmail.com', N'تهران', N'32424324324', NULL, 4, N'متخصص کودکان', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (13, N'بهرام', N'لاجوردی', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'm.armaghan@gmail.com', N'تهران', N'32424324324', NULL, 5, N'متخصص بیماری های عفونی', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (14, N'آراد', N'شفیعی', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N't.zahedi@gmail.com', N'تهران', N'32424324324', NULL, 5, N'متخصص بیماری های عفونی', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (15, N'فرشید', N'صابری', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'ali.r@gmail.com', N'تهران', N'32424324324', NULL, 6, N'روانپزشک', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (16, N'فاطمه', N'ارمقان', N'234324', 0, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'm.armaghan@gmail.com', N'تهران', N'32424324324', NULL, 6, N'روانپزشک', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (17, N'یلدا', N'مرادی', N'234324', 0, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N't.zahedi@gmail.com', N'تهران', N'32424324324', NULL, 8, N'متخصص چشم', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (18, N'علی', N'رضوی', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'ali.r@gmail.com', N'تهران', N'32424324324', NULL, 8, N'متخصص چشم', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (19, N'سارا', N'رجبی', N'234324', 0, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'm.armaghan@gmail.com', N'تهران', N'32424324324', NULL, 9, N'متخصص زنان و زایمان', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (20, N'حانیه', N'محمدزاده', N'234324', 0, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N't.zahedi@gmail.com', N'تهران', N'32424324324', NULL, 9, N'متخصص زنان و زایمان', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (21, N'آرمان', N'شمس', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'ali.r@gmail.com', N'تهران', N'32424324324', NULL, 12, N'متخصص قلب و عروق', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (22, N'رضا', N'فاجری', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'm.armaghan@gmail.com', N'تهران', N'32424324324', NULL, 12, N'متخصص قلب و عروق', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (23, N'مجید', N'رضایی', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N't.zahedi@gmail.com', N'تهران', N'32424324324', NULL, 14, N'متخصص  گوارش', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (24, N'رویا', N'جلالی', N'234324', 0, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'ali.r@gmail.com', N'تهران', N'32424324324', NULL, 14, N'متخصص  گوارش', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (25, N'هرمز', N'سلیمی', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'm.armaghan@gmail.com', N'تهران', N'32424324324', NULL, 15, N'متخصص مغز و اعصاب', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (26, N'رضا', N'بیرجندی', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N't.zahedi@gmail.com', N'تهران', N'32424324324', NULL, 15, N'متخصص مغز و اعصاب', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (27, N'زهرا', N'قاسمی', N'234324', 0, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'ali.r@gmail.com', N'تهران', N'32424324324', NULL, 16, N'متخصص ارتوپد', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (28, N'سپهر', N'اشرفی', N'234324', 1, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N'm.armaghan@gmail.com', N'تهران', N'32424324324', NULL, 16, N'متخصص ارتوپد', N'درمانگاه پاسارگاد')
INSERT [dbo].[Doctors] ([Id], [Name], [Family], [MedicalCode], [Gender], [OfficeAddress], [Email], [City], [OfficePhone], [UserId], [SpecialtyId], [SpecialtyTitle], [OfficeName]) VALUES (29, N'نگار', N'دولت آبادی', N'234324', 0, N'تهران، خیابان بهشتی، خیابان پاکستان، پلاک 34', N't.zahedi@gmail.com', N'تهران', N'32424324324', NULL, 17, N'متخصص تغذیه', N'درمانگاه پاسارگاد')
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (6, 1)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (7, 1)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (10, 1)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (11, 1)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (16, 1)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (19, 1)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (20, 1)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (22, 1)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (28, 1)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (29, 1)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (21, 2)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (22, 2)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (23, 2)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (29, 2)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (24, 3)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (26, 3)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (9, 5)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (12, 5)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (15, 5)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (18, 5)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (27, 5)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (29, 5)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (8, 6)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (17, 6)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (19, 6)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (28, 6)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (6, 7)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (10, 7)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (20, 7)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (15, 9)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (21, 9)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (22, 9)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (26, 9)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (7, 10)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (9, 10)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (12, 10)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (16, 10)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (17, 10)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (18, 10)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (23, 10)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (25, 10)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (29, 10)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (7, 11)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (10, 11)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (11, 11)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (24, 11)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (27, 11)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (6, 13)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (19, 13)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (20, 13)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (29, 13)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (7, 14)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (11, 14)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (13, 14)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (21, 14)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (28, 14)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (29, 14)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (9, 15)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (12, 15)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (14, 15)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (15, 15)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (16, 15)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (21, 15)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (22, 15)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (14, 16)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (18, 16)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (19, 17)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (22, 17)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (23, 17)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (26, 17)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (27, 17)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (29, 17)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (6, 18)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (8, 18)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (9, 18)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (10, 18)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (20, 18)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (25, 18)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (29, 18)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (7, 19)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (11, 19)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (15, 19)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (24, 19)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (6, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (7, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (9, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (10, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (11, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (12, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (14, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (17, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (18, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (19, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (20, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (21, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (29, 21)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (6, 22)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (16, 22)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (26, 22)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (28, 22)
GO
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (13, 23)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (15, 23)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (9, 26)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (10, 26)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (12, 26)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (15, 26)
INSERT [dbo].[DoctorToPresents] ([DoctorId], [PresentId]) VALUES (15, 27)
GO
SET IDENTITY_INSERT [dbo].[Prepresents] ON 

INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (1, N'شنبه', N'9-12')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (2, N'شنبه', N'12-15')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (3, N'شنبه', N'15-18')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (4, N'شنبه', N'18-21')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (5, N'یکشنبه', N'9-12')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (6, N'یکشنبه', N'12-15')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (7, N'یکشنبه', N'15-18')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (8, N'یکشنبه', N'18-21')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (9, N'دوشنبه', N'9-12')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (10, N'دوشنبه', N'12-15')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (11, N'دوشنبه', N'15-18')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (12, N'دوشنبه', N'18-21')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (13, N'سشنبه', N'9-12')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (14, N'سشنبه', N'12-15')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (15, N'سشنبه', N'15-18')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (16, N'سشنبه', N'18-21')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (17, N'چهارشنبه', N'9-12')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (18, N'چهارشنبه', N'12-15')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (19, N'چهارشنبه', N'15-18')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (20, N'چهارشنبه', N'18-21')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (21, N'پنجشنبه', N'9-12')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (22, N'پنجشنبه', N'12-15')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (23, N'پنجشنبه', N'15-18')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (24, N'پنجشنبه', N'18-21')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (25, N'جمعه', N'9-12')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (26, N'جمعه', N'12-15')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (27, N'جمعه', N'15-18')
INSERT [dbo].[Prepresents] ([Id], [DayPresent], [HoursPresent]) VALUES (28, N'جمعه', N'18-21')
SET IDENTITY_INSERT [dbo].[Prepresents] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservs] ON 

INSERT [dbo].[Reservs] ([Id], [DoctorId], [UserId], [VisitDate], [ReservationCode], [RequestDate]) VALUES (19, 15, 1, N'دوشنبه  9-12', N'47ADE5A2', CAST(N'2022-06-05T19:52:10.6792477' AS DateTime2))
INSERT [dbo].[Reservs] ([Id], [DoctorId], [UserId], [VisitDate], [ReservationCode], [RequestDate]) VALUES (22, 11, 1, N'چهارشنبه  15-18', N'FC751C39', CAST(N'2022-06-05T20:36:45.4283090' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Reservs] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialtys] ON 

INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (1, N'پزشک عمومی', N'پزشک عمومی، در شناسایی و درمان بسیاری از بیماری‌ها مهارت دارد و موظف به کوشش در جهت حفظ سلامت مراجعان خود است و درصورتی‌که فرد دچار بیماری شده باشد، می‌بایست با ارائه توصیه‌ها و انجام آزمایش‌های لازم و همچنین، تجویز دارو سعی در بهبود بیمار داشته باشد. پزشک عمومی دانش گسترده‌ای درزمینه مشکلات تنفسی، گوارشی، عصبی، خون‌شناسی و … دارد. او در مرحله ابتدایی، بیماری را تشخیص می‌دهد و از بیمار درمورد علائم فعلی، مدت شروع علائم، تسکین یا تشدید علائم و آزمایش‌های قبلی و درمان‌های انجام‌شده سؤال می‌پرسد. پس‌ از آن، با توجه به مشکل بیمار معاینه‌ای را انجام می‌دهد تا موارد مشکوک را شناسایی و سعی در درمان بیمار کند.')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (2, N'گوش و حلق و بینی', N'متخصصان گوش و حلق و بینی گاهی اوقات به عنوان پزشکان “گوش، بینی و گلو” (ENT) شناخته می شوند.

پزشک مخصص گوش و حلق و بینی ممکن است مشکلات مربوط به سینوس ها، گلو، لوزه ها، گوش ها، دهان، وسر و گردن را درمان کند. برخی از متخصصان گوش و حلق و بینی، آموزش های اضافی را برای تخصص در یک حوزه ی خاص، مانند کودکان یا راینولوژی، که شامل بینی و سینوس ها است، را پشت سر می گذارند.')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (4, N'کودکان', N'متخصص اطفال پزشکی است که در معالجه نوزادان، کودکان، نوجوانان و بزرگسالان تخصص دارد. مراقبت از کودک می تواند قبل از شروع بارداری آغاز شده و در طی بارداری ادامه یابد. کودکان با بزرگ شدن، دچار تغییرات سریع جسمی و روحی می شوند. متخصصان اطفال این واقعیت را درک کرده و وضعیت سلامت کودک را بر اساس محدوده طبیعی سنی شان ارزیابی می کنند.

متخصصان اطفال می توانند به تشخیص بیماری های کودکان کمک کنند. بسته به شرایط، والدین یا سرپرستان کودک ممکن است وی را نزد متخصص اطفال یا فوق تخصص اطفال ببرند.')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (5, N'بیماری های عفونی', N'متخصصان بیماری های عفونی در خوزه ی بیماری ها و شرایط مسری تخصص دارند. این بیماری ها شامل موارد زیر است:

سلولیت,
آنفلوانزا,
عفونت های باکتریایی مانند کلستریدیوم دیفسیل، که موجب اسهال و مشکلات معدی می شود,
عفونت بعد از عمل یا مراقبت بستری,
بیماری سلپنومونی,
عفونت های انگلی
HIV,')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (6, N'روانپزشک', N'روانپزشک، پزشک است که به درمان بیماری های سلامت روان می پردازد. آنها ممکن است از مشاوره، دارو یا بستری شدن در بیمارستان به عنوان بخشی از درمان خود استفاده کنند.

برخی از روانپزشکان در یک حوزه ی خاص مانند سلامت روان بزرگسالان یا طب اعتیاد تخصص بیشتری دارند.')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (8, N'چشم', N'متخصص چشم پزشکی در زمینه ی مراقبت از چشم و بینایی تخصص دارد. آنها به درمان بیماری های چشم می پردازند و می توانند عمل جراحی چشم را انجام دهند.

چشم پزشکان افراد مبتلا به بیماری های پیچیده چشم را درمان می کند و ممکن است افرادی را نیز در  زمینه ی مراقبت های روتین چشم مانند تجویز عینک و انجام معاینه ویزیت کنند.')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (9, N'زنان و زایمان', N'متخصصان زنان و زایمان (OB / GYN) در زمینه ی بیماری های سلامت زنان مراقبت های پیشگیرانه ارائه می دهند و بیماری را مدیریت می کنند. این مراقبت ها شامل موارد زیر هستند:

بهداشت باروری زنان,
پیشگیری و تشخیص سرطان در ارگان های تولید مثل زنانه,
مراقبت از پستان,
بارداری,
زایمان,
ناباروری,
یائسگی.

بسیاری از خانم ها در طول بارداری و زایمان به طور مرتب به متخصصان زنان و زایمان مراجعه می کنند. آنها ممکن است برای معاینه ها و تست های سالانه مانند معاینات پستان و تست های پاپ اسمیر نیز مراجعه کنند.')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (12, N'قلب و عروق', N'متخصصان قلب و عروق در حوزه ی سیستم قلبی عروقی که شامل قلب و عروق خونی است تخصص دارند. آنها بسیاری از بیماری های قلبی-عروقی مانند موارد زیر را درمان می کنند:

فشار خون بالا,
کلسترول بالا,
حمله قلبی و سکته,
مشکلات ریتم قلب,
نارسایی احتقانی قلب.
متخصص قلب و عروق می توانند تست ها و اقدامات بسیاری انجام دهند. با این حال آنها عمل جراحی قلب را انجام نمی دهند.

متخصص قلب و عروق نیز نیاز به آموزش در زمینه ی پزشکی داخلی یا کودکان دارند.')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (14, N'گوارش', N'متخصصان گوارش در زمینه ی دستگاه گوارش تخصص دارند. این سیستم شامل مری، لوزالمعده، معده، کبد، روده کوچک، روده بزرگ و کیسه صفرا می شود.

متخصصان گوارش اقداماتی مانند آندوسکوپی، سیگموئیدوسکوپی و کولونوسکوپی نیز انجام می دهند.

متخصصان گوارش نیز باید آموزش هایی در حوزه ی پزشکی داخلی یا کودکان دریافت کنند.')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (15, N'مغز و اعصاب', N'متخصص مغز و اعصاب بیماری های اعصاب، ستون فقرات و مغز را درمان می کند. افراد ممکن است به دلیل شرایط زیر به متخصص مغز و اعصاب مراجعه کنند:

صرع,
بیماری آلزایمر,
بیماری پارکینسون,
مولتیل اسکلروز,
نوروپاتی,
سکته,
.میگرن')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (16, N'ارتوپد', N'جراح ارتوپدی در حوزه ی بیماری های استخوانی، عضلات، رباط ها، تاندون ها و مفاصل تخصص دارد. آنها ممکن است به درمان موارد زیر بپردازند:

آرتروز,
صدمات ناشی از ورزش,
تومورهای استخوانی,
کمردرد,
شکستگی استخوان ها,
پوکی استخوان,
.صدمات ناشی از کشیدگی های مکرر مانند سندرم تونل کارپال یا آرنج تنیس بازان')
INSERT [dbo].[Specialtys] ([Id], [Title], [Description]) VALUES (17, N'تغذیه', N'دکتر متخصص تغذیه همان‌طور که از نام آن پیداست، در زمینه تغذیه و رژیم غذایی تخصص دارد و با علم بر غذا و تأثیر آن بر سلامت انسان برنامه غذایی سالمی به مراجعه‌کنندگان ارائه می‌دهد. متخصصان تغذیه در چهار حوزه اصلی فعالیت می‌کنند که شامل تغذیه بالینی، مدیریت خدمات غذایی، جامعه و تحقیقات است.

متخصصان تغذیه بالینی در موقعیت‌های بالینی فعالیت دارند و مراقبت از بیماران بستری یا بیماران سرپایی را برعهده دارند. این متخصصان به خانواده بیماران در ارزیابی، طراحی و اجرای استراتژی‌های رژیم غذایی و درمان‌های تغذیه‌ای کمک می‌کنند. اغلب برنامه غذایی برای یک بیماری زمینه‌ای خاص مانند دیابت، فشارخون بالا یا چاقی ارائه می‌شود. این متخصصان می‌توانند در مطب شخصی یا بیمارستان‌ها خدمات ارائه دهند.')
SET IDENTITY_INSERT [dbo].[Specialtys] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Family], [Password], [IsAdmin], [MeliCode], [Age], [Phone], [Email], [City], [JoinDate]) VALUES (1, N'امید', N'مریخی', N'123', 0, N'0021958297', 24, N'09106741855', N'omidi.merikhi1999@gmail.com', N'تهران', CAST(N'2022-05-25T18:30:21.0714874' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Doctors_SpecialtyId]    Script Date: 6/5/2022 8:54:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_Doctors_SpecialtyId] ON [dbo].[Doctors]
(
	[SpecialtyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Doctors_UserId]    Script Date: 6/5/2022 8:54:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_Doctors_UserId] ON [dbo].[Doctors]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DoctorToPresents_PresentId]    Script Date: 6/5/2022 8:54:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_DoctorToPresents_PresentId] ON [dbo].[DoctorToPresents]
(
	[PresentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservs_DoctorId]    Script Date: 6/5/2022 8:54:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservs_DoctorId] ON [dbo].[Reservs]
(
	[DoctorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservs_UserId]    Script Date: 6/5/2022 8:54:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reservs_UserId] ON [dbo].[Reservs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sickness_SpecialityId]    Script Date: 6/5/2022 8:54:37 PM ******/
CREATE NONCLUSTERED INDEX [IX_Sickness_SpecialityId] ON [dbo].[Sickness]
(
	[SpecialityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doctors] ADD  DEFAULT ((0)) FOR [SpecialtyId]
GO
ALTER TABLE [dbo].[Doctors] ADD  DEFAULT (N'') FOR [OfficeName]
GO
ALTER TABLE [dbo].[Reservs] ADD  DEFAULT (N'') FOR [ReservationCode]
GO
ALTER TABLE [dbo].[Reservs] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [RequestDate]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Specialtys_SpecialtyId] FOREIGN KEY([SpecialtyId])
REFERENCES [dbo].[Specialtys] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Specialtys_SpecialtyId]
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Users_UserId]
GO
ALTER TABLE [dbo].[DoctorToPresents]  WITH CHECK ADD  CONSTRAINT [FK_DoctorToPresents_Doctors_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DoctorToPresents] CHECK CONSTRAINT [FK_DoctorToPresents_Doctors_DoctorId]
GO
ALTER TABLE [dbo].[DoctorToPresents]  WITH CHECK ADD  CONSTRAINT [FK_DoctorToPresents_Prepresents_PresentId] FOREIGN KEY([PresentId])
REFERENCES [dbo].[Prepresents] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DoctorToPresents] CHECK CONSTRAINT [FK_DoctorToPresents_Prepresents_PresentId]
GO
ALTER TABLE [dbo].[Reservs]  WITH CHECK ADD  CONSTRAINT [FK_Reservs_Doctors_DoctorId] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservs] CHECK CONSTRAINT [FK_Reservs_Doctors_DoctorId]
GO
ALTER TABLE [dbo].[Reservs]  WITH CHECK ADD  CONSTRAINT [FK_Reservs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservs] CHECK CONSTRAINT [FK_Reservs_Users_UserId]
GO
ALTER TABLE [dbo].[Sickness]  WITH CHECK ADD  CONSTRAINT [FK_Sickness_Specialtys_SpecialityId] FOREIGN KEY([SpecialityId])
REFERENCES [dbo].[Specialtys] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sickness] CHECK CONSTRAINT [FK_Sickness_Specialtys_SpecialityId]
GO
USE [master]
GO
ALTER DATABASE [UniProject] SET  READ_WRITE 
GO
