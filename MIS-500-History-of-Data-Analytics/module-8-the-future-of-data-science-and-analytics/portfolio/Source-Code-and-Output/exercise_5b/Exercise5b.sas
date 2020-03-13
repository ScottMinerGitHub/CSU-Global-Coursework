/**********************************************************************************

DESCRIPTION:  THIS PROGRAM ILLUSTRATES HOW TO CONSTRUCT INSURANCE STATUS VARIABLES FROM
<<<<<<< HEAD
MONTHLY INSURANCE VARIABLES (see below) IN THE PERSON-LEVEL DATA
=======
              MONTHLY INSURANCE VARIABLES (see below) IN THE PERSON-LEVEL DATA
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9

TRImm15X   Covered by TRICARE/CHAMPVA in mm (Ed)
MCRmm15    Covered by Medicare in mm
MCRmm15X   Covered by Medicare in mm (Ed)
MCDmm15    Covered by Medicaid or SCHIP in mm
MCDmm15X   Covered by Medicaid or SCHIP in mm  (Ed)
OPAmm15    Covered by Other Public A Ins in mm
OPBmm15    Covered by Other Public B Ins in mm
PUBmm15X   Covered by Any Public Ins in mm (Ed)
PEGmm15    Covered by Empl Union Ins in mm
PDKmm15    Coverer by Priv Ins (Source Unknown) in mm
PNGmm15    Covered by Nongroup Ins in mm
POGmm15    Covered by Other Group Ins in mm
PRSmm15    Covered by Self-Emp Ins in mm
POUmm15    Covered by Holder Outside of RU in mm
PRImm15    Covered by Private Ins in mm

where mm = JA-DE  (January - December)

INPUT FILE:   C:\MEPS\SAS\DATA\H181.SAS7BDAT (2015 FY PUF DATA)

<<<<<<< HEAD
 *********************************************************************************/;
OPTIONS NODATE NONUMBER PAGESIZE=200 FORMCHAR="|----|+|---+=|-/\<>*";

/* Update log and print output information based on exercise # */ 	
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=5b;
%LET logFolderOutput=&folderPath.&exerciseNumber/my-output/;
=======
*********************************************************************************/;
/* Update log and print output information based on exercise # */ 	
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=5b;   
%LET logFolderOutput=&folderPath.&exerciseNumber/my-output/;
OPTIONS LINESIZE=160 PAGESIZE=79 NODATE FORMCHAR="|----|+|---+=|-/\<>*" PAGENO=1;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
FILENAME MYLOG "&logFolderOutput\Exercise&exerciseNumber._log.TXT";
FILENAME MYPRINT "&logFolderOutput\Exercise&exerciseNumber._OUTPUT.TXT";

PROC PRINTTO LOG=MYLOG PRINT=MYPRINT NEW;
RUN;
<<<<<<< HEAD

/* Create MACRO variable for year */
%LET YR=15;
TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
TITLE2 
	"EXERCISE7.SAS: HOW TO CONSTRUCT INSURANCE STATUS VARIABLES, USING FY &YR DATA";

/* Create format variable to display race */
PROC FORMAT;
	VALUE RACETHX 1='1 HISPANIC' 2='2 WHITE' 3='3 BLACK' 4='4 ASIAN' 
		5='5 OTHER RACE';
RUN;

/* Create Summary dataset based on subset of variables */
DATA SUMMARYSET (KEEP=DUID PID DUPERSID 
		PEGJA&YR--PEGDE&YR POUJA&YR--POUDE&YR PDKJA&YR--PDKDE&YR
    PNGJA&YR--PNGDE&YR POGJA&YR--POGDE&YR PRSJA&YR--PRSDE&YR PRXJA&YR--PRXDE&YR PRIJA&YR--PRIDE&YR
    INSJA&YR.X--INSDE&YR.X MCDJA&YR.X--MCDDE&YR.X MCRJA&YR.X--MCRDE&YR.X 
		TRIJA&YR.X--TRIDE&YR.X);
=======
 
 /* Create MACRO variable for year */
%LET YR=15;

TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
TITLE2 "EXERCISE7.SAS: HOW TO CONSTRUCT INSURANCE STATUS VARIABLES, USING FY &YR DATA";

/* Create format variable to display race */
PROC FORMAT;
VALUE RACETHX
  1 = '1 HISPANIC'
  2 = '2 WHITE'
  3 = '3 BLACK'
  4 = '4 ASIAN'
  5 = '5 OTHER RACE'
  ;
RUN;
 
/* Create Summary dataset based on subset of variables */
DATA SUMMARYSET (KEEP=DUID PID DUPERSID PEGJA&YR--PEGDE&YR POUJA&YR--POUDE&YR PDKJA&YR--PDKDE&YR
    PNGJA&YR--PNGDE&YR POGJA&YR--POGDE&YR PRSJA&YR--PRSDE&YR PRXJA&YR--PRXDE&YR PRIJA&YR--PRIDE&YR
    INSJA&YR.X--INSDE&YR.X MCDJA&YR.X--MCDDE&YR.X MCRJA&YR.X--MCRDE&YR.X TRIJA&YR.X--TRIDE&YR.X);
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
	SET CDATA.H181;
RUN;

/* Select only position table in output display */
ODS Select Position;

PROC DATASETS;
	CONTENTS DATA=WORK.SUMMARYSET VARNUM;
	Title3 'Condensed list of variables';
	RUN;
<<<<<<< HEAD

	/* Turn output back on */
	ODS Select All;

	/**********************************************************************************
	
	1) COUNT # OF MONTHS WITH INSURANCE
	Create arrays based on insurance coverage type and month of coverage for
	corresponding year in the MACRO variable defined above
	
	Iterate through the arrays defined for coverage type by month
	
	The do loop will increase a counter for a given insurance coverage type producing
	a count of months covered for each coverage type by Person
	
	 *********************************************************************************/;

DATA FY1;
	SET CDATA.H181;
	ARRAY PEG (12) PEGJA&YR PEGFE&YR PEGMA&YR PEGAP&YR PEGMY&YR PEGJU&YR PEGJL&YR PEGAU&YR PEGSE&YR PEGOC&YR PEGNO&YR PEGDE&YR;
	ARRAY POU (12) POUJA&YR POUFE&YR POUMA&YR POUAP&YR POUMY&YR POUJU&YR POUJL&YR POUAU&YR POUSE&YR POUOC&YR POUNO&YR POUDE&YR;
	ARRAY PDK (12) PDKJA&YR PDKFE&YR PDKMA&YR PDKAP&YR PDKMY&YR PDKJU&YR PDKJL&YR PDKAU&YR PDKSE&YR PDKOC&YR PDKNO&YR PDKDE&YR;
	ARRAY PNG (12) PNGJA&YR PNGFE&YR PNGMA&YR PNGAP&YR PNGMY&YR PNGJU&YR PNGJL&YR PNGAU&YR PNGSE&YR PNGOC&YR PNGNO&YR PNGDE&YR;
	ARRAY POG (12) POGJA&YR POGFE&YR POGMA&YR POGAP&YR POGMY&YR POGJU&YR POGJL&YR POGAU&YR POGSE&YR POGOC&YR POGNO&YR POGDE&YR;
	ARRAY PRS (12) PRSJA&YR PRSFE&YR PRSMA&YR PRSAP&YR PRSMY&YR PRSJU&YR PRSJL&YR PRSAU&YR PRSSE&YR PRSOC&YR PRSNO&YR PRSDE&YR;
	ARRAY PRX (12) PRXJA&YR PRXFE&YR PRXMA&YR PRXAP&YR PRXMY&YR PRXJU&YR PRXJL&YR PRXAU&YR PRXSE&YR PRXOC&YR PRXNO&YR PRXDE&YR;
	ARRAY PRI (12) PRIJA&YR PRIFE&YR PRIMA&YR PRIAP&YR PRIMY&YR PRIJU&YR PRIJL&YR PRIAU&YR PRISE&YR PRIOC&YR PRINO&YR PRIDE&YR;
	ARRAY INS (12) INSJA&YR.X INSFE&YR.X INSMA&YR.X INSAP&YR.X INSMY&YR.X 
		INSJU&YR.X INSJL&YR.X INSAU&YR.X INSSE&YR.X INSOC&YR.X INSNO&YR.X INSDE&YR.X;
	ARRAY MCD (12) MCDJA&YR.X MCDFE&YR.X MCDMA&YR.X MCDAP&YR.X MCDMY&YR.X 
		MCDJU&YR.X MCDJL&YR.X MCDAU&YR.X MCDSE&YR.X MCDOC&YR.X MCDNO&YR.X MCDDE&YR.X;
	ARRAY MCR (12) MCRJA&YR.X MCRFE&YR.X MCRMA&YR.X MCRAP&YR.X MCRMY&YR.X 
		MCRJU&YR.X MCRJL&YR.X MCRAU&YR.X MCRSE&YR.X MCROC&YR.X MCRNO&YR.X MCRDE&YR.X;
	ARRAY TRI (12) TRIJA&YR.X TRIFE&YR.X TRIMA&YR.X TRIAP&YR.X TRIMY&YR.X 
		TRIJU&YR.X TRIJL&YR.X TRIAU&YR.X TRISE&YR.X TRIOC&YR.X TRINO&YR.X TRIDE&YR.X;
	ARRAY OPA (12) OPAJA&YR OPAFE&YR OPAMA&YR OPAAP&YR OPAMY&YR OPAJU&YR OPAJL&YR OPAAU&YR OPASE&YR OPAOC&YR OPANO&YR OPADE&YR;
	ARRAY OPB (12) OPBJA&YR OPBFE&YR OPBMA&YR OPBAP&YR OPBMY&YR OPBJU&YR OPBJL&YR OPBAU&YR OPBSE&YR OPBOC&YR OPBNO&YR OPBDE&YR;
	PRI_N=0;
	INS_N=0;
	UNINS_N=0;
	MCD_N=0;
	MCR_N=0;
	TRI_N=0;
	OPAB_N=0;
	GRP_N=0;
	NG_N=0;
	PUB_N=0;
	REF_N=0;

	DO I=1 TO 12;

		IF PRI(I)=1 THEN
			PRI_N+1;

		IF INS(I)=1 THEN
			INS_N+1;

		IF INS(I)=2 THEN
			UNINS_N+1;

		IF MCD(I)=1 THEN
			MCD_N+1;

		IF MCR(I)=1 THEN
			MCR_N+1;

		IF TRI(I)=1 THEN
			TRI_N+1;

		IF OPA(I)=1 OR OPB(I)=1 THEN
			OPAB_N+1;

		IF PEG(I)=1 OR TRI(I)=1 OR POU(I)=1 OR PDK(I)=1 THEN
			GRP_N + 1;

		IF PRX(I)=1 OR PNG(I)=1 OR POG(I)=1 OR PRS(I)=1 THEN
			NG_N + 1;

		IF MCR(I)=1 OR MCD(I)=1 OR OPA(I)=1 OR OPB(I)=1 THEN
			PUB_N + 1;

		IF INS(I)>0 THEN
			REF_N+1;
	END;
	DROP I;
	LABEL PRI_N="# OF MONTHS COV BY PRIVATE INSU" 
		INS_N="# OF MONTHS COV BY ANY INSU" UNINS_N="# OF MONTHS WITHOUT INSU" 
		MCD_N="# OF MONTHS COV BY MEDICAID" MCR_N="# OF MONTHS COV BY MEDICARE" 
		TRI_N="# OF MONTHS COV BY TRICARE" 
		OPAB_N="# OF MONTHS COV BY OTHER PUBLIC A OR B INSU" 
		GRP_N="# OF MONTHS COV BY PRIVATE GROUP INSU" 
		NG_N="# OF MONTHS COV BY PRIVATE NON-GROUP INSU" 
		PUB_N="# OF MONTHS COV BY PUBLIC INSU" REF_N="# OF MONTHS IN MEPS SURVEY";
RUN;

/**********************************************************************************

Display FREQ counts for the calculated variables created above

(# of months insured by insurance type)
Treat missing values as valid nonmissing formats in calculations

Each variable ranges from 0-12 (for # of months covered) (13 total outcomes)

 *********************************************************************************/;

PROC FREQ DATA=FY1;
	TABLES PRI_N INS_N UNINS_N MCD_N MCR_N TRI_N OPAB_N GRP_N NG_N PUB_N REF_N 
		/LIST MISSING;
	TITLE3 "CREATE COUNT VARIABLES FOR # OF MONTHS WITH INSURANCE";
RUN;

/**********************************************************************************

Print 30 observations using Private Insurance as an example

Display whether or not the person was covered by private insurance for the given months of 2015

1 value represents coverage, 2 value represents no coverage

 *********************************************************************************/;

PROC PRINT DATA=FY1 (OBS=30) NOOBS;
	TITLE3 'SAMPLE DUMP TO CHECK THE COUNT VARIABLES (USING PRI_N AS EXMAPLE)';
	VAR DUPERSID PRIJA&YR PRIFE&YR PRIMA&YR PRIAP&YR PRIMY&YR PRIJU&YR PRIJL&YR PRIAU&YR PRISE&YR PRIOC&YR PRINO&YR PRIDE&YR PRI_N;
RUN;

/**********************************************************************************

2) CREATE FLAGS FOR VARIOUS TYPES OF INSU

Create FLAG for type of Insurance coverage based on count of months by type of
coverage variable above

If the count of total uninsured months is '0' the 'INSURED FOR FULL YEAR'
flag is set

If the count of total months insured by a private group > '0' the
'EVER INSURED BY PRIVATE GROUP' flag is set

If the count of total months insured by a private group > '0'
and # of months is equal to # of months participant has been in MEPS Survey,
the 'INSURED BY PRIVATE GROUP FOR FULL YEAR' flag is set

If the count of total months insured by a private non-group > '0',
the 'EVER INSURED BY PRIVATE NON-GROUP' flag is set

 *********************************************************************************/;

DATA FY2;
	SET FY1;
	LABEL FULL_INSU='INSURED FOR FULL YEAR' 
		GROUP_INS1='EVER INSURED BY PRIVATE GROUP' 
		GROUP_INS2='INSURED BY PRIVATE GROUP FOR FULL YEAR' 
		NG_INS='EVER INSURED BY PRIVATE NON-GROUP';
	FULL_INSU=0;
	GROUP_INS1=0;
	GROUP_INS2=0;
	NG_INS=0;

	IF UNINS_N=0 THEN
		FULL_INSU=1;

	IF GRP_N>0 THEN
		GROUP_INS1=1;

	IF GRP_N>0 AND GRP_N=REF_N THEN
		GROUP_INS2=1;

	IF NG_N>0 THEN
		NG_INS=1;
RUN;

/**********************************************************************************

Display FREQ results for newly created tables

Compare Insured for full year, Insured for full year vs. uninsured, insured for
full year vs. # of months in MEPS survey

Compare Ever Insured by Private Group, and # months covered by private
groups insurance

Compare Insured by Private Group For Full Year, and # of months covered by
private groups insurance, and # of months in MEPS survey

These are mainly checks that can be used to verify the creation of the flag
variables and verify our counts for quality control (i.e. does the count for
NG_INS match with our count variable of 0 months of coverage
for private non-group insurance, do the corresponding month count
subgroups correlate with the FREQ count of those who have received
private non-group insurance)

*********************************************************************************/;

PROC FREQ DATA=FY2;
	TABLES FULL_INSU FULL_INSU*UNINS_N FULL_INSU*INS_N*REF_N GROUP_INS1 
		GROUP_INS1*GRP_N GROUP_INS2 GROUP_INS2*GRP_N*REF_N NG_INS NG_INS*NG_N/LIST 
		MISSING;
	TITLE3 "SUPPORTING CROSSTABS TO VERIFY THE CREATION OF THE FLAGS";
RUN;

/* Turn Graphs off */
ODS GRAPHICS OFF;

/**********************************************************************************

3) CALCULATE % OF PERSONS COVERED BY INSU
Calculate Estimates of Percentages of Persons Covered By RACE

*********************************************************************************/;

PROC SURVEYMEANS DATA=FY2 NOBS SUMWGT SUM STD MEAN STDERR;
	TITLE3 "% AND POPULATION WITH INSU";
	STRATA VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15F;
	VAR FULL_INSU GROUP_INS1 GROUP_INS2 NG_INS;
	DOMAIN RACETHX;
	FORMAT RACETHX RACETHX.;
=======
	
/* Turn output back on */
ODS Select All;

/* 1) COUNT # OF MONTHS WITH INSURANCE */
/* Create arrays based on insurance coverage type and month of coverage for corresponding year in the MACRO variable defined above*/
/* Iterate through the arrays defined for coverage type by month */
/* The do loop will increase a counter for a given insurance coverage type producing a count of months covered for each coverage type by Person */
DATA FY1;
  SET CDATA.H181;

ARRAY PEG (12) PEGJA&YR PEGFE&YR PEGMA&YR PEGAP&YR PEGMY&YR PEGJU&YR PEGJL&YR PEGAU&YR PEGSE&YR PEGOC&YR PEGNO&YR PEGDE&YR;
ARRAY POU (12) POUJA&YR POUFE&YR POUMA&YR POUAP&YR POUMY&YR POUJU&YR POUJL&YR POUAU&YR POUSE&YR POUOC&YR POUNO&YR POUDE&YR;
ARRAY PDK (12) PDKJA&YR PDKFE&YR PDKMA&YR PDKAP&YR PDKMY&YR PDKJU&YR PDKJL&YR PDKAU&YR PDKSE&YR PDKOC&YR PDKNO&YR PDKDE&YR;
ARRAY PNG (12) PNGJA&YR PNGFE&YR PNGMA&YR PNGAP&YR PNGMY&YR PNGJU&YR PNGJL&YR PNGAU&YR PNGSE&YR PNGOC&YR PNGNO&YR PNGDE&YR;
ARRAY POG (12) POGJA&YR POGFE&YR POGMA&YR POGAP&YR POGMY&YR POGJU&YR POGJL&YR POGAU&YR POGSE&YR POGOC&YR POGNO&YR POGDE&YR;
ARRAY PRS (12) PRSJA&YR PRSFE&YR PRSMA&YR PRSAP&YR PRSMY&YR PRSJU&YR PRSJL&YR PRSAU&YR PRSSE&YR PRSOC&YR PRSNO&YR PRSDE&YR;
ARRAY PRX (12) PRXJA&YR PRXFE&YR PRXMA&YR PRXAP&YR PRXMY&YR PRXJU&YR PRXJL&YR PRXAU&YR PRXSE&YR PRXOC&YR PRXNO&YR PRXDE&YR;

ARRAY PRI (12) PRIJA&YR PRIFE&YR PRIMA&YR PRIAP&YR PRIMY&YR PRIJU&YR PRIJL&YR PRIAU&YR PRISE&YR PRIOC&YR PRINO&YR PRIDE&YR;
ARRAY INS (12) INSJA&YR.X INSFE&YR.X INSMA&YR.X INSAP&YR.X INSMY&YR.X INSJU&YR.X INSJL&YR.X INSAU&YR.X INSSE&YR.X INSOC&YR.X INSNO&YR.X INSDE&YR.X;
ARRAY MCD (12) MCDJA&YR.X MCDFE&YR.X MCDMA&YR.X MCDAP&YR.X MCDMY&YR.X MCDJU&YR.X MCDJL&YR.X MCDAU&YR.X MCDSE&YR.X MCDOC&YR.X MCDNO&YR.X MCDDE&YR.X;
ARRAY MCR (12) MCRJA&YR.X MCRFE&YR.X MCRMA&YR.X MCRAP&YR.X MCRMY&YR.X MCRJU&YR.X MCRJL&YR.X MCRAU&YR.X MCRSE&YR.X MCROC&YR.X MCRNO&YR.X MCRDE&YR.X;
ARRAY TRI (12) TRIJA&YR.X TRIFE&YR.X TRIMA&YR.X TRIAP&YR.X TRIMY&YR.X TRIJU&YR.X TRIJL&YR.X TRIAU&YR.X TRISE&YR.X TRIOC&YR.X TRINO&YR.X TRIDE&YR.X;

ARRAY OPA (12) OPAJA&YR OPAFE&YR OPAMA&YR OPAAP&YR OPAMY&YR OPAJU&YR OPAJL&YR OPAAU&YR OPASE&YR OPAOC&YR OPANO&YR OPADE&YR;
ARRAY OPB (12) OPBJA&YR OPBFE&YR OPBMA&YR OPBAP&YR OPBMY&YR OPBJU&YR OPBJL&YR OPBAU&YR OPBSE&YR OPBOC&YR OPBNO&YR OPBDE&YR;

  PRI_N=0;
  INS_N=0;
  UNINS_N=0;
  MCD_N=0;
  MCR_N=0;
  TRI_N=0;
  OPAB_N=0;
  GRP_N=0;
  NG_N=0;
  PUB_N=0;
  REF_N=0;

  DO I=1 TO 12;
    IF PRI(I)=1 THEN PRI_N+1;
    IF INS(I)=1 THEN INS_N+1;
    IF INS(I)=2 THEN UNINS_N+1;
    IF MCD(I)=1 THEN MCD_N+1;
    IF MCR(I)=1 THEN MCR_N+1;
    IF TRI(I)=1 THEN TRI_N+1;
    IF OPA(I)=1 OR OPB(I)=1 THEN OPAB_N+1;
    IF PEG(I)=1 OR TRI(I)=1 OR POU(I)=1 OR PDK(I)=1 THEN GRP_N + 1;
    IF PRX(I)=1 OR PNG(I)=1 OR POG(I)=1 OR PRS(I)=1 THEN NG_N + 1;
    IF MCR(I)=1 OR MCD(I)=1 OR OPA(I)=1 OR OPB(I)=1 THEN PUB_N + 1;
    IF INS(I)>0 THEN REF_N+1;
  END;
  DROP I;

LABEL
  PRI_N  ="# OF MONTHS COV BY PRIVATE INSU"
  INS_N  ="# OF MONTHS COV BY ANY INSU"
  UNINS_N="# OF MONTHS WITHOUT INSU"
  MCD_N  ="# OF MONTHS COV BY MEDICAID"
  MCR_N  ="# OF MONTHS COV BY MEDICARE"
  TRI_N  ="# OF MONTHS COV BY TRICARE"
  OPAB_N ="# OF MONTHS COV BY OTHER PUBLIC A OR B INSU"
  GRP_N  ="# OF MONTHS COV BY PRIVATE GROUP INSU"
  NG_N   ="# OF MONTHS COV BY PRIVATE NON-GROUP INSU"
  PUB_N  ="# OF MONTHS COV BY PUBLIC INSU"
  REF_N  ="# OF MONTHS IN MEPS SURVEY" ;
RUN;

/* Display FREQ counts for the calculated variables created above (# of months insured by insurance type) */
/* Treat missing values as valid nonmissing formats in calculations */
/* Each variable ranges from 0-12 (for # of months covered) (13 total outcomes) */
PROC FREQ DATA=FY1;
  TABLES  PRI_N INS_N UNINS_N MCD_N MCR_N TRI_N OPAB_N GRP_N NG_N PUB_N REF_N /LIST MISSING;
TITLE3 "CREATE COUNT VARIABLES FOR # OF MONTHS WITH INSURANCE";
RUN;

/* Print 30 observations using Private Insurance as an example */
/* Display whether or not the person was covered by private insurance for the given months of 2015*/
/* 1 value represents coverage, 2 value represents no coverage */ 
PROC PRINT DATA=FY1 (OBS=30) NOOBS;
TITLE3 'SAMPLE DUMP TO CHECK THE COUNT VARIABLES (USING PRI_N AS EXMAPLE)';
VAR DUPERSID PRIJA&YR PRIFE&YR PRIMA&YR PRIAP&YR PRIMY&YR PRIJU&YR PRIJL&YR PRIAU&YR PRISE&YR PRIOC&YR PRINO&YR PRIDE&YR PRI_N;
RUN;

/*2) CREATE FLAGS FOR VARIOUS TYPES OF INSU */
/* Create FLAG for type of Insurance coverage based on count of months by type of coverage variable above */
/* If the count of total uninsured months is '0' the 'INSURED FOR FULL YEAR' flag is set */
/* If the count of total months insured by a private group > '0' the 'EVER INSURED BY PRIVATE GROUP' flag is set */
/* If the count of total months insured by a private group > '0' and # of months is equal to # of months participant has been in MEPS Survey, the 'INSURED BY PRIVATE GROUP FOR FULL YEAR' flag is set */
/* If the count of total months insured by a private non-group > '0', the 'EVER INSURED BY PRIVATE NON-GROUP' flag is set */
DATA FY2;
  SET FY1;
  LABEL
  FULL_INSU='INSURED FOR FULL YEAR'
  GROUP_INS1='EVER INSURED BY PRIVATE GROUP'
  GROUP_INS2='INSURED BY PRIVATE GROUP FOR FULL YEAR'
  NG_INS='EVER INSURED BY PRIVATE NON-GROUP';

  FULL_INSU=0;
  GROUP_INS1=0;
  GROUP_INS2=0;
  NG_INS=0;

  IF UNINS_N=0 THEN FULL_INSU=1;
  IF GRP_N>0 THEN GROUP_INS1=1;
  IF GRP_N>0 AND GRP_N=REF_N THEN GROUP_INS2=1;
  IF NG_N>0 THEN NG_INS=1;
RUN;

/* Display FREQ results for newly created tables */
/* Compare Insured for full year, Insured for full year vs. uninsured, insured for full year vs. # of months in MEPS survey */
/* Compare Ever Insured by Private Group, and # months covered by private groups insurance */
/* Compare Insured by Private Group For Full Year, and # of months covered by private groups insurance, and # of months in MEPS survey */ 
/* These are mainly checks that can be used to verify the creation of the flag variables and verify our counts for quality control */
/* (i.e. does the count for NG_INS match with our count variable of 0 months of coverage for private non-group insurance, 
do the corresponding month count subgroups correlate with the FREQ count of those who have received private non-group insurance) */
PROC FREQ DATA=FY2;
  TABLES FULL_INSU FULL_INSU*UNINS_N FULL_INSU*INS_N*REF_N
         GROUP_INS1 GROUP_INS1*GRP_N
         GROUP_INS2 GROUP_INS2*GRP_N*REF_N
         NG_INS NG_INS*NG_N/LIST MISSING;
    TITLE3 "SUPPORTING CROSSTABS TO VERIFY THE CREATION OF THE FLAGS";
RUN;


/* Turn Graphs off */
ODS GRAPHICS OFF;

/*3) CALCULATE % OF PERSONS COVERED BY INSU*/
/* Calculate Estimates of Percentages of Persons Covered By RACE */
PROC SURVEYMEANS DATA=FY2 NOBS SUMWGT SUM STD MEAN STDERR;
TITLE3 "% AND POPULATION WITH INSU";
	STRATA  VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15F;
	VAR  FULL_INSU GROUP_INS1 GROUP_INS2 NG_INS;
	DOMAIN RACETHX;
  FORMAT RACETHX RACETHX.;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
RUN;

/* Close all the output */
ODS _ALL_ CLOSE;

/* THE PROC PRINTTO null step is required to close the PROC PRINTTO */
PROC PRINTTO;
RUN;