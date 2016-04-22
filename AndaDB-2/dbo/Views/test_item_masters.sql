









CREATE view [dbo].[test_item_masters]
as 

SELECT 
*
FROM (
	   SELECT 
		 CASE WHEN ITFSIN IS NOT NULL THEN '1' END                       AS first_substitute_item_num
		,CASE WHEN ITSSIN IS NOT NULL THEN '2' END                       AS second_substitute_item_num
	    ,CAST(CASE WHEN ITRX = 'Y' THEN 1 ELSE 0 END AS BIT)             AS prescription 
		,CAST(CASE WHEN subord.I@FORM ='P' THEN 1 ELSE 0 END AS BIT)     AS anda_primary 
	   FROM dbo.FPITMMAS item LEFT JOIN dbo.FPITMSUB subord ON subord.I@NMBR = item.ITMNUM 
	 ) x
GROUP BY first_substitute_item_num,second_substitute_item_num,prescription,anda_primary
