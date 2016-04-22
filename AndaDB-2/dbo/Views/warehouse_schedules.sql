



CREATE VIEW [dbo].[warehouse_schedules] AS 

SELECT
     
        LSWHSE   AS warehouse_num
	   ,LSDAY    AS day_number
	   ,dbo.ufn_Date_ConvertAS400TimeToSqlDateTimeForToday(LSTIME)   AS cutoff_time
	   ,LSROLWHS AS roll_warehouse	

FROM dbo.FPLOCSUB
