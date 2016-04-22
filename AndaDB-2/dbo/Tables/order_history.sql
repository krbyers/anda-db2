CREATE TABLE [dbo].[order_history] (
    [order_num]     VARCHAR (8)   NOT NULL,
    [process_time]  DATETIME      NOT NULL,
    [error_message] VARCHAR (MAX) NULL,
    [order_json]    VARCHAR (MAX) NULL,
    [created_by]    VARCHAR (255) DEFAULT (suser_sname()) NOT NULL,
    CONSTRAINT [PK_order_history] PRIMARY KEY CLUSTERED ([order_num] ASC, [process_time] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'History of every order/processing attempt.  When successful, the order_json column will be populated, otherwise the error_message column will be populated.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'order_history';

