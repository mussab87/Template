USE [master]
GO
/****** Object:  Database [SessionDB]    Script Date: 10/3/2021 7:07:06 PM ******/
CREATE DATABASE [SessionDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SessionDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SessionDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SessionDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SessionDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SessionDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SessionDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SessionDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SessionDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SessionDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SessionDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SessionDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SessionDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SessionDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SessionDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SessionDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SessionDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SessionDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SessionDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SessionDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SessionDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SessionDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SessionDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SessionDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SessionDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SessionDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SessionDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SessionDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SessionDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SessionDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SessionDB] SET  MULTI_USER 
GO
ALTER DATABASE [SessionDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SessionDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SessionDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SessionDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SessionDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SessionDB] SET QUERY_STORE = OFF
GO
USE [SessionDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/3/2021 7:07:06 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Tbl]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Tbl](
	[Course_Id] [int] IDENTITY(1,1) NOT NULL,
	[Course_Name_Arabic] [nvarchar](50) NULL,
	[Course_Name_English] [nvarchar](50) NULL,
 CONSTRAINT [PK_Course_Tbl] PRIMARY KEY CLUSTERED 
(
	[Course_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher_Course_Tbl]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_Course_Tbl](
	[Teacher_Trs_Id] [int] IDENTITY(1,1) NOT NULL,
	[Teacher_Id] [int] NOT NULL,
	[Course_Id] [int] NOT NULL,
 CONSTRAINT [PK_Teacher_Course_Tbl] PRIMARY KEY CLUSTERED 
(
	[Teacher_Trs_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher_Tbl]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher_Tbl](
	[Teacher_Id] [int] IDENTITY(1,1) NOT NULL,
	[Teacher_Name] [nvarchar](250) NULL,
	[Teacher_National_Id] [nvarchar](50) NULL,
	[Teacher_Phone_Number] [nvarchar](15) NULL,
	[Created_By] [nvarchar](50) NULL,
	[CREATE_STAMP] [datetime] NULL,
	[UPDATE_STAMP] [datetime] NULL,
 CONSTRAINT [PK_Teacher_Tbl] PRIMARY KEY CLUSTERED 
(
	[Teacher_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainee_Course_Table]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainee_Course_Table](
	[Trainee_Trs_Id] [int] IDENTITY(1,1) NOT NULL,
	[Trainee_Id] [int] NOT NULL,
	[Course_Id] [int] NOT NULL,
 CONSTRAINT [PK_Trainee_Course_Table] PRIMARY KEY CLUSTERED 
(
	[Trainee_Trs_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainee_Tbl]    Script Date: 10/3/2021 7:07:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainee_Tbl](
	[Trainee_Id] [int] IDENTITY(1,1) NOT NULL,
	[Trainee_Name] [nvarchar](250) NULL,
	[Trainee_National_Id] [nvarchar](50) NULL,
	[Phone_Number] [nvarchar](15) NULL,
	[Created_By] [nvarchar](50) NULL,
	[CREATE_STAMP] [datetime] NULL,
	[UPDATE_STAMP] [datetime] NULL,
 CONSTRAINT [PK_Trainee_Tbl] PRIMARY KEY CLUSTERED 
(
	[Trainee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210809185052_InitialMigration', N'5.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210901193530_Extend', N'5.0.8')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'04e52732-49f9-476f-8642-195c908bdc92', N'Admin', N'ADMIN', N'95942f93-6bd8-4d91-85dc-05b9e15eab98')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'305962d4-4f28-443a-850a-a3686d90e5f5', N'User', N'USER', N'9b4fb400-bcc2-4f8f-af81-aa16e386b5c0')
GO
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (7, N'3ec322df-ec5e-4e65-b68c-799200fcba3c', N'Create Role', N'Create Role')
INSERT [dbo].[AspNetUserClaims] ([Id], [UserId], [ClaimType], [ClaimValue]) VALUES (8, N'3ec322df-ec5e-4e65-b68c-799200fcba3c', N'Edit Role', N'Edit Role')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3ec322df-ec5e-4e65-b68c-799200fcba3c', N'04e52732-49f9-476f-8642-195c908bdc92')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd39fd195-6bfa-4370-acf4-e407b2fe6f8b', N'04e52732-49f9-476f-8642-195c908bdc92')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3ec322df-ec5e-4e65-b68c-799200fcba3c', N'305962d4-4f28-443a-850a-a3686d90e5f5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd39fd195-6bfa-4370-acf4-e407b2fe6f8b', N'305962d4-4f28-443a-850a-a3686d90e5f5')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e535de90-e9ad-4ebc-bae2-122c2450f1f1', N'305962d4-4f28-443a-850a-a3686d90e5f5')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3ec322df-ec5e-4e65-b68c-799200fcba3c', N'admin@gmail.com', N'ADMIN@GMAIL.COM', NULL, NULL, 0, N'AQAAAAEAACcQAAAAEC9hr9Nu1bwaiBB5KG6ergA4kE2uWaq9oGcv3hNMcYZ06esezJmm4aA9kszWaPHDHw==', N'67ZLXIGXY7KR4I7I7V7RRMBJEPKTSD2I', N'e23ecc18-d90e-4002-bce0-f2313918fc0b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd39fd195-6bfa-4370-acf4-e407b2fe6f8b', N'test', N'TEST', N'test', N'TEST', 0, N'AQAAAAEAACcQAAAAEPIdDccnRemrGib99C7R3reqHUwPoQ1p/rOJD3XxYctxiTgE3jjjjfff31zCeh33wQ==', N'FCR3B7OQGQN7MS6I5LJGP6BV6TTEPAAK', N'bdcacc75-d7f7-4ba9-b489-e1ecdb3c28bf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e535de90-e9ad-4ebc-bae2-122c2450f1f1', N'mussab', N'MUSSAB', N'mussab', N'MUSSAB', 0, N'AQAAAAEAACcQAAAAEEg451AwJ5uBxLcJW0eDQj1LnIx4zHZAfvwRc2F5kZoTxEo4txXMcak3VLM+6b+JwQ==', N'QXSITPFMAYLX5MHPIN32EMJFSZJXIP3J', N'8a7f3010-4d0e-41b3-b31d-c11b9e0c975d', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Course_Tbl] ON 

INSERT [dbo].[Course_Tbl] ([Course_Id], [Course_Name_Arabic], [Course_Name_English]) VALUES (1, N'تقنية معلومات', N'IT')
INSERT [dbo].[Course_Tbl] ([Course_Id], [Course_Name_Arabic], [Course_Name_English]) VALUES (2, N'الادارة والتدريب', N'PM')
SET IDENTITY_INSERT [dbo].[Course_Tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Teacher_Tbl] ON 

INSERT [dbo].[Teacher_Tbl] ([Teacher_Id], [Teacher_Name], [Teacher_National_Id], [Teacher_Phone_Number], [Created_By], [CREATE_STAMP], [UPDATE_STAMP]) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Teacher_Tbl] OFF
GO
SET IDENTITY_INSERT [dbo].[Trainee_Course_Table] ON 

INSERT [dbo].[Trainee_Course_Table] ([Trainee_Trs_Id], [Trainee_Id], [Course_Id]) VALUES (7, 8, 1)
SET IDENTITY_INSERT [dbo].[Trainee_Course_Table] OFF
GO
SET IDENTITY_INSERT [dbo].[Trainee_Tbl] ON 

INSERT [dbo].[Trainee_Tbl] ([Trainee_Id], [Trainee_Name], [Trainee_National_Id], [Phone_Number], [Created_By], [CREATE_STAMP], [UPDATE_STAMP]) VALUES (8, N'test Update', N'444441111', N'555550000', N'admin@gmail.com', CAST(N'2021-08-17T22:44:03.000' AS DateTime), CAST(N'2021-08-17T22:46:17.897' AS DateTime))
SET IDENTITY_INSERT [dbo].[Trainee_Tbl] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10/3/2021 7:07:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/3/2021 7:07:06 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10/3/2021 7:07:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10/3/2021 7:07:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10/3/2021 7:07:06 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 10/3/2021 7:07:06 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/3/2021 7:07:06 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Teacher_Course_Tbl]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Course_Tbl_Course_Tbl] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course_Tbl] ([Course_Id])
GO
ALTER TABLE [dbo].[Teacher_Course_Tbl] CHECK CONSTRAINT [FK_Teacher_Course_Tbl_Course_Tbl]
GO
ALTER TABLE [dbo].[Teacher_Course_Tbl]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Course_Tbl_Teacher_Tbl] FOREIGN KEY([Teacher_Id])
REFERENCES [dbo].[Teacher_Tbl] ([Teacher_Id])
GO
ALTER TABLE [dbo].[Teacher_Course_Tbl] CHECK CONSTRAINT [FK_Teacher_Course_Tbl_Teacher_Tbl]
GO
ALTER TABLE [dbo].[Trainee_Course_Table]  WITH CHECK ADD  CONSTRAINT [FK_Trainee_Course_Table_Course_Tbl] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course_Tbl] ([Course_Id])
GO
ALTER TABLE [dbo].[Trainee_Course_Table] CHECK CONSTRAINT [FK_Trainee_Course_Table_Course_Tbl]
GO
ALTER TABLE [dbo].[Trainee_Course_Table]  WITH CHECK ADD  CONSTRAINT [FK_Trainee_Course_Table_Trainee_Tbl] FOREIGN KEY([Trainee_Id])
REFERENCES [dbo].[Trainee_Tbl] ([Trainee_Id])
GO
ALTER TABLE [dbo].[Trainee_Course_Table] CHECK CONSTRAINT [FK_Trainee_Course_Table_Trainee_Tbl]
GO
USE [master]
GO
ALTER DATABASE [SessionDB] SET  READ_WRITE 
GO
