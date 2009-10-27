CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
@Feature NVARCHAR (128), @CompatibleSchemaVersion NVARCHAR (128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END