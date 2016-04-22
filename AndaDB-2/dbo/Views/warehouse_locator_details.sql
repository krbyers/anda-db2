




CREATE VIEW [dbo].[warehouse_locator_details]
AS 

SELECT 

     wld.warehouse_locator_detail_id
	 
	,CAST( wld.WDLOC                                                                     AS VARCHAR(2))  AS warehouse_num
	,CAST( wld.WDITEM                                                                    AS VARCHAR(6))  AS item_num
	,CAST( wld.WDLOT                                                                     AS VARCHAR(15)) AS lot_num
	,CAST( wld.WDZONE                                                                    AS VARCHAR(2))  AS zone
	,CAST( wld.WDUSET                                                                    AS VARCHAR(1))  AS usage
	,CAST( wld.WDSTAT                                                                    AS VARCHAR(1))  AS status
	,CAST( wld.WDQTYA												                     AS INT)         AS quantity
	,CAST( CASE WHEN 
					dbo.ufn_Date_ConvertAS400DateToSqlDate(wld.WDEXPD) <= SYSDATETIME()
					AND wld.WDLOT <> '' 
					AND wld.WDSTAT = 'O' 
				THEN 1 
				ELSE 0 END                                                               AS BIT)         AS expired
			
FROM dbo.FPWHLDTL wld
