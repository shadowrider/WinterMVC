ALTER TABLE [dbo].[Departments]
    ADD CONSTRAINT [FK_Departments_Faculties] FOREIGN KEY ([FacultyID]) REFERENCES [dbo].[Faculties] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

