ALTER TABLE [dbo].[aspnet_Roles]
    ADD CONSTRAINT [FK__aspnet_Ro__Appli__3B75D760] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

