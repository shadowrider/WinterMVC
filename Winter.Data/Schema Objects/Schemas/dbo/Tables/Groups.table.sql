CREATE TABLE [dbo].[Groups] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (500) NOT NULL,
    [DepartmentID] INT            NOT NULL
);

