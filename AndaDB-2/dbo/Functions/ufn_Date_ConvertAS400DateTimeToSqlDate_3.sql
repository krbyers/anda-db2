
CREATE FUNCTION [dbo].[ufn_Date_ConvertAS400DateTimeToSqlDate_3]
(
                @As400Date AS DECIMAL(7,0),
                @As400Time AS DECIMAL(6,0)
)
RETURNS DATETIME
AS
BEGIN
                DECLARE @Time CHAR(6);
                DECLARE @DateTimeAdder DATETIME
                DECLARE @Hour INT
                DECLARE @Minute INT
                DECLARE @Second INT
                
                
                IF @As400Date = 0 OR @As400Date IS NULL OR @As400Time IS NULL
                                RETURN NULL;
                
                SET @Time = dbo.ufn_String_PadBefore(@As400Time, 6, '0')
                SET @Time = STUFF(STUFF(@Time, 5, 0, ':'), 3, 0, ':')

                SET @Hour = CAST(SUBSTRING(@Time, 1,2) AS INT)
                SET @Minute = CAST(SUBSTRING(@Time, 4,2) AS INT)
                SET @Second = CAST(SUBSTRING(@Time, 7,2) AS INT)

                SELECT @DateTimeAdder = CAST(CONVERT(VARCHAR(10), dbo.ufn_Date_ConvertAS400DateToSqlDate(@As400Date), 120) AS DATETIME)
                SELECT @DateTimeAdder = DATEADD(hh, @Hour, @DateTimeAdder) --- Add hours
                SELECT @DateTimeAdder = DATEADD(n, @Minute, @DateTimeAdder)  --- Add minutes
                SELECT @DateTimeAdder = DATEADD(ss, @Second, @DateTimeAdder)  --- Add seconds
                RETURN @DateTimeAdder



END
