ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [PrimaryFileName], FILENAME = '$(DefaultDataPath)$(DatabaseName).mdf', SIZE = 6400 KB, MAXSIZE = UNLIMITED, FILEGROWTH = 1024 KB) TO FILEGROUP [PRIMARY];







   