ALTER TABLE [dbo].[TeacherDepartments]
    ADD CONSTRAINT [FK_TeacherDepartments_Departments] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Departments] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

