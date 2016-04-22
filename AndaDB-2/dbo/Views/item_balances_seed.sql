






CREATE VIEW [dbo].[item_balances_seed]
WITH SCHEMABINDING
AS

SELECT

	 MIN(item_balance_id)                                                          AS item_balance_id
	,item_num                                                                      AS item_num
	,warehouse_num                                                                 AS warehouse_num
	,customer_type                                                                 AS customer_type
	,SUM(open_quantity_present)                                                    AS open_quantity_present
	,SUM(reserved_quantity_present)                                                AS reserved_quantity_present
	,SUM(customer_type_reserved_quantity_present)                                  AS customer_type_reserved_quantity_present 
	,CAST( MIN(CASE WHEN use_only_customer_reserve=1 THEN 1 ELSE 0 END) AS BIT )   AS use_only_customer_reserve

FROM dbo.base_item_balances

GROUP BY item_num, warehouse_num, customer_type





