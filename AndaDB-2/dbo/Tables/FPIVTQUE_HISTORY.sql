CREATE TABLE [dbo].[FPIVTQUE_HISTORY] (
    [inventory_message] INT         NOT NULL,
    [IVITM#]            DECIMAL (6) NOT NULL,
    [IVWHSE]            DECIMAL (2) NOT NULL,
    [version_time]      DATETIME    NOT NULL,
    [archive_time]      DATETIME    DEFAULT (getdate()) NULL
);



