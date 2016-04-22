
/*\
Converts from the number representation of a CYYMM date used on 
the AS/400 into an SQL datetime. The first of the month is assumed,
since the day portion of the date is not provided. The function
returns a NULL if a correct datetime cannot be determined from the
input.

CYYMM -> C = Century (only 0 or 1)
				0 = 20th century [1900]
				1 = 21st century [2000]
		 YY = 2 digit year that is added to the century to get 4 digit year
		 MM = Month of the year (1 thru 12)

Example:

SELECT dbo.ufn_Date_ConvertCYYMMToSqlDate(10707);
	result: 2007-07-01 00:00:00.000 which is July, 1st 2007.

SELECT dbo.ufn_Date_ConvertCYYMMToSqlDate(CONVERT(SMALLINT, '09603'));
SELECT dbo.ufn_Date_ConvertCYYMMToSqlDate(9603);
	result: 1996-03-01 00:00:00.000 which is March, 1st 1996.
\*/
CREATE FUNCTION [dbo].[ufn_Date_ConvertCYYMMToSqlDate]
(
    @Date_CMMYY SMALLINT -- Date as CMMYY
) 
RETURNS DATETIME
AS
BEGIN
	DECLARE @CharDate	VARCHAR(12);
	DECLARE @Year		INT;
	DECLARE @Month		INT;
	DECLARE @Day		INT;

	SET	@Day = 1;
	SET	@Month = @Date_CMMYY % 100;
	SET	@Year = (@Date_CMMYY - @Month) / 100;
	SET @Year = @Year + 1900;

	IF @Month < 1 OR @Month > 12 RETURN NULL; -- Some problem with date

	SET @CharDate =	CONVERT(CHAR(4), @Year)
					+ '-'
					+ RIGHT('00' + CONVERT(VARCHAR(2), @Month), 2)
					+ '-'
					+ RIGHT('00' + CONVERT(VARCHAR(2), @Day), 2);

	IF ISDATE(@CharDate) = 0 RETURN NULL; -- Some problem with date
	RETURN CONVERT(DATETIME, @CharDate, 120);
END
