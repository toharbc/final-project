
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/27/2022 17:44:47
-- Generated from EDMX file: C:\Project\HandToHandApp\final-project\Server\DAL\DB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HandToHandd];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__BlockedUs__UserI__25869641]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BlockedUsers] DROP CONSTRAINT [FK__BlockedUs__UserI__25869641];
GO
IF OBJECT_ID(N'[dbo].[FK__DaysForVo__Types__300424B4]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DaysForVolunteer] DROP CONSTRAINT [FK__DaysForVo__Types__300424B4];
GO
IF OBJECT_ID(N'[dbo].[FK__DaysForVo__Volun__30F848ED]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[DaysForVolunteer] DROP CONSTRAINT [FK__DaysForVo__Volun__30F848ED];
GO
IF OBJECT_ID(N'[dbo].[FK__HelpReque__Reque__37A5467C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HelpRequests] DROP CONSTRAINT [FK__HelpReque__Reque__37A5467C];
GO
IF OBJECT_ID(N'[dbo].[FK__HelpReque__TypeO__38996AB5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[HelpRequests] DROP CONSTRAINT [FK__HelpReque__TypeO__38996AB5];
GO
IF OBJECT_ID(N'[dbo].[FK__RequestsF__HelpR__3B75D760]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestsForVolunteer] DROP CONSTRAINT [FK__RequestsF__HelpR__3B75D760];
GO
IF OBJECT_ID(N'[dbo].[FK__RequestsF__Volun__3C69FB99]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RequestsForVolunteer] DROP CONSTRAINT [FK__RequestsF__Volun__3C69FB99];
GO
IF OBJECT_ID(N'[dbo].[FK__Users__AreaId__49C3F6B7]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK__Users__AreaId__49C3F6B7];
GO
IF OBJECT_ID(N'[dbo].[FK__Volunteer__TypeO__31EC6D26]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VolunteeringForUsers] DROP CONSTRAINT [FK__Volunteer__TypeO__31EC6D26];
GO
IF OBJECT_ID(N'[dbo].[FK__Volunteer__UserI__32E0915F]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VolunteeringForUsers] DROP CONSTRAINT [FK__Volunteer__UserI__32E0915F];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Areas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Areas];
GO
IF OBJECT_ID(N'[dbo].[BlockedUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BlockedUsers];
GO
IF OBJECT_ID(N'[dbo].[DaysForVolunteer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DaysForVolunteer];
GO
IF OBJECT_ID(N'[dbo].[HelpRequests]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HelpRequests];
GO
IF OBJECT_ID(N'[dbo].[Manager]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Manager];
GO
IF OBJECT_ID(N'[dbo].[RequestsForVolunteer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RequestsForVolunteer];
GO
IF OBJECT_ID(N'[dbo].[TypeOfVolunteering]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TypeOfVolunteering];
GO
IF OBJECT_ID(N'[dbo].[TypesOfTimes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TypesOfTimes];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[VolunteeringForUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VolunteeringForUsers];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'BlockedUsers'
CREATE TABLE [dbo].[BlockedUsers] (
    [UserId] bigint  NOT NULL
);
GO

-- Creating table 'HelpRequests'
CREATE TABLE [dbo].[HelpRequests] (
    [HelpRequestId] bigint IDENTITY(1,1) NOT NULL,
    [RequesterId] bigint  NOT NULL,
    [TypeOfVolunteerId] bigint  NOT NULL,
    [StartDate] datetime  NOT NULL,
    [EndDate] datetime  NOT NULL,
    [StartHour] time  NOT NULL,
    [EndHour] time  NOT NULL
);
GO

-- Creating table 'Managers'
CREATE TABLE [dbo].[Managers] (
    [ManagerId] bigint IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(50)  NOT NULL,
    [Password] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'RequestsForVolunteers'
CREATE TABLE [dbo].[RequestsForVolunteers] (
    [RequestForVolunteerId] bigint IDENTITY(1,1) NOT NULL,
    [HelpRequestId] bigint  NOT NULL,
    [VolunteerId] bigint  NOT NULL,
    [Status] nvarchar(50)  NOT NULL,
    [Done] bit  NOT NULL,
    [Review] bigint  NOT NULL,
    [Comment] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'TypeOfVolunteerings'
CREATE TABLE [dbo].[TypeOfVolunteerings] (
    [TypeOfVolunteeringId] bigint IDENTITY(1,1) NOT NULL,
    [TypeOfVolunteeringName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'TypesOfTimes'
CREATE TABLE [dbo].[TypesOfTimes] (
    [TypesOfTimesId] bigint IDENTITY(1,1) NOT NULL,
    [TypesOfTimesName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] bigint IDENTITY(1,1) NOT NULL,
    [UserFirstName] nvarchar(50)  NOT NULL,
    [UserLastName] nvarchar(50)  NOT NULL,
    [UserPhone] bigint  NOT NULL,
    [UserPassword] nvarchar(50)  NOT NULL,
    [UserMail] nvarchar(50)  NOT NULL,
    [UserAdress] nvarchar(50)  NOT NULL,
    [AreaId] int  NULL
);
GO

-- Creating table 'VolunteeringForUsers'
CREATE TABLE [dbo].[VolunteeringForUsers] (
    [VolunteeringForUsersId] bigint IDENTITY(1,1) NOT NULL,
    [TypeOfVolunteerId] bigint  NOT NULL,
    [UserId] bigint  NOT NULL
);
GO

-- Creating table 'DaysForVolunteers'
CREATE TABLE [dbo].[DaysForVolunteers] (
    [DaysForVolunteerId] bigint IDENTITY(1,1) NOT NULL,
    [DayofWeek] bigint  NOT NULL,
    [HourStart] time  NOT NULL,
    [HourEnd] time  NOT NULL,
    [RangeHours] bigint  NOT NULL,
    [TypesOfTimesId] bigint  NOT NULL,
    [VolunteerId] bigint  NOT NULL
);
GO

-- Creating table 'Areas'
CREATE TABLE [dbo].[Areas] (
    [AreaId] int IDENTITY(1,1) NOT NULL,
    [AreaName] nvarchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UserId] in table 'BlockedUsers'
ALTER TABLE [dbo].[BlockedUsers]
ADD CONSTRAINT [PK_BlockedUsers]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [HelpRequestId] in table 'HelpRequests'
ALTER TABLE [dbo].[HelpRequests]
ADD CONSTRAINT [PK_HelpRequests]
    PRIMARY KEY CLUSTERED ([HelpRequestId] ASC);
GO

-- Creating primary key on [ManagerId] in table 'Managers'
ALTER TABLE [dbo].[Managers]
ADD CONSTRAINT [PK_Managers]
    PRIMARY KEY CLUSTERED ([ManagerId] ASC);
GO

-- Creating primary key on [RequestForVolunteerId] in table 'RequestsForVolunteers'
ALTER TABLE [dbo].[RequestsForVolunteers]
ADD CONSTRAINT [PK_RequestsForVolunteers]
    PRIMARY KEY CLUSTERED ([RequestForVolunteerId] ASC);
GO

-- Creating primary key on [TypeOfVolunteeringId] in table 'TypeOfVolunteerings'
ALTER TABLE [dbo].[TypeOfVolunteerings]
ADD CONSTRAINT [PK_TypeOfVolunteerings]
    PRIMARY KEY CLUSTERED ([TypeOfVolunteeringId] ASC);
GO

-- Creating primary key on [TypesOfTimesId] in table 'TypesOfTimes'
ALTER TABLE [dbo].[TypesOfTimes]
ADD CONSTRAINT [PK_TypesOfTimes]
    PRIMARY KEY CLUSTERED ([TypesOfTimesId] ASC);
GO

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [VolunteeringForUsersId] in table 'VolunteeringForUsers'
ALTER TABLE [dbo].[VolunteeringForUsers]
ADD CONSTRAINT [PK_VolunteeringForUsers]
    PRIMARY KEY CLUSTERED ([VolunteeringForUsersId] ASC);
GO

-- Creating primary key on [DaysForVolunteerId] in table 'DaysForVolunteers'
ALTER TABLE [dbo].[DaysForVolunteers]
ADD CONSTRAINT [PK_DaysForVolunteers]
    PRIMARY KEY CLUSTERED ([DaysForVolunteerId] ASC);
GO

-- Creating primary key on [AreaId] in table 'Areas'
ALTER TABLE [dbo].[Areas]
ADD CONSTRAINT [PK_Areas]
    PRIMARY KEY CLUSTERED ([AreaId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'BlockedUsers'
ALTER TABLE [dbo].[BlockedUsers]
ADD CONSTRAINT [FK__BlockedUs__UserI__25869641]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [RequesterId] in table 'HelpRequests'
ALTER TABLE [dbo].[HelpRequests]
ADD CONSTRAINT [FK__HelpReque__Reque__37A5467C]
    FOREIGN KEY ([RequesterId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__HelpReque__Reque__37A5467C'
CREATE INDEX [IX_FK__HelpReque__Reque__37A5467C]
ON [dbo].[HelpRequests]
    ([RequesterId]);
GO

-- Creating foreign key on [TypeOfVolunteerId] in table 'HelpRequests'
ALTER TABLE [dbo].[HelpRequests]
ADD CONSTRAINT [FK__HelpReque__TypeO__38996AB5]
    FOREIGN KEY ([TypeOfVolunteerId])
    REFERENCES [dbo].[TypeOfVolunteerings]
        ([TypeOfVolunteeringId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__HelpReque__TypeO__38996AB5'
CREATE INDEX [IX_FK__HelpReque__TypeO__38996AB5]
ON [dbo].[HelpRequests]
    ([TypeOfVolunteerId]);
GO

-- Creating foreign key on [HelpRequestId] in table 'RequestsForVolunteers'
ALTER TABLE [dbo].[RequestsForVolunteers]
ADD CONSTRAINT [FK__RequestsF__HelpR__3B75D760]
    FOREIGN KEY ([HelpRequestId])
    REFERENCES [dbo].[HelpRequests]
        ([HelpRequestId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__RequestsF__HelpR__3B75D760'
CREATE INDEX [IX_FK__RequestsF__HelpR__3B75D760]
ON [dbo].[RequestsForVolunteers]
    ([HelpRequestId]);
GO

-- Creating foreign key on [VolunteerId] in table 'RequestsForVolunteers'
ALTER TABLE [dbo].[RequestsForVolunteers]
ADD CONSTRAINT [FK__RequestsF__Volun__3C69FB99]
    FOREIGN KEY ([VolunteerId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__RequestsF__Volun__3C69FB99'
CREATE INDEX [IX_FK__RequestsF__Volun__3C69FB99]
ON [dbo].[RequestsForVolunteers]
    ([VolunteerId]);
GO

-- Creating foreign key on [TypeOfVolunteerId] in table 'VolunteeringForUsers'
ALTER TABLE [dbo].[VolunteeringForUsers]
ADD CONSTRAINT [FK__Volunteer__TypeO__31EC6D26]
    FOREIGN KEY ([TypeOfVolunteerId])
    REFERENCES [dbo].[TypeOfVolunteerings]
        ([TypeOfVolunteeringId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Volunteer__TypeO__31EC6D26'
CREATE INDEX [IX_FK__Volunteer__TypeO__31EC6D26]
ON [dbo].[VolunteeringForUsers]
    ([TypeOfVolunteerId]);
GO

-- Creating foreign key on [UserId] in table 'VolunteeringForUsers'
ALTER TABLE [dbo].[VolunteeringForUsers]
ADD CONSTRAINT [FK__Volunteer__UserI__32E0915F]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Volunteer__UserI__32E0915F'
CREATE INDEX [IX_FK__Volunteer__UserI__32E0915F]
ON [dbo].[VolunteeringForUsers]
    ([UserId]);
GO

-- Creating foreign key on [TypesOfTimesId] in table 'DaysForVolunteers'
ALTER TABLE [dbo].[DaysForVolunteers]
ADD CONSTRAINT [FK__DaysForVo__Types__300424B4]
    FOREIGN KEY ([TypesOfTimesId])
    REFERENCES [dbo].[TypesOfTimes]
        ([TypesOfTimesId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__DaysForVo__Types__300424B4'
CREATE INDEX [IX_FK__DaysForVo__Types__300424B4]
ON [dbo].[DaysForVolunteers]
    ([TypesOfTimesId]);
GO

-- Creating foreign key on [VolunteerId] in table 'DaysForVolunteers'
ALTER TABLE [dbo].[DaysForVolunteers]
ADD CONSTRAINT [FK__DaysForVo__Volun__30F848ED]
    FOREIGN KEY ([VolunteerId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__DaysForVo__Volun__30F848ED'
CREATE INDEX [IX_FK__DaysForVo__Volun__30F848ED]
ON [dbo].[DaysForVolunteers]
    ([VolunteerId]);
GO

-- Creating foreign key on [AreaId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK__Users__AreaId__49C3F6B7]
    FOREIGN KEY ([AreaId])
    REFERENCES [dbo].[Areas]
        ([AreaId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Users__AreaId__49C3F6B7'
CREATE INDEX [IX_FK__Users__AreaId__49C3F6B7]
ON [dbo].[Users]
    ([AreaId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------