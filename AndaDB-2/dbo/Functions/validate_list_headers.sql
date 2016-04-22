CREATE FUNCTION dbo.validate_list_headers(@item_number datetime) 
/***********************************************************
* Author: Will Juntunen CIG 3/4/2016
* SELECT dbo.validate_list(999999)
* SELECT dbo.validate_list(10106)
* Returns less than three if one of the item related tables fails to have at least one record.
*
*
************************************************************/

RETURNS int
WITH EXECUTE AS CALLER
AS
BEGIN
DECLARE @count_to_return INT
SELECT @count_to_return = 0
	IF EXISTS(SELECT * FROM dbo.FPITMMAS WHERE ITMNUM = @item_number) 
		SET @count_to_return = @count_to_return + 1
	IF EXISTS(SELECT * FROM dbo.FLITMSUB WHERE IINMBR = @item_number) 
		SET @count_to_return = @count_to_return + 1
	IF EXISTS(SELECT * FROM dbo.FPSUBITM WHERE SIITEM = @item_number) 
		SET @count_to_return = @count_to_return + 1
     RETURN(@count_to_return);
END;