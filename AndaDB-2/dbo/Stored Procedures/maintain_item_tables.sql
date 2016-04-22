/*\
Author: Matt Miller, Ken Byers 4/3/2016

EXEC dbo.maintain_item_tables 319713
\*/
CREATE PROCEDURE [dbo].[maintain_item_tables] @item_number bigint
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @count_FPITMSUB BIGINT
	DECLARE @count_FPITMMAS BIGINT
	DECLARE @count_FLITMSUB BIGINT
	DECLARE @count_FPSUBITM BIGINT


	IF NOT EXISTS (SELECT *
		FROM dbo.FPITMSUB
		WHERE I@NMBR = @item_number)
		DELETE FROM dbo.FPITMSUB
		WHERE I@NMBR = @item_number;

	IF NOT EXISTS (SELECT *
		FROM dbo.FPITMMAS
		WHERE ITMNUM = @item_number)
		DELETE FROM dbo.FPITMMAS
		WHERE ITMNUM = @item_number;

	IF NOT EXISTS (SELECT *
		FROM dbo.FLITMSUB
		WHERE IINMBR = @item_number)
		DELETE FROM dbo.FLITMSUB
		WHERE IINMBR = @item_number;

	IF NOT EXISTS (SELECT *
		FROM dbo.FPSUBITM
		WHERE SIITEM = @item_number)
		DELETE FROM dbo.FPSUBITM
		WHERE SIITEM = @item_number;

	INSERT INTO dbo.FPITMSUB ( I@NMBR, I@DGRT, I@MINO, I@HAZM, I@SPYN, I@SMFG, I@FORM, I@LMTU, I@LMTP, I@ADSC, I@HZMX, I@SHDT, I@OVCG, I@PLCT, I@CNTP, I@DOSE, I@MDL, I@VCTX, I@FGEL, I@BDNM, I@CCFQ, I@CHFM, I@ACFM, I@ORET, I@MFCN, I@SLBN, I@MNQT, I@CNTY, I@SDRT, I@RSRV, I@RGFM, I@ONFM, I@WKEY, I@GTIN, I@LNAM, I@SPLM, I@SPLA, I@MCRD, I@TOPP, I@PCNM, I@SPEC, I@IMS, I@CONT, I@SPRT, I@OVRLMT, I@AITEM1, I@AITEM2, I@FLAG1, I@FLAG2, I@MDOH, I@PRLK, I@CATG, I@SEG1, I@SEG2, I@NORW )
	EXEC ('SELECT  I@NMBR,
            I@DGRT,
            I@MINO,
            I@HAZM,
            I@SPYN,
            I@SMFG,
            I@FORM,
            I@LMTU,
            I@LMTP,
            I@ADSC,
            I@HZMX,
            I@SHDT,
            I@OVCG,
            I@PLCT,
            I@CNTP,
            I@DOSE,
            I@MDL,
            I@VCTX,
            I@FGEL,
            I@BDNM,
            I@CCFQ,
            I@CHFM,
            I@ACFM,
            I@ORET,
            I@MFCN,
            I@SLBN,
            I@MNQT,
            I@CNTY,
            I@SDRT,
            I@RSRV,
            I@RGFM,
            I@ONFM,
            I@WKEY,
            I@GTIN,
            I@LNAM,
            I@SPLM,
            I@SPLA,
            I@MCRD,
            I@TOPP,
            I@PCNM,
            I@SPEC,
            I@IMS,
            I@CONT,
            I@SPRT,
            I@OVRLMT,
            I@AITEM1,
            I@AITEM2,
            I@FLAG1,
            I@FLAG2,
            I@MDOH,
            I@PRLK,
            I@CATG,
            I@SEG1,
            I@SEG2,
            I@NORW
    FROM    FPITMSUB
    WHERE   I@NMBR = ?', @item_number) AT TPS;

	INSERT INTO dbo.FPITMMAS ( ITMNUM, ITSTAT, ITDLD, ITINVT, ITINVC, ITSPCG, ITDESC, ITSDES, ITQUAL, ITQULD, ITGNRC, ITGNSR, ITSIZE, ITFORM, ITFLNE, ITFLSN, ITVNDN, ITVSUF, ITVNSO, ITVNSR, ITYNDC, ITNWTT, ITNLBL, ITUDOS, ITMMIC, ITBALW, ITCNVT, ITCVNB, ITCOMM, ITVQDE, ITOV12, ITOV1, ITLRQE, ITFSIN, ITSSIN, ITRPSI, ITPUML, ITVQD, ITGLIN, ITGLSL, ITGLCS, ITSHGT, ITSLGN, ITSWTH, ITSWGT, ITPHGT, ITPLGN, ITPWTH, ITPWGT, ITMNRC, ITREFG, ITMSPH, ITWLFS, ITWLFN, ITMDS1, ITMDN1, ITMCDP, ITMNDC, ITNDCI, ITNDCP, ITNHRC, ITMUPC, ITUPCI, ITUPCP, ITMSCN, ITSCNI, ITSCNP, ITRX, ITRXDS, ITREST, ITSPLT, ITMSTK, ITSUOM, ITSMPK, ITPUOM, ITSINP, ITMUOM, ITSINM, ITMOQ, ITPMPQ, ITLOTC, ITRPLC, ITRPLP, ITAVWC, ITNETP, ITAWP, ITMNPQ, ITNBC, ITNSC, ITSRP, ITSTTX, ITMTCS, ITLBCS, ITFBCS, ITVBCS, ITICCS, ITSPPM, ITPCST, ITPSLP, ITPSDT, ITPEDT, ITPRDT, ITPALW, ITPAMQ, ITPASD, ITPAED, ITPDPC, ITPQFR, ITPQTY, ITSPCD, ITLPOD, ITLRCD, ITLSAD, ITLADT, ITGNCD, ITGNPI, ITGNTC, ITBARC, ITPBCL, ITBCLT, ITMGRM )
	EXEC('SELECT  ITMNUM,
            ITSTAT,
            ITDLD,
            ITINVT,
            ITINVC,
            ITSPCG,
            ITDESC,
            ITSDES,
            ITQUAL,
            ITQULD,
            ITGNRC,
            ITGNSR,
            ITSIZE,
            ITFORM,
            ITFLNE,
            ITFLSN,
            ITVNDN,
            ITVSUF,
            ITVNSO,
            ITVNSR,
            ITYNDC,
            ITNWTT,
            ITNLBL,
            ITUDOS,
            ITMMIC,
            ITBALW,
            ITCNVT,
            ITCVNB,
            ITCOMM,
            ITVQDE,
            ITOV12,
            ITOV1,
            ITLRQE,
            ITFSIN,
            ITSSIN,
            ITRPSI,
            ITPUML,
            ITVQD,
            ITGLIN,
            ITGLSL,
            ITGLCS,
            ITSHGT,
            ITSLGN,
            ITSWTH,
            ITSWGT,
            ITPHGT,
            ITPLGN,
            ITPWTH,
            ITPWGT,
            ITMNRC,
            ITREFG,
            ITMSPH,
            ITWLFS,
            ITWLFN,
            ITMDS1,
            ITMDN1,
            ITMCDP,
            ITMNDC,
            ITNDCI,
            ITNDCP,
            ITNHRC,
            ITMUPC,
            ITUPCI,
            ITUPCP,
            ITMSCN,
            ITSCNI,
            ITSCNP,
            ITRX,
            ITRXDS,
            ITREST,
            ITSPLT,
            ITMSTK,
            ITSUOM,
            ITSMPK,
            ITPUOM,
            ITSINP,
            ITMUOM,
            ITSINM,
            ITMOQ,
            ITPMPQ,
            ITLOTC,
            ITRPLC,
            ITRPLP,
            ITAVWC,
            ITNETP,
            ITAWP,
            ITMNPQ,
            ITNBC,
            ITNSC,
            ITSRP,
            ITSTTX,
            ITMTCS,
            ITLBCS,
            ITFBCS,
            ITVBCS,
            ITICCS,
            ITSPPM,
            ITPCST,
            ITPSLP,
            ITPSDT,
            ITPEDT,
            ITPRDT,
            ITPALW,
            ITPAMQ,
            ITPASD,
            ITPAED,
            ITPDPC,
            ITPQFR,
            ITPQTY,
            ITSPCD,
            ITLPOD,
            ITLRCD,
            ITLSAD,
            ITLADT,
            ITGNCD,
            ITGNPI,
            ITGNTC,
            ITBARC,
            ITPBCL,
            ITBCLT,
            ITMGRM
    FROM    FPITMMAS
    WHERE   ITMNUM = ?', @item_number) AT TPS;

	INSERT INTO dbo.FLITMSUB ( IINMBR, IIDGRT, IIMINO, IIHAZM, IISPYN, IISMFG, IIFORM, IILMTU, IILMTP, IIADSC, IIHZMX, IISHDT, IIOVCG, IIPLCT, IICNTP, IIDOSE, IIMDL, IIVCTX, IIFGEL, IIBDNM, IICCFQ, IICHFM, IIACFM, IIORET, IIMFCN, IISLBN, IIMNQT, IICNTY, IISDRT, IIRSRV, IIRGFM, IIONFM, IIWKEY, IIGTIN, IILNAM, IISPLM, IISPLA, IIMCRD, IITOPP, IIPCNM, IISPEC, IIIMS, IICONT, I@SPRT, IIOVRLMT, IIAITEM1, IIAITEM2, IIFLAG1, IIFLAG2, IIMDOH, IIPRLK, IICATG, IISEG1, IISEG2, IINORW )
	EXEC ('SELECT  IINMBR,
            IIDGRT,
            IIMINO,
            IIHAZM,
            IISPYN,
            IISMFG,
            IIFORM,
            IILMTU,
            IILMTP,
            IIADSC,
            IIHZMX,
            IISHDT,
            IIOVCG,
            IIPLCT,
            IICNTP,
            IIDOSE,
            IIMDL,
            IIVCTX,
            IIFGEL,
            IIBDNM,
            IICCFQ,
            IICHFM,
            IIACFM,
            IIORET,
            IIMFCN,
            IISLBN,
            IIMNQT,
            IICNTY,
            IISDRT,
            IIRSRV,
            IIRGFM,
            IIONFM,
            IIWKEY,
            IIGTIN,
            IILNAM,
            IISPLM,
            IISPLA,
            IIMCRD,
            IITOPP,
            IIPCNM,
            IISPEC,
            IIIMS,
            IICONT,
            I@SPRT,
            IIOVRLMT,
            IIAITEM1,
            IIAITEM2,
            IIFLAG1,
            IIFLAG2,
            IIMDOH,
            IIPRLK,
            IICATG,
            IISEG1,
            IISEG2,
            IINORW
    FROM    CIGFTEST.FLITMSUB
    WHERE   IINMBR = ?', @item_number) AT TPS;

	INSERT INTO dbo.FPSUBITM ( SITYPE, SICUST, SIITEM, SISEQ, SISITM, SIITMR, SIPROR, SISTAT, SIADAT, SIMDAT, SIMTIM, SIMUSR )
	EXEC ('SELECT  SITYPE,
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
    FROM    FPSUBITM
    WHERE   SIITEM = ?', @item_number) AT TPS;

	---- An item should have records in all four tables. The transaction still proceeds so that tables reflect latest iSeries data.
	--SELECT @count_FPITMSUB = COUNT(*)
	--FROM dbo.FPITMSUB
	--WHERE I@NMBR = @item_number;
	SELECT @count_FPITMMAS = COUNT(*)
	FROM dbo.FPITMMAS
	WHERE ITMNUM = @item_number;
	--SELECT @count_FLITMSUB = COUNT(*)
	--FROM dbo.FLITMSUB
	--WHERE IINMBR = @item_number;
	--SELECT @count_FPSUBITM = COUNT(*)
	--FROM dbo.FPSUBITM
	--WHERE SIITEM = @item_number;

	IF @count_FPITMMAS >= 1
		SELECT TOP 1 *
		FROM dbo.item_masters
		WHERE item_num = @item_number
	ELSE
		SELECT NULL
END;
