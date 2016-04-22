




CREATE VIEW [dbo].[generic_equivalents]
AS 

SELECT 

     CAST( gen.generic_equivalent_id                        AS INT)         AS generic_equivalent_id

       ,CAST( gen.SIITEM                                       AS VARCHAR(6))  AS item_num
       ,CAST( gen.SICUST                                       AS VARCHAR(6))  AS customer_num
       ,CAST( gen.SITYPE                                       AS VARCHAR(6))  AS customer_type

       ,CAST( gen.SISITM                                       AS VARCHAR(20)) AS substitute_item_num

       ,CAST( CASE WHEN item.ITRX     = 'Y' THEN 1 ELSE 0 END  AS BIT)         AS prescription
       ,CAST( CASE WHEN subord.IIFORM = 'P' THEN 1 ELSE 0 END  AS BIT)         AS anda_primary
       ,CAST( CASE WHEN gen.SIITMR   = 'R' THEN 1 ELSE 0 END   AS BIT)         AS do_not_substitute
       ,CAST( gen.SISEQ                                        AS INT)         AS substitution_level

FROM dbo.FPSUBITM gen
                    LEFT JOIN dbo.FPITMMAS item   ON item.ITMNUM = gen.SISITM
                     LEFT JOIN dbo.FLITMSUB  subord ON subord.IINMBR = gen.SISITM
WHERE gen.SISTAT != 'D' AND gen.SISITM <> 0

UNION SELECT * FROM testing.gensub_data
