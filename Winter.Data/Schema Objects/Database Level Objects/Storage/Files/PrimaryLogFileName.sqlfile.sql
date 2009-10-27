ALTER DATABASE [$(DatabaseName)]
    ADD LOG FILE (NAME = [PrimaryLogFileName], FILENAME = '$(DefaultDataPath)$(DatabaseName)_log.ldf', SIZE = 7616 KB, MAXSIZE = 2097152 MB, FILEGROWTH = 10 %);





