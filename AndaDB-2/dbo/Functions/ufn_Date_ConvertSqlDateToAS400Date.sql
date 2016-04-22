
/*\
SELECT dbo.ufn_Date_ConvertSqlDateToAS400Date(GETDATE(), 0) AS AS400Date
SELECT dbo.ufn_Date_ConvertSqlDateToAS400Date(GETDATE(), 1) AS AS400Date
SELECT dbo.ufn_Date_ConvertSqlDateToAS400Date('3012-03-31 00:00:00.000', 1) AS AS400Date
\*/
CREATE FUNCTION [dbo].[ufn_Date_ConvertSqlDateToAS400Date]
(
	@Date				DATETIME,
	@IncludeDayOfMonth	BIT = 0
)
RETURNS NUMERIC(7,0)
AS 
BEGIN
	DECLARE @Result NUMERIC(7,0);
	DECLARE @Year	INT;
	
	SET @Year = YEAR(@Date);

	-- Check for overflow condition
	IF @Year > 2899
		SET @Year = 2899; -- assign maximum value

	SET @Result = ((@Year - CASE WHEN @Year > 1999 
                                     THEN 1900 
                                     ELSE 1900 END) * 10000)
				+ (MONTH(@Date) * 100);

	IF @IncludeDayOfMonth = 1
		SET @Result = @Result + DAY(@Date);
	ELSE
		SET @Result = @Result / 100;

	RETURN @Result;
END
