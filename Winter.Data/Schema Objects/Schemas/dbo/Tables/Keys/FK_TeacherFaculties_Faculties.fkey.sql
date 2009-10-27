ALTER TABLE [dbo].[TeacherFaculties]
    ADD CONSTRAINT [FK_TeacherFaculties_Faculties] FOREIGN KEY ([FacultyID]) REFERENCES [dbo].[Faculties] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

