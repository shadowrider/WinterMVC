﻿ALTER TABLE [dbo].[Teachers]
    ADD CONSTRAINT [FK_Teachers_Persons] FOREIGN KEY ([PersonID]) REFERENCES [dbo].[Persons] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

