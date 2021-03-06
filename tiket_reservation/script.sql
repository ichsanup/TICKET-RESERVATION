USE [master]
GO
/****** Object:  Database [tiket_reservation]    Script Date: 11/23/2021 21:40:47 ******/
CREATE DATABASE [tiket_reservation] ON  PRIMARY 
( NAME = N'tiket_reservation', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\tiket_reservation.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tiket_reservation_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\tiket_reservation_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [tiket_reservation] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tiket_reservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tiket_reservation] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [tiket_reservation] SET ANSI_NULLS OFF
GO
ALTER DATABASE [tiket_reservation] SET ANSI_PADDING OFF
GO
ALTER DATABASE [tiket_reservation] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [tiket_reservation] SET ARITHABORT OFF
GO
ALTER DATABASE [tiket_reservation] SET AUTO_CLOSE ON
GO
ALTER DATABASE [tiket_reservation] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [tiket_reservation] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [tiket_reservation] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [tiket_reservation] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [tiket_reservation] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [tiket_reservation] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [tiket_reservation] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [tiket_reservation] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [tiket_reservation] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [tiket_reservation] SET  ENABLE_BROKER
GO
ALTER DATABASE [tiket_reservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [tiket_reservation] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [tiket_reservation] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [tiket_reservation] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [tiket_reservation] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [tiket_reservation] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [tiket_reservation] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [tiket_reservation] SET  READ_WRITE
GO
ALTER DATABASE [tiket_reservation] SET RECOVERY SIMPLE
GO
ALTER DATABASE [tiket_reservation] SET  MULTI_USER
GO
ALTER DATABASE [tiket_reservation] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [tiket_reservation] SET DB_CHAINING OFF
GO
USE [tiket_reservation]
GO
/****** Object:  Table [dbo].[pembeli]    Script Date: 11/23/2021 21:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pembeli](
	[prefix] [varchar](3) NOT NULL,
	[id_pembeli] [int] IDENTITY(5,1) NOT NULL,
	[nm_pembeli] [varchar](40) NOT NULL,
	[email_pembeli] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[hp_pembeli] [varchar](255) NOT NULL,
	[gd_pembeli] [varchar](40) NOT NULL,
 CONSTRAINT [PK_pembeli_id_pembeli] PRIMARY KEY CLUSTERED 
(
	[id_pembeli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [nm_pembeli] ON [dbo].[pembeli] 
(
	[nm_pembeli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pajak_bandara]    Script Date: 11/23/2021 21:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pajak_bandara](
	[id_bandara] [int] IDENTITY(5,1) NOT NULL,
	[nm_bandara] [varchar](225) NOT NULL,
	[pajak] [decimal](10, 0) NOT NULL,
 CONSTRAINT [PK_pajak_bandara_id_bandara] PRIMARY KEY CLUSTERED 
(
	[id_bandara] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[admin]    Script Date: 11/23/2021 21:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[id_admin] [int] IDENTITY(2,1) NOT NULL,
	[nm_admin] [varchar](50) NOT NULL,
	[email_admin] [varchar](50) NOT NULL,
	[pass_admin] [varchar](225) NOT NULL,
 CONSTRAINT [PK_admin_id_admin] PRIMARY KEY CLUSTERED 
(
	[id_admin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tgl_pesan]    Script Date: 11/23/2021 21:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tgl_pesan](
	[prefix] [varchar](3) NOT NULL,
	[id_pembeli] [int] IDENTITY(5,1) NOT NULL,
	[nm_pembeli] [varchar](40) NOT NULL,
	[tgl_order] [varchar](300) NOT NULL,
 CONSTRAINT [PK_tgl_pesan_id_pembeli] PRIMARY KEY CLUSTERED 
(
	[id_pembeli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [nm_pembeli_tgl_pesan] ON [dbo].[tgl_pesan] 
(
	[nm_pembeli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detil_pesan_tiket]    Script Date: 11/23/2021 21:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[detil_pesan_tiket](
	[prefix] [varchar](2) NOT NULL,
	[id_pembeli] [int] IDENTITY(5,1) NOT NULL,
	[nm_pembeli] [varchar](40) NOT NULL,
	[harga_tiket] [decimal](10, 2) NOT NULL,
	[total_transfer] [decimal](10, 2) NOT NULL,
	[pilihan_bank] [varchar](255) NOT NULL,
	[bandara_berangkat] [int] NOT NULL,
	[bandara_tujuan] [int] NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_detil_pesan_tiket_id_pembeli] PRIMARY KEY CLUSTERED 
(
	[id_pembeli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [nm_pembeli_detil_pesan_tiket] ON [dbo].[detil_pesan_tiket] 
(
	[nm_pembeli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pembeli_validasi]    Script Date: 11/23/2021 21:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pembeli_validasi](
	[id_pembeli] [int] IDENTITY(5,1) NOT NULL,
	[nm_pembeli] [varchar](40) NOT NULL,
	[email_pembeli] [varchar](225) NOT NULL,
	[hp_pembeli] [varchar](255) NOT NULL,
	[uang_transfer_validasi] [decimal](10, 2) NULL,
	[pilihan_bank] [varchar](225) NULL,
 CONSTRAINT [PK_pembeli_validasi_id_pembeli] PRIMARY KEY CLUSTERED 
(
	[id_pembeli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [nm_pembeli_pembeli_validasi] ON [dbo].[pembeli_validasi] 
(
	[nm_pembeli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Default [DF__pembeli__prefix__7F60ED59]    Script Date: 11/23/2021 21:40:48 ******/
ALTER TABLE [dbo].[pembeli] ADD  DEFAULT ('CS_') FOR [prefix]
GO
/****** Object:  Default [DF__tgl_pesan__prefi__0425A276]    Script Date: 11/23/2021 21:40:48 ******/
ALTER TABLE [dbo].[tgl_pesan] ADD  DEFAULT ('CS_') FOR [prefix]
GO
/****** Object:  Default [DF__detil_pes__prefi__08EA5793]    Script Date: 11/23/2021 21:40:48 ******/
ALTER TABLE [dbo].[detil_pesan_tiket] ADD  DEFAULT ('TK') FOR [prefix]
GO
/****** Object:  ForeignKey [FK_tgl_pesan_pembeli]    Script Date: 11/23/2021 21:40:48 ******/
ALTER TABLE [dbo].[tgl_pesan]  WITH CHECK ADD  CONSTRAINT [FK_tgl_pesan_pembeli] FOREIGN KEY([nm_pembeli])
REFERENCES [dbo].[pembeli] ([nm_pembeli])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tgl_pesan] CHECK CONSTRAINT [FK_tgl_pesan_pembeli]
GO
/****** Object:  ForeignKey [FK_detil_pesan_tiket_pajak_bandara_tujuan]    Script Date: 11/23/2021 21:40:48 ******/
ALTER TABLE [dbo].[detil_pesan_tiket]  WITH CHECK ADD  CONSTRAINT [FK_detil_pesan_tiket_pajak_bandara_tujuan] FOREIGN KEY([bandara_tujuan])
REFERENCES [dbo].[pajak_bandara] ([id_bandara])
GO
ALTER TABLE [dbo].[detil_pesan_tiket] CHECK CONSTRAINT [FK_detil_pesan_tiket_pajak_bandara_tujuan]
GO
/****** Object:  ForeignKey [FK_detil_pesan_tiket_pajak_bandara1]    Script Date: 11/23/2021 21:40:48 ******/
ALTER TABLE [dbo].[detil_pesan_tiket]  WITH CHECK ADD  CONSTRAINT [FK_detil_pesan_tiket_pajak_bandara1] FOREIGN KEY([bandara_berangkat])
REFERENCES [dbo].[pajak_bandara] ([id_bandara])
GO
ALTER TABLE [dbo].[detil_pesan_tiket] CHECK CONSTRAINT [FK_detil_pesan_tiket_pajak_bandara1]
GO
/****** Object:  ForeignKey [FK_detil_pesan_tiket_tgl_pesan]    Script Date: 11/23/2021 21:40:48 ******/
ALTER TABLE [dbo].[detil_pesan_tiket]  WITH CHECK ADD  CONSTRAINT [FK_detil_pesan_tiket_tgl_pesan] FOREIGN KEY([nm_pembeli])
REFERENCES [dbo].[tgl_pesan] ([nm_pembeli])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[detil_pesan_tiket] CHECK CONSTRAINT [FK_detil_pesan_tiket_tgl_pesan]
GO
/****** Object:  ForeignKey [FK_pembeli_validasi_detil_pesan_tiket]    Script Date: 11/23/2021 21:40:48 ******/
ALTER TABLE [dbo].[pembeli_validasi]  WITH CHECK ADD  CONSTRAINT [FK_pembeli_validasi_detil_pesan_tiket] FOREIGN KEY([nm_pembeli])
REFERENCES [dbo].[detil_pesan_tiket] ([nm_pembeli])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[pembeli_validasi] CHECK CONSTRAINT [FK_pembeli_validasi_detil_pesan_tiket]
GO
