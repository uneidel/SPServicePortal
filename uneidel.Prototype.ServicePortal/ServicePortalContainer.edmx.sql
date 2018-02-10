
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/29/2014 10:27:27
-- Generated from EDMX file: C:\Users\uneidel\Source\Workspaces\POC.ServicePortal\PoC.ServicePortal\uneidel.Prototype.ServicePortal\ServicePortalContainer.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ServicePortal];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Loggings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Loggings];
GO
IF OBJECT_ID(N'[dbo].[OrderEntities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrderEntities];
GO
IF OBJECT_ID(N'[dbo].[SimpleAccessModels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SimpleAccessModels];
GO
IF OBJECT_ID(N'[dbo].[QuotaEntities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[QuotaEntities];
GO
IF OBJECT_ID(N'[dbo].[SCEntities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SCEntities];
GO
IF OBJECT_ID(N'[dbo].[SampleDatas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SampleDatas];
GO
IF OBJECT_ID(N'[dbo].[BehoerdenEntities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BehoerdenEntities];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Loggings'
CREATE TABLE [dbo].[Loggings] (
    [Id] uniqueidentifier  NOT NULL,
    [DateTime] datetime  NOT NULL,
    [Action] nvarchar(4000)  NOT NULL,
    [User] nvarchar(4000)  NOT NULL
);
GO

-- Creating table 'OrderEntities'
CREATE TABLE [dbo].[OrderEntities] (
    [Id] uniqueidentifier  NOT NULL,
    [Type] nvarchar(4000)  NOT NULL,
    [Status] nvarchar(4000)  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [User] nvarchar(4000)  NOT NULL,
    [Approval] nvarchar(max)  NOT NULL,
    [Comment] nvarchar(max)  NULL
);
GO

-- Creating table 'SimpleAccessModels'
CREATE TABLE [dbo].[SimpleAccessModels] (
    [Id] uniqueidentifier  NOT NULL,
    [UserName] nvarchar(4000)  NOT NULL,
    [Password] nvarchar(4000)  NOT NULL,
    [Role] nvarchar(4000)  NOT NULL
);
GO

-- Creating table 'QuotaEntities'
CREATE TABLE [dbo].[QuotaEntities] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Quota] nvarchar(max)  NOT NULL,
    [Order] uniqueidentifier  NULL
);
GO

-- Creating table 'SCEntities'
CREATE TABLE [dbo].[SCEntities] (
    [Id] uniqueidentifier  NOT NULL,
    [Name] nvarchar(4000)  NOT NULL,
    [Description] nvarchar(4000)  NOT NULL,
    [Template] nvarchar(4000)  NOT NULL,
    [Quota] nvarchar(4000)  NOT NULL,
    [Order] uniqueidentifier  NOT NULL,
    [BehoerdenId] int  NOT NULL,
    [SCOwner] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'SampleDatas'
CREATE TABLE [dbo].[SampleDatas] (
    [Id] uniqueidentifier  NOT NULL,
    [DateTime] nvarchar(max)  NOT NULL,
    [Amount] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BehoerdenEntities'
CREATE TABLE [dbo].[BehoerdenEntities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BehoerdenName] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Loggings'
ALTER TABLE [dbo].[Loggings]
ADD CONSTRAINT [PK_Loggings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OrderEntities'
ALTER TABLE [dbo].[OrderEntities]
ADD CONSTRAINT [PK_OrderEntities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SimpleAccessModels'
ALTER TABLE [dbo].[SimpleAccessModels]
ADD CONSTRAINT [PK_SimpleAccessModels]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'QuotaEntities'
ALTER TABLE [dbo].[QuotaEntities]
ADD CONSTRAINT [PK_QuotaEntities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SCEntities'
ALTER TABLE [dbo].[SCEntities]
ADD CONSTRAINT [PK_SCEntities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SampleDatas'
ALTER TABLE [dbo].[SampleDatas]
ADD CONSTRAINT [PK_SampleDatas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BehoerdenEntities'
ALTER TABLE [dbo].[BehoerdenEntities]
ADD CONSTRAINT [PK_BehoerdenEntities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------