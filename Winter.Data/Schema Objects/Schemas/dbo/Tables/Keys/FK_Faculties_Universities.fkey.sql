ALTER TABLE [dbo].[Faculties]
    ADD CONSTRAINT [FK_Faculties_Universities] FOREIGN KEY ([UniversityID]) REFERENCES [dbo].[Universities] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

