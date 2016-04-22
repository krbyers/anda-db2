
/*\
SELECT dbo.ufn_Date_ConvertAS400DateTimeToSqlDate_2(1110524, 161903);
SELECT dbo.ufn_Date_ConvertAS400DateTimeToSqlDate_2(1110524, 0);
SELECT dbo.ufn_Date_ConvertAS400DateTimeToSqlDate_2(0, 161903);

Returns a NULL if value of parameters is not valid.
\*/
CREATE FUNCTION [dbo].[ufn_Date_ConvertAS400DateTimeToSqlDate_2]
(
                @As400Date AS DECIMAL(7,0),
                @As400Time AS DECIMAL(6,0)
)
RETURNS DATETIME
AS
BEGIN
                DECLARE @Time CHAR(6);
                
                IF @As400Date = 0 OR @As400Date IS NULL OR @As400Time IS NULL
                                RETURN NULL;
                
                SET @Time = dbo.ufn_String_PadBefore(@As400Time, 6, '0');

                RETURN CAST(CONVERT(VARCHAR(10), dbo.ufn_Date_ConvertAS400DateToSqlDate(@As400Date), 120)
                                   + ' '
                                   + STUFF(STUFF(@Time, 5, 0, ':'), 3, 0, ':') AS DATETIME);
END
