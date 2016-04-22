CREATE TABLE [dbo].[FLCUSSUB] (
    [CCNMBR]       DECIMAL (6)    NULL,
    [CCODED]       DECIMAL (7)    NULL,
    [CCGLSL]       CHAR (24)      NULL,
    [CCGLCS]       CHAR (24)      NULL,
    [CCSTYP]       CHAR (1)       NULL,
    [CCVAIN]       CHAR (1)       NULL,
    [CCCODP]       CHAR (1)       NULL,
    [CCBILL]       CHAR (1)       NULL,
    [CCBLCS]       DECIMAL (9)    NULL,
    [CCINYN]       CHAR (1)       NULL,
    [CCBTYP]       CHAR (1)       NULL,
    [CCRCNM]       CHAR (24)      NULL,
    [CCOFFP]       DECIMAL (5, 3) NULL,
    [CCODAY]       DECIMAL (3)    NULL,
    [CCOEXP]       DECIMAL (7)    NULL,
    [CCABCD]       CHAR (1)       NULL,
    [CCKYAC]       CHAR (1)       NULL,
    [CCVOLD]       CHAR (1)       NULL,
    [CCCYYN]       CHAR (1)       NULL,
    [CCCCGP]       CHAR (200)     NULL,
    [CCFORM]       CHAR (1)       NULL,
    [CCADDD]       DECIMAL (7)    NULL,
    [CCMNTD]       DECIMAL (7)    NULL,
    [CCEMAL]       CHAR (50)      NULL,
    [CCDP4N]       CHAR (13)      NULL,
    [CCIMH$]       DECIMAL (3)    NULL,
    [CCBMEX]       CHAR (1)       NULL,
    [CCACPR]       CHAR (2)       NULL,
    [FLCUSSUB_key] INT            IDENTITY (1, 1) NOT NULL,
    [load_date]    DATETIME       CONSTRAINT [DF_FLCUSSUB_load_date] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_FLCUSSUB] PRIMARY KEY NONCLUSTERED ([FLCUSSUB_key] ASC)
);




GO


