ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__38996AB5] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

