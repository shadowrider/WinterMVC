﻿ALTER TABLE [dbo].[Students]
    ADD CONSTRAINT [FK_Students_Groups] FOREIGN KEY ([GroupID]) REFERENCES [dbo].[Groups] ([ID]) ON DELETE NO ACTION ON UPDATE NO ACTION;

