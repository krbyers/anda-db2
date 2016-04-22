






CREATE VIEW [dbo].[base_item_balances]
WITH SCHEMABINDING
AS


	SELECT 

		CAST( ISNULL(bal.IBITEM,0)*100000 + ISNULL(IBWHSE,0)*1000             AS BIGINT) AS item_balance_id

		,CAST( bal.IBITEM                                  AS VARCHAR(6) )  AS item_num
		,CAST( bal.IBWHSE                                  AS VARCHAR(2) )  AS warehouse_num
	
		,NULL                                                               AS customer_type
	
		,CAST( bal.IBQHAV                                  AS INT        )  AS open_quantity_present
		,CAST( bal.IBQHRS                                  AS INT        )  AS reserved_quantity_present
	
		,CAST( 0                                           AS INT        )  AS customer_type_reserved_quantity_present

		,CAST( 0                                           AS BIT        )  AS use_only_customer_reserve
	
	FROM [dbo].FPITMBAL bal 

UNION

	SELECT 

		CAST( ISNULL(bal.IBITEM,0)*100000 + ISNULL(IBWHSE,0)*1000 + ISNULL(brs.IRCTYP,0) AS BIGINT)          AS item_balance_id

		,CAST( bal.IBITEM                                  AS VARCHAR(6) )  AS item_num
		,CAST( bal.IBWHSE                                  AS VARCHAR(2) )  AS warehouse_num
	
		,CAST( brs.IRCTYP                                  AS VARCHAR(4) )  AS customer_type
	
		,CAST( bal.IBQHAV                                  AS INT        )  AS open_quantity_present
		,CAST( bal.IBQHRS                                  AS INT        )  AS reserved_quantity_present
		,CAST( ISNULL(brs.IRQHRS,0)                        AS INT        )  AS customer_type_reserved_quantity_present

	    ,CAST( CASE WHEN brs.IRONLY='Y' THEN 1 ELSE 0 END  AS BIT        )  AS use_only_customer_reserve	
	
	FROM [dbo].FPITMBAL bal 
			LEFT JOIN dbo.FPITMBRS brs on brs.IRITEM = bal.IBITEM AND brs.IRWHSE = bal.IBWHSE

