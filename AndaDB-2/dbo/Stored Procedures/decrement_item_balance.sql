
CREATE PROCEDURE [dbo].[decrement_item_balance] (@IBWHSE DECIMAL(2,0), @item_list NVARCHAR(MAX), @quantity_list NVARCHAR(MAX)) AS

SET NOCOUNT ON

CREATE TABLE #items
(row_counter INT IDENTITY(1,1),
IBWHSE DECIMAL(2,0),
items DECIMAL(6,0),
withdraw_result INT)

CREATE TABLE #quantities
(row_counter INT IDENTITY(1,1),
quantities DECIMAL(6,0))

DECLARE @item_count INT
DECLARE @quantity_count INT

INSERT #items(IBWHSE, items)
SELECT @IBWHSE, ITEMS FROM dbo.Split(@item_list, CHAR(44))

INSERT #quantities(quantities)
SELECT ITEMS FROM dbo.Split(@quantity_list, CHAR(44))

SELECT @item_count = MAX(row_counter) FROM #items
SELECT @quantity_count = MAX(row_counter) FROM #quantities

IF @item_count <> @quantity_count
	BEGIN
		RETURN 0
	END

---SELECT row_counter, items FROM #items
---SELECT row_counter, quantities FROM #quantities

SELECT @quantity_count = COUNT(*) FROM #items i INNER JOIN #quantities q
ON i.row_counter = q.row_counter INNER JOIN dbo.FPITMBAL B ON
B.[IBWHSE] = i.IBWHSE AND
B.[IBITEM] = i.items
WHERE (IBQHAV - quantities) >= 0

IF @item_count <> @quantity_count
	BEGIN
		RETURN 0
	END
ELSE
	BEGIN

---- BEFORE
SELECT B.IBWHSE, items, quantities, IBQHAV, IBQHAV - quantities as Remainder FROM #items i INNER JOIN #quantities q
ON i.row_counter = q.row_counter INNER JOIN dbo.FPITMBAL B ON
B.[IBWHSE] = i.IBWHSE AND
B.[IBITEM] = i.items  ORDER BY B.IBWHSE, items

		UPDATE dbo.FPITMBAL SET IBQHAV  = ISNULL(IBQHAV, 0) - ISNULL(quantities,0)
		FROM #items i INNER JOIN #quantities q
		ON i.row_counter = q.row_counter INNER JOIN dbo.FPITMBAL B ON
		B.[IBWHSE] = i.IBWHSE AND
		B.[IBITEM] = i.items
	END

--- AFTER
SELECT B.IBWHSE, items, quantities, IBQHAV, IBQHAV - quantities as Remainder FROM #items i INNER JOIN #quantities q
ON i.row_counter = q.row_counter INNER JOIN dbo.FPITMBAL B ON
B.[IBWHSE] = i.IBWHSE AND
B.[IBITEM] = i.items ORDER BY B.IBWHSE, items

		RETURN 1