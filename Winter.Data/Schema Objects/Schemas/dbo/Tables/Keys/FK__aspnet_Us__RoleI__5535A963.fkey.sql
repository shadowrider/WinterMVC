ALTER TABLE [dbo].[aspnet_UsersInRoles]
    ADD CONSTRAINT [FK__aspnet_Us__RoleI__5535A963] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[aspnet_Roles] ([RoleId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

