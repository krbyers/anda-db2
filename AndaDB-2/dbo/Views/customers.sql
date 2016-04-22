


/*
•	customer is enrolled in Anda Item substitution (customer master FPCUSMAS-CSSUB “SUBSTITUTE ITEMS ALLOWED - Y/N”; sql customermstr-customermstrSubItemAllowF)

	Here are the definitions of the values:
	N- No Anda sub
	Y- Yes Anda Sub
	R- Yes Anda sub if RX item (ITRX=Y)
	O- Yes Anda sub if RX=N (ITRX=N)

•	customer is enrolled in Generic Substitution (customer master FPCUSMAS-CSGNSB “ACCEPT GENERIC SUBST”; sql customermstr-customermstrSubGenericAcceptF)
	o	“T” – authorizes customer no. / item and customer-type / item substitution
	o	“Y” – authorizes customer no. / item and customer-type / item substitution and company-wide / item substitution
•	customer type does not allow forced substitution (parameter table name/value pair from FPSYGREF <Karen?> ) 
*/

CREATE VIEW [dbo].[customers]
AS



SELECT 

       /*              Old Name                                  New Data Type     New Name*/
	   CAST(           c.CNUMBR                                         AS BIGINT)           AS customer_id
	  ,CAST(           c.CNUMBR                                         AS VARCHAR(8))    AS customer_num
	  ,CAST(           c.CTYPE                                          AS VARCHAR(8))    AS customer_type
      ,CAST(           c.CLNAME                                         AS NVARCHAR(30))  AS customer_name

      ,CAST( CASE WHEN c.CSSUB IN ('Y','R')  THEN 1 ELSE 0 END          AS BIT)           AS allows_anda_rx_item_substitution
	  ,CAST( CASE WHEN c.CSSUB IN ('Y','O')  THEN 1 ELSE 0 END          AS BIT)           AS allows_anda_non_rx_item_substitution
	  
	  ,CAST( CASE WHEN c.CSGNSB IN ('T','Y') THEN 1 ELSE 0 END          AS BIT)           AS allows_customer_number_item_substitution
	  ,CAST( CASE WHEN c.CSGNSB IN ('T','Y') THEN 1 ELSE 0 END          AS BIT)           AS allows_customer_type_item_substitution
	  ,CAST( CASE WHEN c.CSGNSB IN ('Y')     THEN 1 ELSE 0 END          AS BIT)           AS allows_company_wide_item_substitution
	  
	  --,CAST( ISNULL( ct.allows_forced_substitution ,0)                AS BIT)           AS allows_forced_substitution

	  ,CAST( CASE WHEN dta.PDSEQ=c.CTYPE THEN 1 ELSE 0 END              AS BIT )          AS allows_forced_substitution

	  ,CAST( CASE WHEN sb2.C2SHWS <> '0' THEN sb2.C2SHWS ELSE NULL END  AS VARCHAR(2))    AS first_warehouse
	  ,CAST( CASE WHEN sb2.C2SHW2 <> '0' THEN sb2.C2SHW2 ELSE NULL END  AS VARCHAR(2))    AS second_warehouse
	  ,CAST( CASE WHEN sb2.C2SHW3 <> '0' THEN sb2.C2SHW3 ELSE NULL END  AS VARCHAR(2))    AS third_warehouse
	  
	  FROM dbo.FPCUSMAS c
			
			LEFT JOIN dbo.FPCUSSB2 sb2 ON sb2.C2NMBR = c.CNUMBR
			--LEFT JOIN dbo.customer_types ct ON ct.customer_type_number = c.CTYPE
			LEFT JOIN dbo.FPPGMDTA dta on dta.PDSEQ = c.CTYPE AND dta.PDPROGRAM = 'ORR020' AND dta.PDFORMAT = 'ONEWHS'
