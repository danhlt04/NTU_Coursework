USE master

IF DB_ID('AttendanceDB') IS NOT NULL
	DROP DATABASE AttendanceDB

CREATE DATABASE AttendanceDB;

USE AttendanceDB;

-- Students
CREATE TABLE [Students] (
    [Id]          int           NOT NULL IDENTITY(1,1),
    [UID]         nvarchar(max) NOT NULL,
    [StudentCode] nvarchar(max) NOT NULL DEFAULT '',
    [FullName]    nvarchar(max) NOT NULL,
    [ClassName]   nvarchar(max) NOT NULL DEFAULT '',
    CONSTRAINT [PK_Students] PRIMARY KEY ([Id])
);

-- Attendances
CREATE TABLE [Attendances] (
    [Id]          int       NOT NULL IDENTITY(1,1),
    [StudentId]   int       NOT NULL,
    [CheckInTime] datetime2 NOT NULL,
    CONSTRAINT [PK_Attendances] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Attendances_Students_StudentId]
        FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id])
        ON DELETE CASCADE
);

-- Migration
CREATE TABLE [__EFMigrationsHistory] (
    [MigrationId]    nvarchar(150) NOT NULL,
    [ProductVersion] nvarchar(32)  NOT NULL,
    CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES ('20260602_InitialCreate', '10.0.300');

-- Thêm dữ liệu
INSERT INTO Students (UID, StudentCode, FullName, ClassName) VALUES
('0eadc421', '66130419', 'Le Tan Danh',     '66.CNTT1'),
('cab7f6da', '66131937', 'Tran Duy Luong',  '66.CNTT1'),
('fa7fffda', '66133256', 'Nguyen Dinh Tai', '66.CNTT1'),
('935ee8fa', '66122437', 'Pham Thi D',      '66.CNTT2'),
('c3b7f0fa', '66134259', 'Hoang Van E',     '66.CNTT3'),
('53ccdafa', '66138964', 'Nguyen Thi F',    '66.KHMT')

/*

-- Kiểm tra
SELECT * FROM Students;
GO

-- Xem đang có những database nào
SELECT name FROM sys.databases;

-- Kiểm tra bảng trong AttendanceDB
USE AttendanceDB;
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;

*/