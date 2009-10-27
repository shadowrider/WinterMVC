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
