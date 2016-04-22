CREATE TABLE [dbo].[log_history] (
    [log_history_id] UNIQUEIDENTIFIER NOT NULL,
    [log_timestamp]  DATETIME         NOT NULL,
    [level_name]     VARCHAR (8)      NOT NULL,
    [logger_name]    VARCHAR (MAX)    NOT NULL,
    [message]        VARCHAR (MAX)    NULL,
    [thread_name]    VARCHAR (MAX)    NULL,
    [stack_trace]    VARCHAR (MAX)    NULL,
    [file_name]      VARCHAR (MAX)    NULL,
    [class_name]     VARCHAR (MAX)    NULL,
    [method_name]    VARCHAR (MAX)    NULL,
    [line_number]    VARCHAR (MAX)    NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Journal table to receive log entries from Foundation components.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'log_history';

