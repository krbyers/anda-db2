CREATE TABLE [dbo].[item_balances] (
    [item_balance_id]                         BIGINT      NULL,
    [item_num]                                VARCHAR (6) NULL,
    [warehouse_num]                           VARCHAR (2) NULL,
    [customer_type]                           VARCHAR (4) NULL,
    [open_quantity_present]                   INT         NULL,
    [reserved_quantity_present]               INT         NULL,
    [customer_type_reserved_quantity_present] INT         NULL,
    [use_only_customer_reserve]               BIT         NULL,
    [created_date]                            DATETIME    DEFAULT (getdate()) NULL
);




GO
CREATE UNIQUE CLUSTERED INDEX [ITEM_BALANCE_IX]
    ON [dbo].[item_balances]([item_balance_id] ASC, [item_num] ASC, [warehouse_num] ASC, [customer_type] ASC) WITH (ALLOW_PAGE_LOCKS = OFF);

