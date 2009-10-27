CREATE TABLE [dbo].[Persons] (
    [ID]         INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]  NVARCHAR (50) NULL,
    [SecondName] NVARCHAR (50) NULL,
    [LastName]   NVARCHAR (50) NULL,
    [Birthdate]  DATETIME      NULL
);

