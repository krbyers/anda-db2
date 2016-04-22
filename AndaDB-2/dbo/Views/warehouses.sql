﻿









CREATE VIEW [dbo].[warehouses] AS 

SELECT 
       warehouse_id, 
       warehouse_num, 
       MIN(roll_warehouse) AS roll_warehouse,
       MIN(cutoff_time)     AS cutoff_time,
       MAX(closed)                AS closed

FROM 
       ( SELECT
                  warehouse_id
                     ,LCWHSE                                                                                         AS warehouse_num 
                     ,schd.roll_warehouse                                                       AS roll_warehouse
                     ,schd.cutoff_time                                                                 AS cutoff_time
                     ,CASE 
                           WHEN schd.cutoff_time < GETDATE() THEN 1               --Close the warehouse if we are past the cutoff time
                           ELSE 0 
                     END                                                                                             AS closed

         FROM dbo.FPLOCMST wh
                     LEFT JOIN dbo.warehouse_closures schd ON schd.warehouse_num = wh.LCWHSE
                     AND schd.date IS NULL            
                     AND schd.day_number = DATEPART(dw,GETDATE()) --Get the schedule information for today

         UNION

         SELECT
                     warehouse_id
                     ,LCWHSE                                                                                         AS warehouse_num
                     ,schd.roll_warehouse                                                     AS roll_warehouse
                     ,schd.cutoff_time                                                                 AS cutoff_time
                     ,1                                                                                              AS closed --Close the warehouse if the date entry is today  

         FROM dbo.FPLOCMST wh
                     LEFT JOIN dbo.warehouse_closures schd ON schd.warehouse_num = wh.LCWHSE 
                                  
         WHERE schd.date IS NOT NULL                      --date specific override
                     AND DATEDIFF(day,schd.date, GETDATE()) = 0
              
       ) whunion

GROUP BY warehouse_id, warehouse_num
