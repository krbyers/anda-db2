EXECUTE sp_addrolemember @rolename = N'db_owner', @membername = N'DEVSVC2';


GO
EXECUTE sp_addrolemember @rolename = N'db_ddladmin', @membername = N'DEVSVC2';


GO

EXECUTE sp_addrolemember @rolename = N'db_datareader', @membername = N'DEVSVC2';


GO

EXECUTE sp_addrolemember @rolename = N'db_datawriter', @membername = N'DEVSVC2';

