ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [FK_aspnet_Users_Persons] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Persons] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

