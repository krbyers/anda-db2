/*\
DESCRIPTION
    Transform the item balances from the base iSeries tables 
    that is refreshed every morning to the item_balanaces table.  

EXEC dbo.materialize_item_balances
SELECT * FROM dbo.item_balances_seed
\*/
CREATE PROCEDURE dbo.materialize_item_balances
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE dbo.item_balances;

    INSERT INTO dbo.item_balances (
           item_balance_id,
           item_num,
           warehouse_num,
           customer_type,
           open_quantity_present,
           reserved_quantity_present,
           customer_type_reserved_quantity_present,
           use_only_customer_reserve
    )
    SELECT item_balance_id,
           item_num,
           warehouse_num,
           customer_type,
           open_quantity_present,
           reserved_quantity_present,
           customer_type_reserved_quantity_present,
           use_only_customer_reserve
    FROM   dbo.item_balances_seed;
END
