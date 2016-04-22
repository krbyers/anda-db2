/*\
EXEC dbo.maintain_fpsubitm_reference_copy 319713
\*/
CREATE PROCEDURE dbo.maintain_fpsubitm_reference_copy
    @item_number DECIMAL(6,0)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT * FROM dbo.FPSUBITM WHERE SIITEM = @item_number)
        DELETE FROM dbo.FPSUBITM WHERE SIITEM = @item_number;

    INSERT  
    INTO    dbo.FPSUBITM (
            SITYPE,
            SICUST,
            SIITEM,
            SISEQ,
            SISITM,
            SIITMR,
            SIPROR,
            SISTAT,
            SIADAT,
            SIMDAT,
            SIMTIM,
            SIMUSR
    )
    SELECT  SITYPE,
            SICUST,
            SIITEM,
            SISEQ,
            SISITM,
            SIITMR,
            SIPROR,
            SISTAT,
            SIADAT,
            SIMDAT,
            SIMTIM,
            SIMUSR
    FROM    TPS.ANDRXTST.AGID06LIB.FPSUBITM
    WHERE   SIITEM = @item_number;
END;
