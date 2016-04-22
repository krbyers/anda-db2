/*\
AUTHOR:Ken Byers - 4-7-2016
REWRITE
EXEC dbo.refresh_inventory_FPIVTQUE
\*/
CREATE PROCEDURE [dbo].[refresh_inventory_FPIVTQUE]
AS
BEGIN
	SET NOCOUNT ON;


	RAISERROR (
	'Starting process....'
	,0
	,1
	)
	WITH NOWAIT;



	-- Store new items into history
	insert into [foundation].[dbo].[FPIVTQUE_HISTORY] ( [inventory_message], [IVITM#], [IVWHSE], [version_time] )
	SELECT [inventory_message]
	,      [IVITM#]
	,      [IVWHSE]
	,      [version_time]
	FROM [foundation].[dbo].[FPIVTQUE]

	-- delete anything in the *fresh* inventory image.
	TRUNCATE TABLE dbo.FPIVTQUE; --- Truncate the local history table.

	-- Insert everything into the the local copy of the item query table from the iSeries
	INSERT dbo.FPIVTQUE ( IVITM#, IVWHSE )
	EXEC ('SELECT DISTINCT IVITM#, IVWHSE FROM JMATZ.FPIVTQUE WHERE IVWHSE <> 0') AT TPS;
	EXEC ('DELETE FROM JMATZ.FPIVTQUE') AT TPS;

	-- Create a cursor on the distinct rows in the item event table
	DECLARE inv_queueevent CURSOR FOR
	SELECT DISTINCT IVITM#
	,               IVWHSE
	FROM dbo.FPIVTQUE


	DECLARE @item_num decimal(6,0)
	DECLARE @whs_num decimal(2,0)
	OPEN inv_queueevent
	FETCH NEXT FROM inv_queueevent INTO @item_num, @whs_num
	WHILE @@FETCH_STATUS = 0
	BEGIN

		RAISERROR (
		'Processing row...'
		,0
		,1
		)
		WITH NOWAIT;

		DELETE dbo.FPITMBRS
		FROM dbo.FPITMBRS AS REF
		WHERE REF.IRITEM = @item_num and REF.IRWHSE = @whs_num

		INSERT INTO dbo.FPITMBRS ( IRITEM, IRWHSE, IRCTYP, IRQHRS, IRONLY, IRBYLM )
		EXEC('SELECT REF.IRITEM
	    ,      REF.IRWHSE
	    ,      REF.IRCTYP
	    ,      REF.IRQHRS
	    ,      REF.IRONLY
	    ,      REF.IRBYLM
	    FROM FPITMBRS AS REF 
		    WHERE REF.IRITEM = ?and REF.IRWHSE = ?', @item_num, @whs_num) AT TPS;


		DELETE dbo.FPITMBAL
		FROM dbo.FPITMBAL AS REF
		WHERE REF.IBITEM = @item_num and REF.IBWHSE = @whs_num

		INSERT INTO dbo.FPITMBAL ( IBITEM, IBWHSE, IBBUYR, IBBYRC, IBPICY, IBCULI, IBQHAW, IBQHAV, IBQHRS, IBQHSP, IBQMIP, IBQBAK, IBQONO, IBQTRI, IBQTRO, IBCMAV, IBCMRS, IBCMBK, IBTCMA, IBTCMR, IBQTRV, IBQCRV, IBQORV, IBQASC, IBSQOP, IBQOHB, IBQOHA, IBLRDT, IBNRDT, IBLSDT, IBLCDT, IBLPDT, IBLTDT, IBFPDT, IBFCDT, IBLIDT, IBINVT, IBFAST, IBAWC, [IBLFO$], IBLFOD, IBREOP, IBEOQ, IBABCC, IBSVCL, IBBUYF, IBSFST, IBPRDM, IBLSWP, IBLTDM, IBLTP, IBPRLT, IBABLD, IBLTLD, IBPDLD, IBRPLD, IBLSLD )
		EXEC('SELECT IBITEM
	,      IBWHSE
	,      IBBUYR
	,      IBBYRC
	,      IBPICY
	,      IBCULI
	,      IBQHAW
	,      IBQHAV
	,      IBQHRS
	,      IBQHSP
	,      IBQMIP
	,      IBQBAK
	,      IBQONO
	,      IBQTRI
	,      IBQTRO
	,      IBCMAV
	,      IBCMRS
	,      IBCMBK
	,      IBTCMA
	,      IBTCMR
	,      IBQTRV
	,      IBQCRV
	,      IBQORV
	,      IBQASC
	,      IBSQOP
	,      IBQOHB
	,      IBQOHA
	,      IBLRDT
	,      IBNRDT
	,      IBLSDT
	,      IBLCDT
	,      IBLPDT
	,      IBLTDT
	,      IBFPDT
	,      IBFCDT
	,      IBLIDT
	,      IBINVT
	,      IBFAST
	,      IBAWC
	,      IBLFO$
	,      IBLFOD
	,      IBREOP
	,      IBEOQ
	,      IBABCC
	,      IBSVCL
	,      IBBUYF
	,      IBSFST
	,      IBPRDM
	,      IBLSWP
	,      IBLTDM
	,      IBLTP
	,      IBPRLT
	,      IBABLD
	,      IBLTLD
	,      IBPDLD
	,      IBRPLD
	,      IBLSLD
	FROM FPITMBAL AS REF
		    WHERE REF.IBITEM = ?and REF.IBWHSE = ?', @item_num, @whs_num) AT TPS


		DELETE dbo.FPWHLDTL
		FROM dbo.FPWHLDTL AS REF
		WHERE REF.WDITEM = @item_num and REF.WDLOC = @whs_num

		INSERT INTO dbo.FPWHLDTL ( WDLOC, WDZONE, WDAISL, WDBAY, WDTIER, WDBIN, WDITEM, WDDATE, WDTIME, WDQTYA, WDATYP, WDDSPY, WDOLOC, WDSTAT, WDUSET, WDRTYP, WDVNDN, WDPO#, WDLOT, WDEXPD, WDCRUP, WDVEXP )
		EXEC('SELECT WDLOC
	,      WDZONE
	,      WDAISL
	,      WDBAY
	,      WDTIER
	,      WDBIN
	,      WDITEM
	,      WDDATE
	,      WDTIME
	,      WDQTYA
	,      WDATYP
	,      WDDSPY
	,      WDOLOC
	,      WDSTAT
	,      WDUSET
	,      WDRTYP
	,      WDVNDN
	,      WDPO#
	,      WDLOT
	,      WDEXPD
	,      WDCRUP
	,      WDVEXP
	FROM FPWHLDTL AS REF

	WHERE REF.WDITEM = ?and REF.WDLOC = ?', @item_num, @whs_num) AT TPS;

		FETCH NEXT FROM inv_queueevent INTO @item_num, @whs_num

	END

	CLOSE inv_queueevent;
	DEALLOCATE inv_queueevent;

	MERGE dbo.item_balances AS target

	USING (SELECT *
	FROM       dbo.item_balances_seed v
	INNER JOIN dbo.FPIVTQUE           q ON CAST(q.IVITM# AS VARCHAR(6)) = v.item_num AND CAST(q.IVWHSE AS VARCHAR(2)) = v.warehouse_num
	) AS source

	ON (target.item_num = source.item_num AND target.warehouse_num = source.warehouse_num AND ISNULL(target.customer_type,0) = ISNULL(source.customer_type,0))

	WHEN MATCHED THEN

	UPDATE
	SET open_quantity_present                   = source.open_quantity_present
	,   reserved_quantity_present               = source.reserved_quantity_present
	,   customer_type_reserved_quantity_present = source.customer_type_reserved_quantity_present
	,   use_only_customer_reserve               = source.use_only_customer_reserve

	WHEN NOT MATCHED BY target THEN

	INSERT
	(item_num,
	warehouse_num,
	customer_type,
	open_quantity_present,
	reserved_quantity_present,
	customer_type_reserved_quantity_present,
	use_only_customer_reserve)
	VALUES
	(source.item_num,
	source.warehouse_num,
	source.customer_type,
	source.open_quantity_present,
	source.reserved_quantity_present,
	source.customer_type_reserved_quantity_present,
	source.use_only_customer_reserve);



END
