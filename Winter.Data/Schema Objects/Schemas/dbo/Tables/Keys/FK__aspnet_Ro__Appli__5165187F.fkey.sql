ALTER TABLE [dbo].[aspnet_Roles]
    ADD CONSTRAINT [FK__aspnet_Ro__Appli__5165187F] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

