CREATE TABLE [dbo].[integration_tests] (
    [test_id]           INT            IDENTITY (1, 1) NOT NULL,
    [test_name]         VARCHAR (50)   NOT NULL,
    [test_description]  VARCHAR (1000) CONSTRAINT [integration_tests_df] DEFAULT (space((0))) NOT NULL,
    [url]               VARCHAR (1000) NOT NULL,
    [method]            VARCHAR (20)   NOT NULL,
    [header]            VARCHAR (4000) NULL,
    [body]              VARCHAR (MAX)  NULL,
    [expected_response] VARCHAR (MAX)  NOT NULL,
    CONSTRAINT [PK_integration_tests] PRIMARY KEY CLUSTERED ([test_id] ASC)
);

