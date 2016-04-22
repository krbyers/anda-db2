CREATE TABLE [testing].[gensub_data] (
    [generic_equivalent_id] INT          NULL,
    [item_num]              VARCHAR (7)  NULL,
    [customer_num]          VARCHAR (6)  NULL,
    [customer_type]         VARCHAR (6)  NULL,
    [substitute_item_num]   VARCHAR (20) NULL,
    [prescription]          BIT          NULL,
    [anda_primary]          BIT          NULL,
    [do_not_substitute]     BIT          NULL,
    [substitution_level]    INT          NULL
);

