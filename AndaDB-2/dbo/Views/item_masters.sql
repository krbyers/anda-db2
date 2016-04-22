

CREATE view [dbo].[item_masters]
as 

SELECT 

     CAST( item.ITMNUM                                 AS INT)          AS item_master_id
	,CAST( item.ITMNUM                                 AS VARCHAR(6))   AS item_num
    ,CAST( item.ITDESC                                 AS VARCHAR(30))  AS item_description
	,CAST( item.ITFSIN                                 AS VARCHAR(20))  AS first_substitute_item_num
	,CAST( item.ITSSIN                                 AS VARCHAR(20))  AS second_substitute_item_num
	,CAST( CASE WHEN item.ITRX     = 'Y' THEN 1 ELSE 0 END AS BIT)      AS prescription
	,CAST( CASE WHEN subord.IIFORM = 'P' THEN 1 ELSE 0 END  AS BIT)     AS anda_primary
	
	  
---FROM dbo.FPITMMAS item LEFT JOIN dbo.FPITMSUB subord ON subord.I@NMBR = item.ITMNUM WHJ 02242016
FROM dbo.FPITMMAS item LEFT JOIN dbo.FLITMSUB subord ON subord.IINMBR = item.ITMNUM

union

select * from [testing].[item_master_data]


