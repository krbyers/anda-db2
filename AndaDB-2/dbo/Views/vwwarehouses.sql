
CREATE VIEW [dbo].[vwwarehouses] AS SELECT
       [warehouse_id],
       [LCWHSE] AS [warehouse_num],
       [recieved_as_fact]
	   FROM [dbo].[FPLOCMST]
