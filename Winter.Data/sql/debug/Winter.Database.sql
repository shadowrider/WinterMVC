/*
Deployment script for Winter
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Winter"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10.MSSQLSERVER\MSSQL\DATA\"

GO
USE [master]

GO
:on error exit
GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL
    AND DATABASEPROPERTYEX(N'$(DatabaseName)','Status') <> N'ONLINE')
BEGIN
    RAISERROR(N'The state of the target database, %s, is not set to ONLINE. To deploy to this database, its state must be set to ONLINE.', 16, 127,N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [PrimaryFileName], FILENAME = '$(DefaultDataPath)$(DatabaseName).mdf', SIZE = 6400 KB, MAXSIZE = UNLIMITED, FILEGROWTH = 1024 KB)
    LOG ON (NAME = [PrimaryLogFileName], FILENAME = '$(DefaultDataPath)$(DatabaseName)_log.ldf', SIZE = 7616 KB, MAXSIZE = 2097152 MB, FILEGROWTH = 10 %) COLLATE SQL_Latin1_General_CP1_CS_AS
GO
USE [$(DatabaseName)]

GO

GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO

GO
PRINT N'Creating aspnet_Membership_BasicAccess...';


GO
CREATE ROLE [aspnet_Membership_BasicAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Membership_FullAccess...';


GO
CREATE ROLE [aspnet_Membership_FullAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Membership_ReportingAccess...';


GO
CREATE ROLE [aspnet_Membership_ReportingAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Personalization_BasicAccess...';


GO
CREATE ROLE [aspnet_Personalization_BasicAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Personalization_FullAccess...';


GO
CREATE ROLE [aspnet_Personalization_FullAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Personalization_ReportingAccess...';


GO
CREATE ROLE [aspnet_Personalization_ReportingAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Profile_BasicAccess...';


GO
CREATE ROLE [aspnet_Profile_BasicAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Profile_FullAccess...';


GO
CREATE ROLE [aspnet_Profile_FullAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Profile_ReportingAccess...';


GO
CREATE ROLE [aspnet_Profile_ReportingAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Roles_BasicAccess...';


GO
CREATE ROLE [aspnet_Roles_BasicAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Roles_FullAccess...';


GO
CREATE ROLE [aspnet_Roles_FullAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_Roles_ReportingAccess...';


GO
CREATE ROLE [aspnet_Roles_ReportingAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating aspnet_WebEvent_FullAccess...';


GO
CREATE ROLE [aspnet_WebEvent_FullAccess]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'aspnet_Membership_BasicAccess', @membername = N'aspnet_Membership_FullAccess';


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'aspnet_Membership_ReportingAccess', @membername = N'aspnet_Membership_FullAccess';


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'aspnet_Personalization_BasicAccess', @membername = N'aspnet_Personalization_FullAccess';


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'aspnet_Personalization_ReportingAccess', @membername = N'aspnet_Personalization_FullAccess';


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'aspnet_Profile_BasicAccess', @membername = N'aspnet_Profile_FullAccess';


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'aspnet_Profile_ReportingAccess', @membername = N'aspnet_Profile_FullAccess';


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'aspnet_Roles_BasicAccess', @membername = N'aspnet_Roles_FullAccess';


GO
PRINT N'Creating <unnamed>...';


GO
EXECUTE sp_addrolemember @rolename = N'aspnet_Roles_ReportingAccess', @membername = N'aspnet_Roles_FullAccess';


GO
PRINT N'Creating aspnet_Membership_BasicAccess...';


GO
CREATE SCHEMA [aspnet_Membership_BasicAccess]
    AUTHORIZATION [aspnet_Membership_BasicAccess];


GO
PRINT N'Creating aspnet_Membership_FullAccess...';


GO
CREATE SCHEMA [aspnet_Membership_FullAccess]
    AUTHORIZATION [aspnet_Membership_FullAccess];


GO
PRINT N'Creating aspnet_Membership_ReportingAccess...';


GO
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
    AUTHORIZATION [aspnet_Membership_ReportingAccess];


GO
PRINT N'Creating aspnet_Personalization_BasicAccess...';


GO
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
    AUTHORIZATION [aspnet_Personalization_BasicAccess];


GO
PRINT N'Creating aspnet_Personalization_FullAccess...';


GO
CREATE SCHEMA [aspnet_Personalization_FullAccess]
    AUTHORIZATION [aspnet_Personalization_FullAccess];


GO
PRINT N'Creating aspnet_Personalization_ReportingAccess...';


GO
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
    AUTHORIZATION [aspnet_Personalization_ReportingAccess];


GO
PRINT N'Creating aspnet_Profile_BasicAccess...';


GO
CREATE SCHEMA [aspnet_Profile_BasicAccess]
    AUTHORIZATION [aspnet_Profile_BasicAccess];


GO
PRINT N'Creating aspnet_Profile_FullAccess...';


GO
CREATE SCHEMA [aspnet_Profile_FullAccess]
    AUTHORIZATION [aspnet_Profile_FullAccess];


GO
PRINT N'Creating aspnet_Profile_ReportingAccess...';


GO
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
    AUTHORIZATION [aspnet_Profile_ReportingAccess];


GO
PRINT N'Creating aspnet_Roles_BasicAccess...';


GO
CREATE SCHEMA [aspnet_Roles_BasicAccess]
    AUTHORIZATION [aspnet_Roles_BasicAccess];


GO
PRINT N'Creating aspnet_Roles_FullAccess...';


GO
CREATE SCHEMA [aspnet_Roles_FullAccess]
    AUTHORIZATION [aspnet_Roles_FullAccess];


GO
PRINT N'Creating aspnet_Roles_ReportingAccess...';


GO
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
    AUTHORIZATION [aspnet_Roles_ReportingAccess];


GO
PRINT N'Creating aspnet_WebEvent_FullAccess...';


GO
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
    AUTHORIZATION [aspnet_WebEvent_FullAccess];


GO
PRINT N'Creating dbo.aspnet_Applications...';


GO
CREATE TABLE [dbo].[aspnet_Applications] (
    [ApplicationName]        NVARCHAR (256)   NOT NULL,
    [LoweredApplicationName] NVARCHAR (256)   NOT NULL,
    [ApplicationId]          UNIQUEIDENTIFIER NOT NULL,
    [Description]            NVARCHAR (256)   NULL,
    PRIMARY KEY NONCLUSTERED ([ApplicationId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF),
    UNIQUE NONCLUSTERED ([ApplicationName] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF),
    UNIQUE NONCLUSTERED ([LoweredApplicationName] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating dbo.aspnet_Membership...';


GO
CREATE TABLE [dbo].[aspnet_Membership] (
    [ApplicationId]                          UNIQUEIDENTIFIER NOT NULL,
    [UserId]                                 UNIQUEIDENTIFIER NOT NULL,
    [Password]                               NVARCHAR (128)   NOT NULL,
    [PasswordFormat]                         INT              NOT NULL,
    [PasswordSalt]                           NVARCHAR (128)   NOT NULL,
    [MobilePIN]                              NVARCHAR (16)    NULL,
    [Email]                                  NVARCHAR (256)   NULL,
    [LoweredEmail]                           NVARCHAR (256)   NULL,
    [PasswordQuestion]                       NVARCHAR (256)   NULL,
    [PasswordAnswer]                         NVARCHAR (128)   NULL,
    [IsApproved]                             BIT              NOT NULL,
    [IsLockedOut]                            BIT              NOT NULL,
    [CreateDate]                             DATETIME         NOT NULL,
    [LastLoginDate]                          DATETIME         NOT NULL,
    [LastPasswordChangedDate]                DATETIME         NOT NULL,
    [LastLockoutDate]                        DATETIME         NOT NULL,
    [FailedPasswordAttemptCount]             INT              NOT NULL,
    [FailedPasswordAttemptWindowStart]       DATETIME         NOT NULL,
    [FailedPasswordAnswerAttemptCount]       INT              NOT NULL,
    [FailedPasswordAnswerAttemptWindowStart] DATETIME         NOT NULL,
    [Comment]                                NTEXT            NULL,
    PRIMARY KEY NONCLUSTERED ([UserId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
EXECUTE sp_tableoption @TableNamePattern = N'[dbo].[aspnet_Membership]', @OptionName = N'text in row', @OptionValue = N'3000';


GO
PRINT N'Creating dbo.aspnet_Paths...';


GO
CREATE TABLE [dbo].[aspnet_Paths] (
    [ApplicationId] UNIQUEIDENTIFIER NOT NULL,
    [PathId]        UNIQUEIDENTIFIER NOT NULL,
    [Path]          NVARCHAR (256)   NOT NULL,
    [LoweredPath]   NVARCHAR (256)   NOT NULL,
    PRIMARY KEY NONCLUSTERED ([PathId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating dbo.aspnet_PersonalizationAllUsers...';


GO
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers] (
    [PathId]          UNIQUEIDENTIFIER NOT NULL,
    [PageSettings]    IMAGE            NOT NULL,
    [LastUpdatedDate] DATETIME         NOT NULL,
    PRIMARY KEY CLUSTERED ([PathId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
EXECUTE sp_tableoption @TableNamePattern = N'[dbo].[aspnet_PersonalizationAllUsers]', @OptionName = N'text in row', @OptionValue = N'6000';


GO
PRINT N'Creating dbo.aspnet_PersonalizationPerUser...';


GO
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser] (
    [Id]              UNIQUEIDENTIFIER NOT NULL,
    [PathId]          UNIQUEIDENTIFIER NULL,
    [UserId]          UNIQUEIDENTIFIER NULL,
    [PageSettings]    IMAGE            NOT NULL,
    [LastUpdatedDate] DATETIME         NOT NULL,
    PRIMARY KEY NONCLUSTERED ([Id] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
EXECUTE sp_tableoption @TableNamePattern = N'[dbo].[aspnet_PersonalizationPerUser]', @OptionName = N'text in row', @OptionValue = N'6000';


GO
PRINT N'Creating dbo.aspnet_Profile...';


GO
CREATE TABLE [dbo].[aspnet_Profile] (
    [UserId]               UNIQUEIDENTIFIER NOT NULL,
    [PropertyNames]        NTEXT            NOT NULL,
    [PropertyValuesString] NTEXT            NOT NULL,
    [PropertyValuesBinary] IMAGE            NOT NULL,
    [LastUpdatedDate]      DATETIME         NOT NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
EXECUTE sp_tableoption @TableNamePattern = N'[dbo].[aspnet_Profile]', @OptionName = N'text in row', @OptionValue = N'6000';


GO
PRINT N'Creating dbo.aspnet_Roles...';


GO
CREATE TABLE [dbo].[aspnet_Roles] (
    [ApplicationId]   UNIQUEIDENTIFIER NOT NULL,
    [RoleId]          UNIQUEIDENTIFIER NOT NULL,
    [RoleName]        NVARCHAR (256)   NOT NULL,
    [LoweredRoleName] NVARCHAR (256)   NOT NULL,
    [Description]     NVARCHAR (256)   NULL,
    PRIMARY KEY NONCLUSTERED ([RoleId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating dbo.aspnet_SchemaVersions...';


GO
CREATE TABLE [dbo].[aspnet_SchemaVersions] (
    [Feature]                 NVARCHAR (128) NOT NULL,
    [CompatibleSchemaVersion] NVARCHAR (128) NOT NULL,
    [IsCurrentVersion]        BIT            NOT NULL,
    PRIMARY KEY CLUSTERED ([Feature] ASC, [CompatibleSchemaVersion] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating dbo.aspnet_Users...';


GO
CREATE TABLE [dbo].[aspnet_Users] (
    [ApplicationId]    UNIQUEIDENTIFIER NOT NULL,
    [UserId]           UNIQUEIDENTIFIER NOT NULL,
    [UserName]         NVARCHAR (256)   NOT NULL,
    [LoweredUserName]  NVARCHAR (256)   NOT NULL,
    [MobileAlias]      NVARCHAR (16)    NULL,
    [IsAnonymous]      BIT              NOT NULL,
    [LastActivityDate] DATETIME         NOT NULL,
    [PersonID]         INT              NULL,
    PRIMARY KEY NONCLUSTERED ([UserId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating dbo.aspnet_UsersInRoles...';


GO
CREATE TABLE [dbo].[aspnet_UsersInRoles] (
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [RoleId] UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating dbo.aspnet_WebEvent_Events...';


GO
CREATE TABLE [dbo].[aspnet_WebEvent_Events] (
    [EventId]                CHAR (32)       NOT NULL,
    [EventTimeUtc]           DATETIME        NOT NULL,
    [EventTime]              DATETIME        NOT NULL,
    [EventType]              NVARCHAR (256)  NOT NULL,
    [EventSequence]          DECIMAL (19)    NOT NULL,
    [EventOccurrence]        DECIMAL (19)    NOT NULL,
    [EventCode]              INT             NOT NULL,
    [EventDetailCode]        INT             NOT NULL,
    [Message]                NVARCHAR (1024) NULL,
    [ApplicationPath]        NVARCHAR (256)  NULL,
    [ApplicationVirtualPath] NVARCHAR (256)  NULL,
    [MachineName]            NVARCHAR (256)  NOT NULL,
    [RequestUrl]             NVARCHAR (1024) NULL,
    [ExceptionType]          NVARCHAR (256)  NULL,
    [Details]                NTEXT           NULL,
    PRIMARY KEY CLUSTERED ([EventId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF)
);


GO
PRINT N'Creating dbo.Departments...';


GO
CREATE TABLE [dbo].[Departments] (
    [ID]        INT            IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (500) NOT NULL,
    [FacultyID] INT            NOT NULL
);


GO
PRINT N'Creating dbo.Faculties...';


GO
CREATE TABLE [dbo].[Faculties] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (500) NOT NULL,
    [UniversityID] INT            NOT NULL
);


GO
PRINT N'Creating dbo.Groups...';


GO
CREATE TABLE [dbo].[Groups] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (500) NOT NULL,
    [DepartmentID] INT            NOT NULL
);


GO
PRINT N'Creating dbo.Persons...';


GO
CREATE TABLE [dbo].[Persons] (
    [ID]         INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]  NVARCHAR (50) NULL,
    [SecondName] NVARCHAR (50) NULL,
    [LastName]   NVARCHAR (50) NULL,
    [Birthdate]  DATETIME      NULL
);


GO
PRINT N'Creating dbo.Students...';


GO
CREATE TABLE [dbo].[Students] (
    [ID]       INT IDENTITY (1, 1) NOT NULL,
    [GroupID]  INT NOT NULL,
    [PersonID] INT NOT NULL
);


GO
PRINT N'Creating dbo.TeacherDepartments...';


GO
CREATE TABLE [dbo].[TeacherDepartments] (
    [TeacherID]    INT NOT NULL,
    [DepartmentID] INT NOT NULL
);


GO
PRINT N'Creating dbo.TeacherFaculties...';


GO
CREATE TABLE [dbo].[TeacherFaculties] (
    [TeacherID] INT NOT NULL,
    [FacultyID] INT NOT NULL
);


GO
PRINT N'Creating dbo.Teachers...';


GO
CREATE TABLE [dbo].[Teachers] (
    [ID]                   INT IDENTITY (1, 1) NOT NULL,
    [TeacherDepartmentsID] INT NULL,
    [TeacherFacultiesID]   INT NULL,
    [PersonID]             INT NULL
);


GO
PRINT N'Creating dbo.Universities...';


GO
CREATE TABLE [dbo].[Universities] (
    [ID]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (500) NOT NULL
);


GO
PRINT N'Creating dbo.aspnet_Applications.aspnet_Applications_Index...';


GO
CREATE CLUSTERED INDEX [aspnet_Applications_Index]
    ON [dbo].[aspnet_Applications]([LoweredApplicationName] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0);


GO
PRINT N'Creating dbo.aspnet_Membership.aspnet_Membership_index...';


GO
CREATE CLUSTERED INDEX [aspnet_Membership_index]
    ON [dbo].[aspnet_Membership]([ApplicationId] ASC, [LoweredEmail] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0);


GO
PRINT N'Creating dbo.aspnet_Paths.aspnet_Paths_index...';


GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index]
    ON [dbo].[aspnet_Paths]([ApplicationId] ASC, [LoweredPath] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0);


GO
PRINT N'Creating dbo.aspnet_PersonalizationPerUser.aspnet_PersonalizationPerUser_index1...';


GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1]
    ON [dbo].[aspnet_PersonalizationPerUser]([PathId] ASC, [UserId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0);


GO
PRINT N'Creating dbo.aspnet_PersonalizationPerUser.aspnet_PersonalizationPerUser_ncindex2...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2]
    ON [dbo].[aspnet_PersonalizationPerUser]([UserId] ASC, [PathId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0);


GO
PRINT N'Creating dbo.aspnet_Roles.aspnet_Roles_index1...';


GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1]
    ON [dbo].[aspnet_Roles]([ApplicationId] ASC, [LoweredRoleName] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0);


GO
PRINT N'Creating dbo.aspnet_Users.aspnet_Users_Index...';


GO
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index]
    ON [dbo].[aspnet_Users]([ApplicationId] ASC, [LoweredUserName] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0);


GO
PRINT N'Creating dbo.aspnet_Users.aspnet_Users_Index2...';


GO
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2]
    ON [dbo].[aspnet_Users]([ApplicationId] ASC, [LastActivityDate] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0);


GO
PRINT N'Creating dbo.aspnet_UsersInRoles.aspnet_UsersInRoles_index...';


GO
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index]
    ON [dbo].[aspnet_UsersInRoles]([RoleId] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF, ONLINE = OFF, MAXDOP = 0);


GO
PRINT N'Creating On column: ApplicationId...';


GO
ALTER TABLE [dbo].[aspnet_Applications]
    ADD DEFAULT (newid()) FOR [ApplicationId];


GO
PRINT N'Creating On column: PasswordFormat...';


GO
ALTER TABLE [dbo].[aspnet_Membership]
    ADD DEFAULT ((0)) FOR [PasswordFormat];


GO
PRINT N'Creating On column: PathId...';


GO
ALTER TABLE [dbo].[aspnet_Paths]
    ADD DEFAULT (newid()) FOR [PathId];


GO
PRINT N'Creating On column: Id...';


GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD DEFAULT (newid()) FOR [Id];


GO
PRINT N'Creating On column: RoleId...';


GO
ALTER TABLE [dbo].[aspnet_Roles]
    ADD DEFAULT (newid()) FOR [RoleId];


GO
PRINT N'Creating On column: UserId...';


GO
ALTER TABLE [dbo].[aspnet_Users]
    ADD DEFAULT (newid()) FOR [UserId];


GO
PRINT N'Creating On column: MobileAlias...';


GO
ALTER TABLE [dbo].[aspnet_Users]
    ADD DEFAULT (NULL) FOR [MobileAlias];


GO
PRINT N'Creating On column: IsAnonymous...';


GO
ALTER TABLE [dbo].[aspnet_Users]
    ADD DEFAULT ((0)) FOR [IsAnonymous];


GO
PRINT N'Creating dbo.PK_Departments...';


GO
ALTER TABLE [dbo].[Departments]
    ADD CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_Faculties...';


GO
ALTER TABLE [dbo].[Faculties]
    ADD CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_Groups...';


GO
ALTER TABLE [dbo].[Groups]
    ADD CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_Persons...';


GO
ALTER TABLE [dbo].[Persons]
    ADD CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_Students...';


GO
ALTER TABLE [dbo].[Students]
    ADD CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_TeacherDepartments...';


GO
ALTER TABLE [dbo].[TeacherDepartments]
    ADD CONSTRAINT [PK_TeacherDepartments] PRIMARY KEY CLUSTERED ([TeacherID] ASC, [DepartmentID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_TeacherFaculties...';


GO
ALTER TABLE [dbo].[TeacherFaculties]
    ADD CONSTRAINT [PK_TeacherFaculties] PRIMARY KEY CLUSTERED ([TeacherID] ASC, [FacultyID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_Teachers...';


GO
ALTER TABLE [dbo].[Teachers]
    ADD CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.PK_Universities...';


GO
ALTER TABLE [dbo].[Universities]
    ADD CONSTRAINT [PK_Universities] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);


GO
PRINT N'Creating dbo.FK__aspnet_Me__Appli__34C8D9D1...';


GO
ALTER TABLE [dbo].[aspnet_Membership]
    ADD CONSTRAINT [FK__aspnet_Me__Appli__34C8D9D1] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Me__Appli__45F365D3...';


GO
ALTER TABLE [dbo].[aspnet_Membership]
    ADD CONSTRAINT [FK__aspnet_Me__Appli__45F365D3] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Me__UserI__35BCFE0A...';


GO
ALTER TABLE [dbo].[aspnet_Membership]
    ADD CONSTRAINT [FK__aspnet_Me__UserI__35BCFE0A] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Me__UserI__46E78A0C...';


GO
ALTER TABLE [dbo].[aspnet_Membership]
    ADD CONSTRAINT [FK__aspnet_Me__UserI__46E78A0C] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Pa__Appli__36B12243...';


GO
ALTER TABLE [dbo].[aspnet_Paths]
    ADD CONSTRAINT [FK__aspnet_Pa__Appli__36B12243] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Pa__Appli__49C3F6B7...';


GO
ALTER TABLE [dbo].[aspnet_Paths]
    ADD CONSTRAINT [FK__aspnet_Pa__Appli__49C3F6B7] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Pe__PathI__37A5467C...';


GO
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__37A5467C] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Pe__PathI__38996AB5...';


GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__38996AB5] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Pe__PathI__4CA06362...';


GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__4CA06362] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Pe__UserI__398D8EEE...';


GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__UserI__398D8EEE] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Pe__UserI__4D94879B...';


GO
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__UserI__4D94879B] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Pr__UserI__3A81B327...';


GO
ALTER TABLE [dbo].[aspnet_Profile]
    ADD CONSTRAINT [FK__aspnet_Pr__UserI__3A81B327] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Ro__Appli__3B75D760...';


GO
ALTER TABLE [dbo].[aspnet_Roles]
    ADD CONSTRAINT [FK__aspnet_Ro__Appli__3B75D760] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Ro__Appli__5165187F...';


GO
ALTER TABLE [dbo].[aspnet_Roles]
    ADD CONSTRAINT [FK__aspnet_Ro__Appli__5165187F] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Us__Appli__3C69FB99...';


GO
ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [FK__aspnet_Us__Appli__3C69FB99] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_aspnet_Users_Persons...';


GO
ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [FK_aspnet_Users_Persons] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Persons] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Us__RoleI__3E52440B...';


GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]
    ADD CONSTRAINT [FK__aspnet_Us__RoleI__3E52440B] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[aspnet_Roles] ([RoleId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Us__RoleI__5535A963...';


GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]
    ADD CONSTRAINT [FK__aspnet_Us__RoleI__5535A963] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[aspnet_Roles] ([RoleId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Us__UserI__3D5E1FD2...';


GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]
    ADD CONSTRAINT [FK__aspnet_Us__UserI__3D5E1FD2] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK__aspnet_Us__UserI__5441852A...';


GO
ALTER TABLE [dbo].[aspnet_UsersInRoles]
    ADD CONSTRAINT [FK__aspnet_Us__UserI__5441852A] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_Departments_Faculties...';


GO
ALTER TABLE [dbo].[Departments]
    ADD CONSTRAINT [FK_Departments_Faculties] FOREIGN KEY ([FacultyID]) REFERENCES [dbo].[Faculties] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_Faculties_Universities...';


GO
ALTER TABLE [dbo].[Faculties]
    ADD CONSTRAINT [FK_Faculties_Universities] FOREIGN KEY ([UniversityID]) REFERENCES [dbo].[Universities] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_Groups_Departments...';


GO
ALTER TABLE [dbo].[Groups]
    ADD CONSTRAINT [FK_Groups_Departments] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Departments] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_Students_Groups...';


GO
ALTER TABLE [dbo].[Students]
    ADD CONSTRAINT [FK_Students_Groups] FOREIGN KEY ([GroupID]) REFERENCES [dbo].[Groups] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_Students_Persons...';


GO
ALTER TABLE [dbo].[Students]
    ADD CONSTRAINT [FK_Students_Persons] FOREIGN KEY ([ID]) REFERENCES [dbo].[Persons] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_TeacherDepartments_Departments...';


GO
ALTER TABLE [dbo].[TeacherDepartments]
    ADD CONSTRAINT [FK_TeacherDepartments_Departments] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Departments] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_TeacherDepartments_Teachers...';


GO
ALTER TABLE [dbo].[TeacherDepartments]
    ADD CONSTRAINT [FK_TeacherDepartments_Teachers] FOREIGN KEY ([TeacherID]) REFERENCES [dbo].[Teachers] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_TeacherFaculties_Faculties...';


GO
ALTER TABLE [dbo].[TeacherFaculties]
    ADD CONSTRAINT [FK_TeacherFaculties_Faculties] FOREIGN KEY ([FacultyID]) REFERENCES [dbo].[Faculties] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_TeacherFaculties_Teachers...';


GO
ALTER TABLE [dbo].[TeacherFaculties]
    ADD CONSTRAINT [FK_TeacherFaculties_Teachers] FOREIGN KEY ([TeacherID]) REFERENCES [dbo].[Teachers] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.FK_Teachers_Persons...';


GO
ALTER TABLE [dbo].[Teachers]
    ADD CONSTRAINT [FK_Teachers_Persons] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Persons] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;


GO
PRINT N'Creating dbo.aspnet_AnyDataInTables...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables]
@TablesToCheck INT
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Applications_CreateApplication...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
@ApplicationName NVARCHAR (256), @ApplicationId UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_CheckSchemaVersion...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
@Feature NVARCHAR (128), @CompatibleSchemaVersion NVARCHAR (128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_ChangePasswordQuestionAndAnswer...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @NewPasswordQuestion NVARCHAR (256), @NewPasswordAnswer NVARCHAR (128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_FindUsersByEmail...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
@ApplicationName NVARCHAR (256), @EmailToMatch NVARCHAR (256), @PageIndex INT, @PageSize INT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_FindUsersByName...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
@ApplicationName NVARCHAR (256), @UserNameToMatch NVARCHAR (256), @PageIndex INT, @PageSize INT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_GetAllUsers...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
@ApplicationName NVARCHAR (256), @PageIndex INT, @PageSize INT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_GetNumberOfUsersOnline...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
@ApplicationName NVARCHAR (256), @MinutesSinceLastInActive INT, @CurrentTimeUtc DATETIME
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_GetPassword...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @MaxInvalidPasswordAttempts INT, @PasswordAttemptWindow INT, @CurrentTimeUtc DATETIME, @PasswordAnswer NVARCHAR (128)=NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_GetPasswordWithFormat...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @UpdateLastLoginActivityDate BIT, @CurrentTimeUtc DATETIME
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_GetUserByEmail...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
@ApplicationName NVARCHAR (256), @Email NVARCHAR (256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_GetUserByName...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @CurrentTimeUtc DATETIME, @UpdateLastActivity BIT=0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_GetUserByUserId...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
@UserId UNIQUEIDENTIFIER, @CurrentTimeUtc DATETIME, @UpdateLastActivity BIT=0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_ResetPassword...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @NewPassword NVARCHAR (128), @MaxInvalidPasswordAttempts INT, @PasswordAttemptWindow INT, @PasswordSalt NVARCHAR (128), @CurrentTimeUtc DATETIME, @PasswordFormat INT=0, @PasswordAnswer NVARCHAR (128)=NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_SetPassword...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @NewPassword NVARCHAR (128), @PasswordSalt NVARCHAR (128), @CurrentTimeUtc DATETIME, @PasswordFormat INT=0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_UnlockUser...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_UpdateUser...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @Email NVARCHAR (256), @Comment NTEXT, @IsApproved BIT, @LastLoginDate DATETIME, @LastActivityDate DATETIME, @UniqueEmail INT, @CurrentTimeUtc DATETIME
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_UpdateUserInfo...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @IsPasswordCorrect BIT, @UpdateLastLoginActivityDate BIT, @MaxInvalidPasswordAttempts INT, @PasswordAttemptWindow INT, @CurrentTimeUtc DATETIME, @LastLoginDate DATETIME, @LastActivityDate DATETIME
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Paths_CreatePath...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath]
@ApplicationId UNIQUEIDENTIFIER, @Path NVARCHAR (256), @PathId UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Personalization_GetApplicationId...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId]
@ApplicationName NVARCHAR (256), @ApplicationId UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationAdministration_DeleteAllState...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState]
@AllUsersScope BIT, @ApplicationName NVARCHAR (256), @Count INT OUTPUT
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationAdministration_FindState...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState]
@AllUsersScope BIT, @ApplicationName NVARCHAR (256), @PageIndex INT, @PageSize INT, @Path NVARCHAR (256)=NULL, @UserName NVARCHAR (256)=NULL, @InactiveSinceDate DATETIME=NULL
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationAdministration_GetCountOfState...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState]
@Count INT OUTPUT, @AllUsersScope BIT, @ApplicationName NVARCHAR (256), @Path NVARCHAR (256)=NULL, @UserName NVARCHAR (256)=NULL, @InactiveSinceDate DATETIME=NULL
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationAdministration_ResetSharedState...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState]
@Count INT OUTPUT, @ApplicationName NVARCHAR (256), @Path NVARCHAR (256)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationAdministration_ResetUserState...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState]
@Count INT OUTPUT, @ApplicationName NVARCHAR (256), @InactiveSinceDate DATETIME=NULL, @UserName NVARCHAR (256)=NULL, @Path NVARCHAR (256)=NULL
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationAllUsers_GetPageSettings...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]
@ApplicationName NVARCHAR (256), @Path NVARCHAR (256)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationAllUsers_ResetPageSettings...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]
@ApplicationName NVARCHAR (256), @Path NVARCHAR (256)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationAllUsers_SetPageSettings...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]
@ApplicationName NVARCHAR (256), @Path NVARCHAR (256), @PageSettings IMAGE, @CurrentTimeUtc DATETIME
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationPerUser_GetPageSettings...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @Path NVARCHAR (256), @CurrentTimeUtc DATETIME
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationPerUser_ResetPageSettings...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @Path NVARCHAR (256), @CurrentTimeUtc DATETIME
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Profile_DeleteInactiveProfiles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
@ApplicationName NVARCHAR (256), @ProfileAuthOptions INT, @InactiveSinceDate DATETIME
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Profile_GetNumberOfInactiveProfiles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
@ApplicationName NVARCHAR (256), @ProfileAuthOptions INT, @InactiveSinceDate DATETIME
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Profile_GetProfiles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
@ApplicationName NVARCHAR (256), @ProfileAuthOptions INT, @PageIndex INT, @PageSize INT, @UserNameToMatch NVARCHAR (256)=NULL, @InactiveSinceDate DATETIME=NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Profile_GetProperties...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @CurrentTimeUtc DATETIME
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_RegisterSchemaVersion...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
@Feature NVARCHAR (128), @CompatibleSchemaVersion NVARCHAR (128), @IsCurrentVersion BIT, @RemoveIncompatibleSchema BIT
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Roles_CreateRole...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole]
@ApplicationName NVARCHAR (256), @RoleName NVARCHAR (256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Roles_DeleteRole...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
@ApplicationName NVARCHAR (256), @RoleName NVARCHAR (256), @DeleteOnlyIfRoleIsEmpty BIT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Roles_GetAllRoles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles]
@ApplicationName NVARCHAR (256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Roles_RoleExists...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists]
@ApplicationName NVARCHAR (256), @RoleName NVARCHAR (256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Setup_RemoveAllRoleMembers...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
@name [sysname]
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Setup_RestorePermissions...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
@name [sysname]
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_UnRegisterSchemaVersion...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
@Feature NVARCHAR (128), @CompatibleSchemaVersion NVARCHAR (128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Users_CreateUser...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser]
@ApplicationId UNIQUEIDENTIFIER, @UserName NVARCHAR (256), @IsUserAnonymous BIT, @LastActivityDate DATETIME, @UserId UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Users_DeleteUser...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @TablesToDeleteFrom INT, @NumTablesDeletedFrom INT OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_UsersInRoles_AddUsersToRoles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
@ApplicationName NVARCHAR (256), @UserNames NVARCHAR (4000), @RoleNames NVARCHAR (4000), @CurrentTimeUtc DATETIME
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_UsersInRoles_FindUsersInRole...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
@ApplicationName NVARCHAR (256), @RoleName NVARCHAR (256), @UserNameToMatch NVARCHAR (256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_UsersInRoles_GetRolesForUser...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_UsersInRoles_GetUsersInRoles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
@ApplicationName NVARCHAR (256), @RoleName NVARCHAR (256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_UsersInRoles_IsUserInRole...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @RoleName NVARCHAR (256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_UsersInRoles_RemoveUsersFromRoles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
@ApplicationName NVARCHAR (256), @UserNames NVARCHAR (4000), @RoleNames NVARCHAR (4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_WebEvent_LogEvent...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
@EventId CHAR (32), @EventTimeUtc DATETIME, @EventTime DATETIME, @EventType NVARCHAR (256), @EventSequence DECIMAL (19), @EventOccurrence DECIMAL (19), @EventCode INT, @EventDetailCode INT, @Message NVARCHAR (1024), @ApplicationPath NVARCHAR (256), @ApplicationVirtualPath NVARCHAR (256), @MachineName NVARCHAR (256), @RequestUrl NVARCHAR (1024), @ExceptionType NVARCHAR (256), @Details NTEXT
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Membership_CreateUser...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @Password NVARCHAR (128), @PasswordSalt NVARCHAR (128), @Email NVARCHAR (256), @PasswordQuestion NVARCHAR (256), @PasswordAnswer NVARCHAR (128), @IsApproved BIT, @CurrentTimeUtc DATETIME, @CreateDate DATETIME=NULL, @UniqueEmail INT=0, @PasswordFormat INT=0, @UserId UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_PersonalizationPerUser_SetPageSettings...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings]
@ApplicationName NVARCHAR (256), @UserName NVARCHAR (256), @Path NVARCHAR (256), @PageSettings IMAGE, @CurrentTimeUtc DATETIME
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Profile_DeleteProfiles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
@ApplicationName NVARCHAR (256), @UserNames NVARCHAR (4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.aspnet_Profile_SetProperties...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties]
@ApplicationName NVARCHAR (256), @PropertyNames NTEXT, @PropertyValuesString NTEXT, @PropertyValuesBinary IMAGE, @UserName NVARCHAR (256), @IsUserAnonymous BIT, @CurrentTimeUtc DATETIME
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.vw_aspnet_Applications...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE VIEW [dbo].[vw_aspnet_Applications]
AS
SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications];


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.vw_aspnet_MembershipUsers...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
AS
SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId];


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.vw_aspnet_Profiles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE VIEW [dbo].[vw_aspnet_Profiles]
AS
SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile];


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.vw_aspnet_Roles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE VIEW [dbo].[vw_aspnet_Roles]
AS
SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles];


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.vw_aspnet_Users...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE VIEW [dbo].[vw_aspnet_Users]
AS
SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users];


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.vw_aspnet_UsersInRoles...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
AS
SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles];


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.vw_aspnet_WebPartState_Paths...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
AS
SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths];


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.vw_aspnet_WebPartState_Shared...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
AS
SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers];


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO
PRINT N'Creating dbo.vw_aspnet_WebPartState_User...';


GO
SET ANSI_NULLS ON;

SET QUOTED_IDENTIFIER OFF;


GO
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
AS
SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser];


GO
SET ANSI_NULLS, QUOTED_IDENTIFIER ON;


GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/*
This script was created by Visual Studio on 10/16/2009 at 10:39 PM.
Run this script on k0stya-pc.WinterEmpty.dbo to make it the same as k0stya-pc.Winter.dbo.
This script performs its actions in the following order:
1. Disable foreign-key constraints.
2. Perform DELETE commands. 
3. Perform UPDATE commands.
4. Perform INSERT commands.
5. Re-enable foreign-key constraints.
Please back up your target database before running this script.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Pointer used for text / image updates. This might not be needed, but is declared here just in case*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [dbo].[TeacherFaculties] DROP CONSTRAINT [FK_TeacherFaculties_Faculties]
ALTER TABLE [dbo].[TeacherFaculties] DROP CONSTRAINT [FK_TeacherFaculties_Teachers]
ALTER TABLE [dbo].[Students] DROP CONSTRAINT [FK_Students_Groups]
ALTER TABLE [dbo].[Students] DROP CONSTRAINT [FK_Students_Persons]
ALTER TABLE [dbo].[TeacherDepartments] DROP CONSTRAINT [FK_TeacherDepartments_Departments]
ALTER TABLE [dbo].[TeacherDepartments] DROP CONSTRAINT [FK_TeacherDepartments_Teachers]
ALTER TABLE [dbo].[Teachers] DROP CONSTRAINT [FK_Teachers_Persons]
ALTER TABLE [dbo].[aspnet_Profile] DROP CONSTRAINT [FK__aspnet_Pr__UserI__3A81B327]
ALTER TABLE [dbo].[aspnet_Paths] DROP CONSTRAINT [FK__aspnet_Pa__Appli__36B12243]
ALTER TABLE [dbo].[aspnet_Paths] DROP CONSTRAINT [FK__aspnet_Pa__Appli__49C3F6B7]
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__PathI__38996AB5]
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__PathI__4CA06362]
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__UserI__398D8EEE]
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] DROP CONSTRAINT [FK__aspnet_Pe__UserI__4D94879B]
ALTER TABLE [dbo].[Faculties] DROP CONSTRAINT [FK_Faculties_Universities]
ALTER TABLE [dbo].[Groups] DROP CONSTRAINT [FK_Groups_Departments]
ALTER TABLE [dbo].[Departments] DROP CONSTRAINT [FK_Departments_Faculties]
ALTER TABLE [dbo].[aspnet_Roles] DROP CONSTRAINT [FK__aspnet_Ro__Appli__3B75D760]
ALTER TABLE [dbo].[aspnet_Roles] DROP CONSTRAINT [FK__aspnet_Ro__Appli__5165187F]
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__RoleI__3E52440B]
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__RoleI__5535A963]
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__UserI__3D5E1FD2]
ALTER TABLE [dbo].[aspnet_UsersInRoles] DROP CONSTRAINT [FK__aspnet_Us__UserI__5441852A]
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__Appli__34C8D9D1]
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__Appli__45F365D3]
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__UserI__35BCFE0A]
ALTER TABLE [dbo].[aspnet_Membership] DROP CONSTRAINT [FK__aspnet_Me__UserI__46E78A0C]
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [FK__aspnet_Us__Appli__3C69FB99]
ALTER TABLE [dbo].[aspnet_Users] DROP CONSTRAINT [FK_aspnet_Users_Persons]
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] DROP CONSTRAINT [FK__aspnet_Pe__PathI__37A5467C]
INSERT INTO [dbo].[aspnet_Applications] ([ApplicationId], [ApplicationName], [LoweredApplicationName], [Description]) VALUES (N'b623aad3-cdda-4a16-9581-53dc26c13b03', N'Winter.BackEnd', N'winter.backend', NULL)
INSERT INTO [dbo].[aspnet_Users] ([ApplicationId], [LoweredUserName], [UserId], [UserName], [MobileAlias], [IsAnonymous], [LastActivityDate], [PersonID]) VALUES (N'b623aad3-cdda-4a16-9581-53dc26c13b03', N'admin', N'2107f78b-005a-44bc-9ca6-53af799d6cb4', N'Admin', NULL, 0, '20091001 21:05:21.343', NULL)
INSERT INTO [dbo].[aspnet_Membership] ([UserId], [ApplicationId], [Password], [PasswordFormat], [PasswordSalt], [MobilePIN], [Email], [LoweredEmail], [PasswordQuestion], [PasswordAnswer], [IsApproved], [IsLockedOut], [CreateDate], [LastLoginDate], [LastPasswordChangedDate], [LastLockoutDate], [FailedPasswordAttemptCount], [FailedPasswordAttemptWindowStart], [FailedPasswordAnswerAttemptCount], [FailedPasswordAnswerAttemptWindowStart], [Comment]) VALUES (N'2107f78b-005a-44bc-9ca6-53af799d6cb4', N'b623aad3-cdda-4a16-9581-53dc26c13b03', N'uYre7fvnYgxLrIfgR92gTFHFE0k=', 1, N'SdhP4z0CBD1uDVS+kaYnsA==', NULL, N'hkostya@gmail.com', N'hkostya@gmail.com', NULL, NULL, 1, 0, '20091001 21:05:21.000', '20091001 21:05:21.343', '20091001 21:05:21.000', '17540101 00:00:00.000', 0, '17540101 00:00:00.000', 0, '17540101 00:00:00.000', NULL)
INSERT INTO [dbo].[aspnet_UsersInRoles] ([UserId], [RoleId]) VALUES (N'2107f78b-005a-44bc-9ca6-53af799d6cb4', N'4e92cadd-355e-472f-97a2-c2132b942be8')
INSERT INTO [dbo].[aspnet_Roles] ([ApplicationId], [LoweredRoleName], [RoleId], [RoleName], [Description]) VALUES (N'b623aad3-cdda-4a16-9581-53dc26c13b03', N'admin', N'4e92cadd-355e-472f-97a2-c2132b942be8', N'Admin', NULL)
INSERT INTO [dbo].[aspnet_Roles] ([ApplicationId], [LoweredRoleName], [RoleId], [RoleName], [Description]) VALUES (N'b623aad3-cdda-4a16-9581-53dc26c13b03', N'classmonitor', N'34ab794b-fcec-49bc-9144-001a8430a8a4', N'ClassMonitor', NULL)
INSERT INTO [dbo].[aspnet_Roles] ([ApplicationId], [LoweredRoleName], [RoleId], [RoleName], [Description]) VALUES (N'b623aad3-cdda-4a16-9581-53dc26c13b03', N'student', N'8c8e85bf-b885-4b1d-8a99-057a480851c9', N'Student', NULL)
INSERT INTO [dbo].[aspnet_Roles] ([ApplicationId], [LoweredRoleName], [RoleId], [RoleName], [Description]) VALUES (N'b623aad3-cdda-4a16-9581-53dc26c13b03', N'teacher', N'822565fe-deb3-413e-879f-4144569835d8', N'Teacher', NULL)
SET IDENTITY_INSERT [dbo].[Departments] ON
INSERT INTO [dbo].[Departments] ([ID], [Name], [FacultyID]) VALUES (1, N'TK', 2)
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Groups] ON
INSERT INTO [dbo].[Groups] ([ID], [Name], [DepartmentID]) VALUES (1, N'IK-61', 1)
INSERT INTO [dbo].[Groups] ([ID], [Name], [DepartmentID]) VALUES (2, N'Ik-62', 1)
INSERT INTO [dbo].[Groups] ([ID], [Name], [DepartmentID]) VALUES (3, N'Ik-63', 1)
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[Universities] ON
INSERT INTO [dbo].[Universities] ([ID], [Name]) VALUES (1, N'KPI')
SET IDENTITY_INSERT [dbo].[Universities] OFF
SET IDENTITY_INSERT [dbo].[Faculties] ON
INSERT INTO [dbo].[Faculties] ([ID], [Name], [UniversityID]) VALUES (2, N'FIOT', 1)
SET IDENTITY_INSERT [dbo].[Faculties] OFF
INSERT INTO [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', N'1', 1)
INSERT INTO [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', N'1', 1)
INSERT INTO [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', N'1', 1)
INSERT INTO [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', N'1', 1)
INSERT INTO [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', N'1', 1)
INSERT INTO [dbo].[aspnet_SchemaVersions] ([Feature], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', N'1', 1)
ALTER TABLE [dbo].[TeacherFaculties] ADD CONSTRAINT [FK_TeacherFaculties_Faculties] FOREIGN KEY ([FacultyID]) REFERENCES [dbo].[Faculties] ([ID])
ALTER TABLE [dbo].[TeacherFaculties] ADD CONSTRAINT [FK_TeacherFaculties_Teachers] FOREIGN KEY ([TeacherID]) REFERENCES [dbo].[Teachers] ([ID])
ALTER TABLE [dbo].[Students] ADD CONSTRAINT [FK_Students_Groups] FOREIGN KEY ([GroupID]) REFERENCES [dbo].[Groups] ([ID])
ALTER TABLE [dbo].[Students] ADD CONSTRAINT [FK_Students_Persons] FOREIGN KEY ([ID]) REFERENCES [dbo].[Persons] ([ID])
ALTER TABLE [dbo].[TeacherDepartments] ADD CONSTRAINT [FK_TeacherDepartments_Departments] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Departments] ([ID])
ALTER TABLE [dbo].[TeacherDepartments] ADD CONSTRAINT [FK_TeacherDepartments_Teachers] FOREIGN KEY ([TeacherID]) REFERENCES [dbo].[Teachers] ([ID])
ALTER TABLE [dbo].[Teachers] ADD CONSTRAINT [FK_Teachers_Persons] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Persons] ([ID])
ALTER TABLE [dbo].[aspnet_Profile] ADD CONSTRAINT [FK__aspnet_Pr__UserI__3A81B327] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
ALTER TABLE [dbo].[aspnet_Paths] ADD CONSTRAINT [FK__aspnet_Pa__Appli__36B12243] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
ALTER TABLE [dbo].[aspnet_Paths] ADD CONSTRAINT [FK__aspnet_Pa__Appli__49C3F6B7] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD CONSTRAINT [FK__aspnet_Pe__PathI__38996AB5] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId])
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD CONSTRAINT [FK__aspnet_Pe__PathI__4CA06362] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId])
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD CONSTRAINT [FK__aspnet_Pe__UserI__398D8EEE] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD CONSTRAINT [FK__aspnet_Pe__UserI__4D94879B] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
ALTER TABLE [dbo].[Faculties] ADD CONSTRAINT [FK_Faculties_Universities] FOREIGN KEY ([UniversityID]) REFERENCES [dbo].[Universities] ([ID])
ALTER TABLE [dbo].[Groups] ADD CONSTRAINT [FK_Groups_Departments] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Departments] ([ID])
ALTER TABLE [dbo].[Departments] ADD CONSTRAINT [FK_Departments_Faculties] FOREIGN KEY ([FacultyID]) REFERENCES [dbo].[Faculties] ([ID])
ALTER TABLE [dbo].[aspnet_Roles] ADD CONSTRAINT [FK__aspnet_Ro__Appli__3B75D760] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
ALTER TABLE [dbo].[aspnet_Roles] ADD CONSTRAINT [FK__aspnet_Ro__Appli__5165187F] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
ALTER TABLE [dbo].[aspnet_UsersInRoles] ADD CONSTRAINT [FK__aspnet_Us__RoleI__3E52440B] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[aspnet_Roles] ([RoleId])
ALTER TABLE [dbo].[aspnet_UsersInRoles] ADD CONSTRAINT [FK__aspnet_Us__RoleI__5535A963] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[aspnet_Roles] ([RoleId])
ALTER TABLE [dbo].[aspnet_UsersInRoles] ADD CONSTRAINT [FK__aspnet_Us__UserI__3D5E1FD2] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
ALTER TABLE [dbo].[aspnet_UsersInRoles] ADD CONSTRAINT [FK__aspnet_Us__UserI__5441852A] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
ALTER TABLE [dbo].[aspnet_Membership] ADD CONSTRAINT [FK__aspnet_Me__Appli__34C8D9D1] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
ALTER TABLE [dbo].[aspnet_Membership] ADD CONSTRAINT [FK__aspnet_Me__Appli__45F365D3] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
ALTER TABLE [dbo].[aspnet_Membership] ADD CONSTRAINT [FK__aspnet_Me__UserI__35BCFE0A] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
ALTER TABLE [dbo].[aspnet_Membership] ADD CONSTRAINT [FK__aspnet_Me__UserI__46E78A0C] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
ALTER TABLE [dbo].[aspnet_Users] ADD CONSTRAINT [FK__aspnet_Us__Appli__3C69FB99] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
ALTER TABLE [dbo].[aspnet_Users] ADD CONSTRAINT [FK_aspnet_Users_Persons] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Persons] ([ID])
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers] ADD CONSTRAINT [FK__aspnet_Pe__PathI__37A5467C] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId])
COMMIT TRANSACTION

GO

GO

GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        DECLARE @VarDecimalSupported AS BIT;
        SELECT @VarDecimalSupported = 0;
        IF ((ServerProperty(N'EngineEdition') = 3)
            AND (((@@microsoftversion / power(2, 24) = 9)
                  AND (@@microsoftversion & 0xffff >= 3024))
                 OR ((@@microsoftversion / power(2, 24) = 10)
                     AND (@@microsoftversion & 0xffff >= 1600))))
            SELECT @VarDecimalSupported = 1;
        IF (@VarDecimalSupported > 0)
            BEGIN
                EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
            END
    END


GO
