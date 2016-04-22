CREATE TABLE [testing].[item_master_data] (
    [item_master_id]             INT          NULL,
    [item_num]                   VARCHAR (7)  NULL,
    [item_description]           VARCHAR (30) NULL,
    [first_substitute_item_num]  VARCHAR (20) NULL,
    [second_substitute_item_num] VARCHAR (20) NULL,
    [prescription]               BIT          NULL,
    [anda_primary]               BIT          NULL
);

