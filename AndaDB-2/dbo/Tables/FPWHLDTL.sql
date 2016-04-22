CREATE TABLE [dbo].[FPWHLDTL] (
    [WDLOC]                       DECIMAL (2)    NULL,
    [WDZONE]                      CHAR (2)       NULL,
    [WDAISL]                      CHAR (2)       NULL,
    [WDBAY]                       CHAR (2)       NULL,
    [WDTIER]                      CHAR (1)       NULL,
    [WDBIN]                       CHAR (2)       NULL,
    [WDITEM]                      DECIMAL (6)    NULL,
    [WDDATE]                      DECIMAL (7)    NULL,
    [WDTIME]                      DECIMAL (6)    NULL,
    [WDQTYA]                      DECIMAL (7)    NULL,
    [WDATYP]                      CHAR (1)       NULL,
    [WDDSPY]                      CHAR (1)       NULL,
    [WDOLOC]                      DECIMAL (2)    NULL,
    [WDSTAT]                      CHAR (1)       NULL,
    [WDUSET]                      CHAR (1)       NULL,
    [WDRTYP]                      CHAR (1)       NULL,
    [WDVNDN]                      DECIMAL (5)    NULL,
    [WDPO#]                       DECIMAL (7)    NULL,
    [WDLOT]                       CHAR (15)      NULL,
    [WDEXPD]                      DECIMAL (7)    NULL,
    [WDCRUP]                      DECIMAL (7, 2) NULL,
    [WDVEXP]                      DECIMAL (7)    NULL,
    [warehouse_locator_detail_id] INT            IDENTITY (1, 1) NOT NULL,
    [load_date]                   DATETIME       CONSTRAINT [DF_FPWHLDTL_load_date] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_FPWHLDTL] PRIMARY KEY NONCLUSTERED ([warehouse_locator_detail_id] ASC)
);


GO
CREATE CLUSTERED INDEX [FPWHLDTL_IX_clustered]
    ON [dbo].[FPWHLDTL]([WDLOC] ASC, [WDZONE] ASC, [WDAISL] ASC, [WDBAY] ASC, [WDTIER] ASC, [WDBIN] ASC, [WDITEM] ASC);

