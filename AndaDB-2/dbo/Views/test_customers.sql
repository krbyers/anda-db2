
CREATE VIEW [dbo].[test_customers]
AS



SELECT 

       CAST( CASE WHEN c.CSSUB IN ('Y','R')  THEN 1 ELSE 0 END AS BIT)           AS allows_anda_rx_item_substitution
	  ,CAST( CASE WHEN c.CSSUB IN ('Y','O')  THEN 1 ELSE 0 END AS BIT)           AS allows_anda_non_rx_item_substitution
	  
	  ,CAST( CASE WHEN c.CSGNSB IN ('T','Y') THEN 1 ELSE 0 END AS BIT)           AS allows_customer_number_item_substitution
	  ,CAST( CASE WHEN c.CSGNSB IN ('T','Y') THEN 1 ELSE 0 END AS BIT)           AS allows_customer_type_item_substitution
	  ,CAST( CASE WHEN c.CSGNSB IN ('Y')     THEN 1 ELSE 0 END AS BIT)           AS allows_company_wide_item_substitution
	  
	  ,CAST( ISNULL( NULL ,0)                                AS BIT)             AS allows_forced_substitution
	  
FROM dbo.FPCUSMAS c
GROUP BY c.CSSUB, c.CSGNSB
