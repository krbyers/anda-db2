﻿

CREATE PROCEDURE util_getFoundationRecordCounts
as 

SELECT COUNT(*) AS FLITMSUB FROM dbo.FLITMSUB
SELECT COUNT(*) AS FLCUSSUB FROM dbo.FLCUSSUB
SELECT COUNT(*) AS FPCUSMAS FROM dbo.FPCUSMAS
SELECT COUNT(*) AS FPCUSSB2 FROM dbo.FPCUSSB2
SELECT COUNT(*) AS FPITMBAL FROM dbo.FPITMBAL
SELECT COUNT(*) AS FPITMBRS FROM dbo.FPITMBRS
SELECT COUNT(*) AS FPITMMAS FROM dbo.FPITMMAS
SELECT COUNT(*) AS FPITMSUB FROM dbo.FPITMSUB
SELECT COUNT(*) AS FPITWREC FROM dbo.FPITWREC
SELECT COUNT(*) AS FPIVTQUE FROM dbo.FPIVTQUE
SELECT COUNT(*) AS FPLOCSUB FROM dbo.FPLOCSUB
SELECT COUNT(*) AS FPORDDTL FROM dbo.FPORDDTL
SELECT COUNT(*) AS FPORDHDR FROM dbo.FPORDHDR
SELECT COUNT(*) AS FPPGMDTA FROM dbo.FPPGMDTA
SELECT COUNT(*) AS FPSUBITM FROM dbo.FPSUBITM
SELECT COUNT(*) AS FPWHLDTL FROM dbo.FPWHLDTL
SELECT COUNT(*) AS FPLOCMST FROM dbo.FPLOCMST


EXEC('SELECT COUNT(*) AS FLITMSUB FROM CIGFTEST.FLITMSUB') AT TPS
EXEC('SELECT COUNT(*) AS FLCUSSUB FROM CIGFTEST.FLCUSSUB') AT TPS
EXEC('SELECT COUNT(*) AS FPCUSMAS FROM FPCUSMAS') AT TPS
EXEC('SELECT COUNT(*) AS FPCUSSB2 FROM FPCUSSB2') AT TPS
EXEC('SELECT COUNT(*) AS FPITMBAL FROM FPITMBAL') AT TPS
EXEC('SELECT COUNT(*) AS FPITMBRS FROM FPITMBRS') AT TPS
EXEC('SELECT COUNT(*) AS FPITMMAS FROM FPITMMAS') AT TPS
EXEC('SELECT COUNT(*) AS FPITMSUB FROM FPITMSUB') AT TPS
EXEC('SELECT COUNT(*) AS FPITWREC FROM FPITWREC') AT TPS
EXEC('SELECT COUNT(*) AS FPIVTQUE FROM FPIVTQUE') AT TPS
EXEC('SELECT COUNT(*) AS FPLOCSUB FROM FPLOCSUB') AT TPS
EXEC('SELECT COUNT(*) AS FPORDDTL FROM FPORDDTL') AT TPS
EXEC('SELECT COUNT(*) AS FPORDHDR FROM FPORDHDR') AT TPS
EXEC('SELECT COUNT(*) AS FPPGMDTA FROM AGID06USR.FPPGMDTA') AT TPS
EXEC('SELECT COUNT(*) AS FPSUBITM FROM FPSUBITM') AT TPS
EXEC('SELECT COUNT(*) AS FPWHLDTL FROM FPWHLDTL') AT TPS
EXEC('SELECT COUNT(*) AS FPLOCMST FROM FPLOCMST') AT TPS