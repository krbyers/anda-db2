


CREATE VIEW [dbo].[warehouse_locator_aggregates]
AS 

SELECT 

       MIN(warehouse_locator_detail_id) AS warehouse_locator_aggregate_id
       ,warehouse_num
       ,item_num
       ,zone
       ,usage
	   ,status
	   ,expired
       ,SUM(quantity) AS quantity
                     
FROM dbo.warehouse_locator_details dtl

GROUP BY warehouse_num, item_num, zone, usage, status, expired
