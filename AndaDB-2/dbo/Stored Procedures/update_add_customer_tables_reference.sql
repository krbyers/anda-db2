/*\
Author: Author: Matt Miller, Ken Byers 4/3/2016
EXEC dbo.update_add_customer_tables_reference 87667
\*/
CREATE PROCEDURE [dbo].[update_add_customer_tables_reference] @customer_number bigint
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @count_FPCUSMAS BIGINT
	DECLARE @count_FLCUSSUB BIGINT
	DECLARE @count_FPCUSSB2 BIGINT

	---- Check and purge.
	IF EXISTS (SELECT *
		FROM dbo.FPCUSMAS
		WHERE CNUMBR = @customer_number)
		DELETE FROM dbo.FPCUSMAS
		WHERE CNUMBR = @customer_number;

	IF EXISTS (SELECT *
		FROM dbo.FLCUSSUB
		WHERE CCNMBR = @customer_number)
		DELETE FROM dbo.FLCUSSUB
		WHERE CCNMBR = @customer_number;

	IF EXISTS (SELECT *
		FROM dbo.FPCUSSB2
		WHERE C2NMBR = @customer_number)
		DELETE FROM dbo.FPCUSSB2
		WHERE C2NMBR = @customer_number;

	--- Insert section using linked server. Must be modified to use correct library. FLCUSSUB view must be promoted from CIGLC to correct library.
	INSERT INTO dbo.FPCUSSB2 ( C2NMBR, C2SHWS, C2SHW2, C2SHW3, C2TCLS, C2BGRP, C2BGID, C2CHID, C2CSID, C2SATD, C2MEID, C2TERR, C2PDEC, C2PSLS, C2ADSC, C2VIP#, C2SISC, C2ABC, C2PDSC, C2AFFL, C2DOVR, C2SOVR, C2SCPD, C2SPCR, C2EDG1, C2EDG2, C2NAME, C2OTCS, C2REBT, C2FAXS, C2MFOP, C2MFCL, C2SAOP, C2SACL, C2APH1, C2APH2, C2MDLO, C2FRTP, C2CATG, C2CDSC, C2CPDY, C2FPED, C2FGVL, C2FGPC, C2RMID, C2HAY#, C2DEA#, C2DEEX, C2RBCK, C2RCAC, C2BYCR, C2TCLT, C2QTDS, C2FXSC, C2PVID, C2340B, C2GPO, C2INCC, C2ISAC, C2EXAC, C2PDAM, C2NPI, C2GLN, C2PRAS, C2ACSF, C2CTCL, C2QEST, C2QDAT, C2FXSD, C2RFXA, C2RFXE, C2RFXN, C2STRG, C2SREX, C2SITC, C2WEBST, C2CTFG, C2CTDT, C2DSFG, C2DSDT, C2STYP, C2OLDT, C2SHC1, C2SHC2, C2SHC3, C2RCEM, C2RCPF, C2DTE1, C2DTE3, C21BK1, C21BK2, C21BK3, C22BK1, C22BK2, C22BK3, C23BK1, C23BK2, C23BK3, C24BK1, C24BK2, C24BK3, C26NM1, C26NM2, C26NM3, C2FID )
	EXEC('SELECT  C2NMBR,
            C2SHWS,
            C2SHW2,
            C2SHW3,
            C2TCLS,
            C2BGRP,
            C2BGID,
            C2CHID,
            C2CSID,
            C2SATD,
            C2MEID,
            C2TERR,
            C2PDEC,
            C2PSLS,
            C2ADSC,
            C2VIP#,
            C2SISC,
            C2ABC,
            C2PDSC,
            C2AFFL,
            C2DOVR,
            C2SOVR,
            C2SCPD,
            C2SPCR,
            C2EDG1,
            C2EDG2,
            C2NAME,
            C2OTCS,
            C2REBT,
            C2FAXS,
            C2MFOP,
            C2MFCL,
            C2SAOP,
            C2SACL,
            C2APH1,
            C2APH2,
            C2MDLO,
            C2FRTP,
            C2CATG,
            C2CDSC,
            C2CPDY,
            C2FPED,
            C2FGVL,
            C2FGPC,
            C2RMID,
            C2HAY#,
            C2DEA#,
            C2DEEX,
            C2RBCK,
            C2RCAC,
            C2BYCR,
            C2TCLT,
            C2QTDS,
            C2FXSC,
            C2PVID,
            C2340B,
            C2GPO,
            C2INCC,
            C2ISAC,
            C2EXAC,
            C2PDAM,
            C2NPI,
            C2GLN,
            C2PRAS,
            C2ACSF,
            C2CTCL,
            C2QEST,
            C2QDAT,
            C2FXSD,
            C2RFXA,
            C2RFXE,
            C2RFXN,
            C2STRG,
            C2SREX,
            C2SITC,
            C2WEBST,
            C2CTFG,
            C2CTDT,
            C2DSFG,
            C2DSDT,
            C2STYP,
            C2OLDT,
            C2SHC1,
            C2SHC2,
            C2SHC3,
            C2RCEM,
            C2RCPF,
            C2DTE1,
            C2DTE3,
            C21BK1,
            C21BK2,
            C21BK3,
            C22BK1,
            C22BK2,
            C22BK3,
            C23BK1,
            C23BK2,
            C23BK3,
            C24BK1,
            C24BK2,
            C24BK3,
            C26NM1,
            C26NM2,
            C26NM3,
            C2FID
    FROM    FPCUSSB2
    WHERE   C2NMBR = ?', @customer_number) AT TPS;

	INSERT INTO dbo.FLCUSSUB ( CCNMBR, CCODED, CCGLSL, CCGLCS, CCSTYP, CCVAIN, CCCODP, CCBILL, CCBLCS, CCINYN, CCBTYP, CCRCNM, CCOFFP, CCODAY, CCOEXP, CCABCD, CCKYAC, CCVOLD, CCCYYN, CCCCGP, CCFORM, CCADDD, CCMNTD, CCEMAL, CCDP4N, [CCIMH$], CCBMEX, CCACPR )
	EXEC('SELECT  CCNMBR,
            CCODED,
            CCGLSL,
            CCGLCS,
            CCSTYP,
            CCVAIN,
            CCCODP,
            CCBILL,
            CCBLCS,
            CCINYN,
            CCBTYP,
            CCRCNM,
            CCOFFP,
            CCODAY,
            CCOEXP,
            CCABCD,
            CCKYAC,
            CCVOLD,
            CCCYYN,
            CCCCGP,
            CCFORM,
            CCADDD,
            CCMNTD,
            CCEMAL,
            CCDP4N,
            CCIMH$,
            CCBMEX,
            CCACPR
    FROM    CIGFTEST.FLCUSSUB
    WHERE   CCNMBR = ?', @customer_number) AT TPS;

	INSERT INTO dbo.FPCUSMAS ( CNUMBR, CLNAME, CAHEAD, CSTRET, CCTOWN, CSTATE, CZIP, CSALSR, CSRNAM, CSRCTN, CSMAIL, CCTYCD, CCNTRY, CCONTY, CTERRY, CREGN, CSTUS, CCRSTS, CCHIER, CBILTO, CSLTX#, CSTEXP, CSINST, CSRRTN, CSARTL, CLPCD, CLPPCT, CLPDFT, CLDFTP, CLDFTA, CSPCD, CCPDSC, CPMCD, CSACST, CSCRLM, CSPORQ, CSDSAC, CSTXEM, CSBACK, CCOMDF, CSSPLT, CSISEQ, CSACCD, CSBLST, CSSPEC, CSBEST, CSMNDV, CSIVDP, CSCHDP, CSLSMN, CSCMDP, [CSADD$], CSTREG, CSREXP, CDEA#, CDEEXP, CSHIN#, CLAB1, CLAB2, CSTXT1, CSTXT2, CSTXT3, CSPHNA, CSPHNE, CSPHNN, CSFAXA, CSFAXE, CSFAXN, CSRCNM, CSRCEX, CSCHLD, CVLCTY, CSSTAX, CSLTX1, CSLTX2, CSAUTP, CSAUEX, CSPSPW, CSCAR#, CSPREF, CSLADT, CTYPE, CSBSTY, CSACTY, CSOMIT, CBONLY, C1IOD, CSPHRM, C1COD, CSSUB, CSRPCK, CSREST, CSDUPI, CSSHPL, CSPARS, CSPRCL, CARGL, CSCDS#, CSLBL#, CSOID#, CSROE#, CSSDS#, CREMIT, CSANL1, CSANL2, CPRAWP, CMSIFL, CMSISR, CSPCOC, CSPDOC, CSBLOC, CSSRX, CSSOTC, CSRXSL, CSOTSL, CSGNSB, CSGNPF, CSGNDS, CSBOMG, CSEDI1, CSEDI2, CSLSDT, CSOTSC, CSOTPD, CSRBTC, CSSPDM, CSEDII, CSEDIP, CSCONF, CSCFDT, CSMXLB, CSMGRM, CSSGRM )
	EXEC('SELECT  CNUMBR,
            CLNAME,
            CAHEAD,
            CSTRET,
            CCTOWN,
            CSTATE,
            CZIP,
            CSALSR,
            CSRNAM,
            CSRCTN,
            CSMAIL,
            CCTYCD,
            CCNTRY,
            CCONTY,
            CTERRY,
            CREGN,
            CSTUS,
            CCRSTS,
            CCHIER,
            CBILTO,
            CSLTX#,
            CSTEXP,
            CSINST,
            CSRRTN,
            CSARTL,
            CLPCD,
            CLPPCT,
            CLPDFT,
            CLDFTP,
            CLDFTA,
            CSPCD,
            CCPDSC,
            CPMCD,
            CSACST,
            CSCRLM,
            CSPORQ,
            CSDSAC,
            CSTXEM,
            CSBACK,
            CCOMDF,
            CSSPLT,
            CSISEQ,
            CSACCD,
            CSBLST,
            CSSPEC,
            CSBEST,
            CSMNDV,
            CSIVDP,
            CSCHDP,
            CSLSMN,
            CSCMDP,
            CSADD$,
            CSTREG,
            CSREXP,
            CDEA#,
            CDEEXP,
            CSHIN#,
            CLAB1,
            CLAB2,
            CSTXT1,
            CSTXT2,
            CSTXT3,
            CSPHNA,
            CSPHNE,
            CSPHNN,
            CSFAXA,
            CSFAXE,
            CSFAXN,
            CSRCNM,
            CSRCEX,
            CSCHLD,
            CVLCTY,
            CSSTAX,
            CSLTX1,
            CSLTX2,
            CSAUTP,
            CSAUEX,
            CSPSPW,
            CSCAR#,
            CSPREF,
            CSLADT,
            CTYPE,
            CSBSTY,
            CSACTY,
            CSOMIT,
            CBONLY,
            C1IOD,
            CSPHRM,
            C1COD,
            CSSUB,
            CSRPCK,
            CSREST,
            CSDUPI,
            CSSHPL,
            CSPARS,
            CSPRCL,
            CARGL,
            CSCDS#,
            CSLBL#,
            CSOID#,
            CSROE#,
            CSSDS#,
            CREMIT,
            CSANL1,
            CSANL2,
            CPRAWP,
            CMSIFL,
            CMSISR,
            CSPCOC,
            CSPDOC,
            CSBLOC,
            CSSRX,
            CSSOTC,
            CSRXSL,
            CSOTSL,
            CSGNSB,
            CSGNPF,
            CSGNDS,
            CSBOMG,
            CSEDI1,
            CSEDI2,
            CSLSDT,
            CSOTSC,
            CSOTPD,
            CSRBTC,
            CSSPDM,
            CSEDII,
            CSEDIP,
            CSCONF,
            CSCFDT,
            CSMXLB,
            CSMGRM,
            CSSGRM
    FROM    FPCUSMAS
    WHERE   CNUMBR = ?', @customer_number) AT TPS;

	---- Did it all work? Need a record in each table.
	SET @count_FPCUSMAS = 0;

	SET @count_FLCUSSUB = 0;

	SET @count_FPCUSSB2 = 0;

	---- A customer should have records in all three tables. The transaction still proceeds so that tables reflect latest iSeries data.
	SELECT @count_FPCUSMAS = COUNT(*)
	FROM dbo.FPCUSMAS
	WHERE CNUMBR = @customer_number;

	SELECT @count_FLCUSSUB = COUNT(*)
	FROM dbo.FLCUSSUB
	WHERE CCNMBR = @customer_number;

	SELECT @count_FPCUSSB2 = COUNT(*)
	FROM dbo.FPCUSSB2
	WHERE C2NMBR = @customer_number;

	IF @count_FPCUSMAS + @count_FLCUSSUB + @count_FPCUSSB2 = 3
		SELECT TOP 1 *
		FROM dbo.customers
		WHERE customer_num = @customer_number
	ELSE
		SELECT NULL

END
