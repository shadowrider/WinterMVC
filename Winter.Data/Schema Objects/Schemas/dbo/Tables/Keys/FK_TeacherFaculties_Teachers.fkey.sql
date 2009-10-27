ALTER TABLE [dbo].[TeacherFaculties]
    ADD CONSTRAINT [FK_TeacherFaculties_Teachers] FOREIGN KEY ([TeacherID]) REFERENCES [dbo].[Teachers] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

