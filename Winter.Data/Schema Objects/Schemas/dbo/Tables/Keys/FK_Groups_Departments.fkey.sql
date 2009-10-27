ALTER TABLE [dbo].[Groups]
    ADD CONSTRAINT [FK_Groups_Departments] FOREIGN KEY ([DepartmentID]) REFERENCES [dbo].[Departments] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

