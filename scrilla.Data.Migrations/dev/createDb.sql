USE [master]
GO

/****** Object:  Database [scrilla] ******/
CREATE DATABASE [scrilla] ON  PRIMARY 
( NAME = N'scrilla', FILENAME = N'D:\DATA\scrilla.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'scrilla_log', FILENAME = N'D:\DATA\scrilla_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [scrilla] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [scrilla].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [scrilla] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [scrilla] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [scrilla] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [scrilla] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [scrilla] SET ARITHABORT OFF 
GO

ALTER DATABASE [scrilla] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [scrilla] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [scrilla] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [scrilla] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [scrilla] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [scrilla] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [scrilla] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [scrilla] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [scrilla] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [scrilla] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [scrilla] SET  DISABLE_BROKER 
GO

ALTER DATABASE [scrilla] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [scrilla] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [scrilla] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [scrilla] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [scrilla] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [scrilla] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [scrilla] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [scrilla] SET  READ_WRITE 
GO

ALTER DATABASE [scrilla] SET RECOVERY FULL 
GO

ALTER DATABASE [scrilla] SET  MULTI_USER 
GO

ALTER DATABASE [scrilla] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [scrilla] SET DB_CHAINING OFF 
GO




-- create login
GO
USE [master]

IF NOT EXISTS 
    (SELECT name  
     FROM master.sys.server_principals
     WHERE name = 'IIS AppPool\scrilla.Web')
BEGIN
    CREATE LOGIN [IIS AppPool\scrilla.Web] FROM WINDOWS WITH DEFAULT_DATABASE=[scrilla]
END

-- create user
GO
USE [scrilla]

IF NOT EXISTS
    (SELECT name
     FROM sys.database_principals
     WHERE name = 'IIS AppPool\scrilla.Web')
BEGIN
    CREATE USER [IIS AppPool\scrilla.Web] FOR LOGIN [IIS AppPool\scrilla.Web] 
	EXEC sp_addrolemember N'db_owner', N'IIS AppPool\scrilla.Web'
END
