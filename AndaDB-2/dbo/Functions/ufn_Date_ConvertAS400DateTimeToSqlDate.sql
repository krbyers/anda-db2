
/*\
SELECT dbo.ufn_Date_ConvertAS400DateTimeToSqlDate(N'2008-02-16', N'  04.32.25');
\*/
CREATE FUNCTION [dbo].[ufn_Date_ConvertAS400DateTimeToSqlDate]
(
                @As400Date AS CHAR(10),
                @As400Time AS CHAR(10)
)
RETURNS DATETIME
AS
BEGIN
                RETURN CAST(@As400Date + N' ' + REPLACE(LTRIM(@As400Time), N'.', N':') AS DATETIME);
END
