
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/16/2020 18:19:29
-- Generated from EDMX file: E:\自寫\KensBlog_DBSchema_Service\Domain\KensBlogModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [KensBlog];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ManagerManager]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ManagerSet] DROP CONSTRAINT [FK_ManagerManager];
GO
IF OBJECT_ID(N'[dbo].[FK_ManagerManager1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ManagerSet] DROP CONSTRAINT [FK_ManagerManager1];
GO
IF OBJECT_ID(N'[dbo].[FK_ManagerOPTLog]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OPTLogSet] DROP CONSTRAINT [FK_ManagerOPTLog];
GO
IF OBJECT_ID(N'[dbo].[FK_FeatureFeature]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FeatureSet] DROP CONSTRAINT [FK_FeatureFeature];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleManager_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RoleManager] DROP CONSTRAINT [FK_RoleManager_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleManager_Manager]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RoleManager] DROP CONSTRAINT [FK_RoleManager_Manager];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleFeature_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RoleFeature] DROP CONSTRAINT [FK_RoleFeature_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_RoleFeature_Feature]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RoleFeature] DROP CONSTRAINT [FK_RoleFeature_Feature];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ManagerSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ManagerSet];
GO
IF OBJECT_ID(N'[dbo].[OPTLogSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OPTLogSet];
GO
IF OBJECT_ID(N'[dbo].[FeatureSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FeatureSet];
GO
IF OBJECT_ID(N'[dbo].[RoleSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RoleSet];
GO
IF OBJECT_ID(N'[dbo].[RoleManager]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RoleManager];
GO
IF OBJECT_ID(N'[dbo].[RoleFeature]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RoleFeature];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ManagerSet'
CREATE TABLE [dbo].[ManagerSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Account] nvarchar(50)  NOT NULL,
    [Password] nvarchar(20)  NOT NULL,
    [Email] nvarchar(50)  NOT NULL,
    [CreateDeteTime] datetime  NOT NULL,
    [UpdateDeteTime] datetime  NOT NULL,
    [GAToken] nvarchar(512)  NOT NULL,
    [IsDeltel] tinyint  NOT NULL,
    [CreateManager_Id] int  NULL,
    [UpdateManager_Id] int  NULL
);
GO

-- Creating table 'OPTLogSet'
CREATE TABLE [dbo].[OPTLogSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Path] nvarchar(max)  NOT NULL,
    [CreateDateTime] nvarchar(max)  NOT NULL,
    [Mathod] nvarchar(max)  NOT NULL,
    [RequestBody] nvarchar(max)  NOT NULL,
    [Manager_Id] int  NOT NULL
);
GO

-- Creating table 'FeatureSet'
CREATE TABLE [dbo].[FeatureSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Code] nvarchar(max)  NOT NULL,
    [Seq] nvarchar(max)  NOT NULL,
    [CssClass] nvarchar(max)  NOT NULL,
    [FeatureType] nvarchar(max)  NOT NULL,
    [Uri] nvarchar(max)  NOT NULL,
    [ChidrenFeature_Id] int  NULL
);
GO

-- Creating table 'RoleSet'
CREATE TABLE [dbo].[RoleSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Seq] nvarchar(max)  NOT NULL,
    [Status] nvarchar(max)  NOT NULL,
    [Hide] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'RoleManager'
CREATE TABLE [dbo].[RoleManager] (
    [Role_Id] int  NOT NULL,
    [Manager_Id] int  NOT NULL
);
GO

-- Creating table 'RoleFeature'
CREATE TABLE [dbo].[RoleFeature] (
    [Role_Id] int  NOT NULL,
    [Feature_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'ManagerSet'
ALTER TABLE [dbo].[ManagerSet]
ADD CONSTRAINT [PK_ManagerSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'OPTLogSet'
ALTER TABLE [dbo].[OPTLogSet]
ADD CONSTRAINT [PK_OPTLogSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FeatureSet'
ALTER TABLE [dbo].[FeatureSet]
ADD CONSTRAINT [PK_FeatureSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RoleSet'
ALTER TABLE [dbo].[RoleSet]
ADD CONSTRAINT [PK_RoleSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Role_Id], [Manager_Id] in table 'RoleManager'
ALTER TABLE [dbo].[RoleManager]
ADD CONSTRAINT [PK_RoleManager]
    PRIMARY KEY CLUSTERED ([Role_Id], [Manager_Id] ASC);
GO

-- Creating primary key on [Role_Id], [Feature_Id] in table 'RoleFeature'
ALTER TABLE [dbo].[RoleFeature]
ADD CONSTRAINT [PK_RoleFeature]
    PRIMARY KEY CLUSTERED ([Role_Id], [Feature_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CreateManager_Id] in table 'ManagerSet'
ALTER TABLE [dbo].[ManagerSet]
ADD CONSTRAINT [FK_ManagerManager]
    FOREIGN KEY ([CreateManager_Id])
    REFERENCES [dbo].[ManagerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ManagerManager'
CREATE INDEX [IX_FK_ManagerManager]
ON [dbo].[ManagerSet]
    ([CreateManager_Id]);
GO

-- Creating foreign key on [UpdateManager_Id] in table 'ManagerSet'
ALTER TABLE [dbo].[ManagerSet]
ADD CONSTRAINT [FK_ManagerManager1]
    FOREIGN KEY ([UpdateManager_Id])
    REFERENCES [dbo].[ManagerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ManagerManager1'
CREATE INDEX [IX_FK_ManagerManager1]
ON [dbo].[ManagerSet]
    ([UpdateManager_Id]);
GO

-- Creating foreign key on [Manager_Id] in table 'OPTLogSet'
ALTER TABLE [dbo].[OPTLogSet]
ADD CONSTRAINT [FK_ManagerOPTLog]
    FOREIGN KEY ([Manager_Id])
    REFERENCES [dbo].[ManagerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ManagerOPTLog'
CREATE INDEX [IX_FK_ManagerOPTLog]
ON [dbo].[OPTLogSet]
    ([Manager_Id]);
GO

-- Creating foreign key on [ChidrenFeature_Id] in table 'FeatureSet'
ALTER TABLE [dbo].[FeatureSet]
ADD CONSTRAINT [FK_FeatureFeature]
    FOREIGN KEY ([ChidrenFeature_Id])
    REFERENCES [dbo].[FeatureSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FeatureFeature'
CREATE INDEX [IX_FK_FeatureFeature]
ON [dbo].[FeatureSet]
    ([ChidrenFeature_Id]);
GO

-- Creating foreign key on [Role_Id] in table 'RoleManager'
ALTER TABLE [dbo].[RoleManager]
ADD CONSTRAINT [FK_RoleManager_Role]
    FOREIGN KEY ([Role_Id])
    REFERENCES [dbo].[RoleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Manager_Id] in table 'RoleManager'
ALTER TABLE [dbo].[RoleManager]
ADD CONSTRAINT [FK_RoleManager_Manager]
    FOREIGN KEY ([Manager_Id])
    REFERENCES [dbo].[ManagerSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleManager_Manager'
CREATE INDEX [IX_FK_RoleManager_Manager]
ON [dbo].[RoleManager]
    ([Manager_Id]);
GO

-- Creating foreign key on [Role_Id] in table 'RoleFeature'
ALTER TABLE [dbo].[RoleFeature]
ADD CONSTRAINT [FK_RoleFeature_Role]
    FOREIGN KEY ([Role_Id])
    REFERENCES [dbo].[RoleSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Feature_Id] in table 'RoleFeature'
ALTER TABLE [dbo].[RoleFeature]
ADD CONSTRAINT [FK_RoleFeature_Feature]
    FOREIGN KEY ([Feature_Id])
    REFERENCES [dbo].[FeatureSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoleFeature_Feature'
CREATE INDEX [IX_FK_RoleFeature_Feature]
ON [dbo].[RoleFeature]
    ([Feature_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------