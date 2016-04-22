








CREATE VIEW [dbo].[warehouse_closures] AS 

SELECT
     
        LSWHSE                                                                                   AS warehouse_num
          ,LSDAY+1                                                                                                                         AS day_number -- +1 to match SQL DATEPART
          ,CASE WHEN LSDATE <> 0 THEN dbo.ufn_Date_ConvertAS400DateToSqlDate(LSDATE) ELSE NULL END       AS date
          ,dbo.ufn_Date_ConvertAS400TimeToSqlDateTimeForToday(LSTIME)                               AS cutoff_time
          ,LSROLWHS                                                                                 AS roll_warehouse    

FROM dbo.FPLOCSUB