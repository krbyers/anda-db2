CREATE TABLE [dbo].[customer_types] (
    [customer_type_id]           INT         IDENTITY (1, 1) NOT NULL,
    [customer_type_number]       VARCHAR (6) NOT NULL,
    [allows_forced_substitution] BIT         NOT NULL,
    CONSTRAINT [PK_customer_types] PRIMARY KEY CLUSTERED ([customer_type_id] ASC)
);

