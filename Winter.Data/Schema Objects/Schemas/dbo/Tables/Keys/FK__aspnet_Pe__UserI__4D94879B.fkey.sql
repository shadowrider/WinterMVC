ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__UserI__4D94879B] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

