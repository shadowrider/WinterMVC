﻿ALTER TABLE [dbo].[TeacherDepartments]
    ADD CONSTRAINT [PK_TeacherDepartments] PRIMARY KEY CLUSTERED ([TeacherID] ASC, [DepartmentID] ASC) WITH (ALLOW_PAGE_LOCKS = ON, ALLOW_ROW_LOCKS = ON, PAD_INDEX = OFF, IGNORE_DUP_KEY = OFF, STATISTICS_NORECOMPUTE = OFF);

