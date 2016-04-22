CREATE TABLE [testing].[item_balance_data] (
    [item_balance_id]                         BIGINT      NULL,
    [item_num]                                VARCHAR (9) NULL,
    [warehouse_num]                           VARCHAR (2) NULL,
    [customer_type]                           VARCHAR (4) NULL,
    [open_quantity_present]                   INT         NULL,
    [reserved_quantity_present]               INT         NULL,
    [customer_type_reserved_quantity_present] INT         NULL,
    [use_only_customer_reserve]               BIT         NULL
);

