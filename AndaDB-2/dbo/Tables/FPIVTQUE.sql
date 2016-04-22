CREATE TABLE [dbo].[FPIVTQUE] (
    [inventory_message] INT         IDENTITY (1, 1) NOT NULL,
    [IVITM#]            DECIMAL (6) NOT NULL,
    [IVWHSE]            DECIMAL (2) NOT NULL,
    [version_time]      DATETIME    CONSTRAINT [DF_FPIVTQUE_version_time] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_FPIVTQUE] PRIMARY KEY CLUSTERED ([inventory_message] ASC)
);


GO

CREATE TRIGGER history_FPIVTQUE_trigger
    ON dbo.FPIVTQUE
    FOR DELETE
AS
    INSERT FPIVTQUE_HISTORY(inventory_message, IVITM#, IVWHSE, version_time) SELECT inventory_message, IVITM#, IVWHSE, version_time FROM DELETED
