ALTER TABLE [dbo].[TeacherDepartments]
    ADD CONSTRAINT [FK_TeacherDepartments_Teachers] FOREIGN KEY ([TeacherID]) REFERENCES [dbo].[Teachers] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

