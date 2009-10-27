ALTER TABLE [dbo].[aspnet_Membership]
    ADD CONSTRAINT [FK__aspnet_Me__UserI__46E78A0C] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

