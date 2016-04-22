
/*\
This function takes an AS400 Date and converts it to an Sql Date.
It returns a NULL if a valid conversion can not be made.
If an invalid value is passed in, a NULL is returned.

The AS400 date is a 7 digit numeric and encoded as CYYMMDD.
	C -> Century, YY -> Year, MM -> Month, DD -> Day
Where C is 0 for 1900 and 1 for 2000.

SELECT dbo.ufn_Date_ConvertAS400DateToSqlDate(1061103) AS SqlDate;
SELECT dbo.ufn_Date_ConvertAS400DateToSqlDate(1070504) AS SqlDate;
SELECT dbo.ufn_Date_ConvertAS400DateToSqlDate(1070220) AS SqlDate;

SELECT dbo.ufn_Date_ConvertAS400DateToSqlDate(1072420) AS SqlDate -- Incorrect date
\*/
CREATE FUNCTION [dbo].[ufn_Date_ConvertAS400DateToSqlDate]
(
	@As400Date AS NUMERIC(7, 0) -- CYYMMDD
)
RETURNS DATETIME
AS
BEGIN
	DECLARE @SqlDate	VARCHAR(10);
	DECLARE @Offset		NUMERIC(8,0);

	IF @As400Date <= 0 OR @As400Date IS NULL -- incorrect format
		RETURN NULL;

	SET @Offset = 19000000;

	SET @SqlDate =	SUBSTRING(CAST((@Offset + @As400Date) AS VARCHAR), 5, 2)	-- Month
					+ '-' +
					SUBSTRING(CAST((@Offset + @As400Date) AS VARCHAR), 7, 2)	-- Day
					+ '-' +
					SUBSTRING(CAST((@Offset + @As400Date) AS VARCHAR), 1, 4);	-- Year

	IF ISDATE(@SqlDate) = 0 -- check if we have a valid date.
		RETURN NULL;

	RETURN CAST(@SqlDate AS DATETIME);
END
