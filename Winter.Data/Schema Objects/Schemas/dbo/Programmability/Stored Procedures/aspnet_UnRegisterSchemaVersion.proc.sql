CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
@Feature NVARCHAR (128), @CompatibleSchemaVersion NVARCHAR (128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END