ALTER TABLE [dbo].[aspnet_Profile]
    ADD CONSTRAINT [FK__aspnet_Pr__UserI__3A81B327] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

