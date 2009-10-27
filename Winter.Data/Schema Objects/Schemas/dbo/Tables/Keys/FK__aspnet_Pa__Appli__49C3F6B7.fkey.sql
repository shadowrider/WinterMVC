ALTER TABLE [dbo].[aspnet_Paths]
    ADD CONSTRAINT [FK__aspnet_Pa__Appli__49C3F6B7] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

