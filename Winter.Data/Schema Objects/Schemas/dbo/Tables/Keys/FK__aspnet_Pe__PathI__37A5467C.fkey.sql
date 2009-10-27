ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__37A5467C] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

