ALTER TABLE [dbo].[aspnet_UsersInRoles]
    ADD CONSTRAINT [FK__aspnet_Us__UserI__3D5E1FD2] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

