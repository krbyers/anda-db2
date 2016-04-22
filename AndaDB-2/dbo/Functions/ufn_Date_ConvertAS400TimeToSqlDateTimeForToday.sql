

CREATE FUNCTION [dbo].[ufn_Date_ConvertAS400TimeToSqlDateTimeForToday]
(
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
                
                                
                SET @Time = dbo.ufn_String_PadBefore(@As400Time, 6, '0')
                SET @Time = STUFF(STUFF(@Time, 5, 0, ':'), 3, 0, ':')

                SET @Hour = CAST(SUBSTRING(@Time, 1,2) AS INT)
                SET @Minute = CAST(SUBSTRING(@Time, 4,2) AS INT)
                SET @Second = CAST(SUBSTRING(@Time, 7,2) AS INT)

                SELECT @DateTimeAdder = DATEADD(d,0,DATEDIFF(d,0,GETDATE()))
                SELECT @DateTimeAdder = DATEADD(hh, @Hour, @DateTimeAdder) --- Add hours
                SELECT @DateTimeAdder = DATEADD(n, @Minute, @DateTimeAdder)  --- Add minutes
                SELECT @DateTimeAdder = DATEADD(ss, @Second, @DateTimeAdder)  --- Add seconds
                RETURN @DateTimeAdder



END
