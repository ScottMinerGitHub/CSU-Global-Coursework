/**********************************************************************************

<<<<<<< HEAD
DESCRIPTION:  THIS PROGRAM ILLUSTRATES HOW TO CONSTRUCT FAMILY-LEVEL VARIABLES
FROM PERSON-LEVEL DATA

THERE ARE TWO DEFINITIONS OF FAMILY UNIT IN MEPS.
1) CPS FAMILY:  ID IS DUID + CPSFAMID.  CORRESPONDING WEIGHT IS FAMWT15C.
2) MEPS FAMILY: ID IS DUID + FAMIDYR.   CORRESPONDING WEIGHT IS FAMWT15F.

THE CPS FAMILY IS USED IN THIS EXERCISE.

INPUT FILE:   C:\MEPS\SAS\DATA\H181.SAS7BDAT (2015 FY PUF DATA)

 *********************************************************************************/;
OPTIONS NODATE NONUMBER PAGESIZE=200 FORMCHAR="|----|+|---+=|-/\<>*";
/* Update log and print output information based on exercise # */  	
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=5a;
%LET logFolderOutput=&folderPath.&exerciseNumber/my-output/;

=======
DESCRIPTION:  THIS PROGRAM ILLUSTRATES HOW TO CONSTRUCT FAMILY-LEVEL VARIABLES FROM PERSON-LEVEL DATA

              THERE ARE TWO DEFINITIONS OF FAMILY UNIT IN MEPS.
                 1) CPS FAMILY:  ID IS DUID + CPSFAMID.  CORRESPONDING WEIGHT IS FAMWT15C.
                 2) MEPS FAMILY: ID IS DUID + FAMIDYR.   CORRESPONDING WEIGHT IS FAMWT15F.

              THE CPS FAMILY IS USED IN THIS EXERCISE.

INPUT FILE:   C:\MEPS\SAS\DATA\H181.SAS7BDAT (2015 FY PUF DATA)

*********************************************************************************/;
/* Update log and print output information based on exercise # */  	
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=5a;   
%LET logFolderOutput=&folderPath.&exerciseNumber/my-output/;
OPTIONS LINESIZE=160 PAGESIZE=79 NODATE FORMCHAR="|----|+|---+=|-/\<>*" PAGENO=1;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
FILENAME MYLOG "&logFolderOutput\Exercise&exerciseNumber._log.TXT";
FILENAME MYPRINT "&logFolderOutput\Exercise&exerciseNumber._OUTPUT.TXT";

PROC PRINTTO LOG=MYLOG PRINT=MYPRINT NEW;
RUN;

TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
TITLE2 "EXERCISE 5a SAS: CALCULATE FAMILY-LEVEL ESTIMATES";

/* Summary statistics table 2 */
DATA SUMMARYSET (KEEP=DUID PID AGE15X SEX CPSFAMID FAMWT15C FAMIDYR FAMWT15F);
	SET CDATA.H181;
RUN;

/* Select only the position table in the output */
ODS Select Position;

/* Display summary statistics: File #2 */
PROC CONTENTS DATA=WORK.SUMMARYSET VARNUM;
	Title3 'Summary of H181 Variables';
RUN;

/* Selct all output once again */
ODS Select All;

<<<<<<< HEAD
/**********************************************************************************

The CPSFAMID represents a redefinition of MEPS families into
families defined by the Current Population Survey (CPS).

Some of the distinctions between CPS-and MEPS-defined families are that MEPS
families include and CPS families do not include: non-married partners,
foster children, and in-laws. These persons are considered as members of separate
families for CPS-like families. CPS-like families are defined so a poverty status
classification variable consistent with established definitions of poverty can be
assigned to the CPS-like families and used for weight poststratification purposes.

FAMWT15C can be used to make estimates for the cross-section of families in the
U.S. civilian, noninstitutionalized population on December 31, 2015
where families are identified based on the CPS definition of a family unit.

The annualized family ID letter, FAMIDYR, identifies eligible members of the
eligible annualized families within a DU.

FAMWT15F can be used to make estimates for the cross-section of families in
the U.S. civilian noninstitutionalized population on December 31, 2015
where families are identified based on the MEPS definition of a family unit.

Each MEPS family unit is uniquely identified by the combination of the
variables DUID and FAMIDYR while each CPS family unit
is uniquely identified by the combination of the variables DUID and CPSFAMID.

 *********************************************************************************/;

/* PROC PRINT FIRST 30 OBSERVATIONS AND SPECIFIED VARIABLES */
PROC PRINT DATA=CDATA.H181 (OBS=20);
	VAR PID AGE15X SEX CPSFAMID FAMWT15C FAMIDYR FAMWT15F;
	TITLE3 "SAMPLE DUMP FOR FAMILY IDS";
	BY DUID;
RUN;

/**********************************************************************************

Sort data by DUID and CPSFAMID to represent families defined by the Current
Population Survey (CPS)

Include ID variables, necessary weighting variables, total expenditures, and total
income in new dataset named PERS

 *********************************************************************************/;

PROC SORT DATA=CDATA.H181 (KEEP=DUPERSID DUID CPSFAMID FAMWT15C VARSTR VARPSU 
		TOTSLF15 TTLP15X) OUT=PERS;
	BY DUID CPSFAMID;
RUN;

/**********************************************************************************

Create a datset PERS2

Keep Dwelling Unit ID, CPS Family Id

Create variables, FAMSIZE (size), FAMOOP (out-of-pocket), and FAMINC (income)

Define values for newly created family variables based on a loop of the CPSFAMID

 *********************************************************************************/;

DATA PERS2 FAM (KEEP=DUID CPSFAMID FAMSIZE FAMOOP FAMINC);
	SET PERS;
	BY DUID CPSFAMID;
	LABEL FAMSIZE='# OF PERSONS PER CPS FAMILY' 
		FAMOOP='TOTAL OUT-OF-POCKET EXP (TOTSLF15) PER CPS FAMILY' 
		FAMINC='TOTAL INCOME (TTLP15X) PER CPS FAMILY';

	IF FIRST.CPSFAMID THEN
		DO;
			FAMSIZE=0;
			FAMOOP=0;
			FAMINC=0;
		END;
	FAMSIZE + 1;
	FAMOOP  + TOTSLF15;
	FAMINC  + TTLP15X;
	OUTPUT PERS2;

	IF LAST.CPSFAMID THEN
		OUTPUT FAM;
RUN;

/**********************************************************************************

Print the PERS2 dataset created above (first 20 observsations)

Print represents families defined by the Current Population Survey

 *********************************************************************************/;

PROC PRINT DATA=PERS2 (OBS=20);
	BY DUID CPSFAMID;
	TITLE3 "A SAMPLE DUMP TO CHECK THE CREATION OF THE FAMILY-LEVEL VARIABLES";
RUN;

/**********************************************************************************

ADD WEIGHT, VARSTR, AND VARPSU TO THE FAMILY-LEVEL ANALYTIC DATA

Sort the PERS dataset where FAMWT15C > 0

De-duplicating the results and keeping variables to use for PROC SURVEYMEANS statement

 *********************************************************************************/;

PROC SORT DATA=PERS (WHERE=(FAMWT15C>0)) OUT=FAMWT (KEEP=DUID CPSFAMID FAMWT15C 
		VARSTR VARPSU) NODUPKEY;
	BY DUID CPSFAMID;
RUN;

/**********************************************************************************

Merge FAM data with FAMWT data created above By Dwelling-Unit ID and CPS Family ID

FAM2 is CPS families with WEIGHT variables for PROC SURVEYMEANS statement

 *********************************************************************************/;

DATA FAM2;
	MERGE FAM (IN=AA) FAMWT (IN=BB);
	BY DUID CPSFAMID;

	IF AA AND BB;
=======
/* The CPSFAMID represents a redefinition of MEPS families into families defined by the Current Population Survey (CPS). 
Some of the distinctions between CPS-and MEPS-defined families are that MEPS families include and CPS families do not include: 
non-married partners, foster children, and in-laws. These persons are considered as members of separate families for CPS-like families. 
CPS-like families are defined so a poverty status classification variable consistent with established definitions of poverty can be assigned to the CPS-like families 
and used for weight poststratification purposes. */

/* FAMWT15C can be used to make estimates for the cross-section of families in the U.S. civilian, noninstitutionalized population on December 31, 2015 
where families are identified based on the CPS definition of a family unit. */

/* The annualized family ID letter, FAMIDYR, identifies eligible members of the eligible annualized families within a DU. */

/* FAMWT15F can be used to make estimates for the cross-section of families in the U.S. civilian noninstitutionalized population on December 31, 2015 
where families are identified based on the MEPS definition of a family unit. */

/*  Each MEPS family unit is uniquely identified by the combination of the variables DUID and FAMIDYR while each CPS family unit 
is uniquely identified by the combination of the variables DUID and CPSFAMID. */

/* PROC PRINT FIRST 30 OBSERVATIONS AND SPECIFIED VARIABLES */
PROC PRINT DATA=CDATA.H181 (OBS=20);
  VAR PID AGE15X SEX CPSFAMID FAMWT15C FAMIDYR FAMWT15F;
TITLE3 "SAMPLE DUMP FOR FAMILY IDS";
  BY DUID;
RUN;

/* Sort data by DUID and CPSFAMID to represent families defined by the Current Population Survey (CPS) */
/* Include ID variables, necessary weighting variables, total expenditures, and total income in new dataset named PERS */
PROC SORT DATA=CDATA.H181 (KEEP=DUPERSID DUID CPSFAMID FAMWT15C VARSTR VARPSU TOTSLF15 TTLP15X)
              OUT=PERS;
  BY DUID CPSFAMID;
RUN;

/* Create a datset PERS2 */ 
/* Keep Dwelling Unit ID, CPS Family Id */
/* Create variables, FAMSIZE (size), FAMOOP (out-of-pocket), and FAMINC (income)*/
/* Define values for newly created family variables based on a loop of the CPSFAMID */
DATA PERS2
     FAM (KEEP=DUID CPSFAMID FAMSIZE FAMOOP FAMINC);
 SET PERS;
  BY DUID CPSFAMID;

     LABEL FAMSIZE = '# OF PERSONS PER CPS FAMILY'
           FAMOOP  = 'TOTAL OUT-OF-POCKET EXP (TOTSLF15) PER CPS FAMILY'
           FAMINC  = 'TOTAL INCOME (TTLP15X) PER CPS FAMILY';

     IF FIRST.CPSFAMID THEN DO;
        FAMSIZE = 0 ;
        FAMOOP  = 0 ;
        FAMINC  = 0 ;
     END;

     FAMSIZE + 1        ;
     FAMOOP  + TOTSLF15 ;
     FAMINC  + TTLP15X  ;

     OUTPUT PERS2;
     IF LAST.CPSFAMID THEN OUTPUT FAM;
RUN;

/* Print the PERS2 dataset created above (first 20 observsations) */
/* Print represents families defined by the Current Population Survey */
PROC PRINT DATA=PERS2 (OBS=20);
  BY DUID CPSFAMID;
TITLE3 "A SAMPLE DUMP TO CHECK THE CREATION OF THE FAMILY-LEVEL VARIABLES";
RUN;

/* ADD WEIGHT, VARSTR, AND VARPSU TO THE FAMILY-LEVEL ANALYTIC DATA */
/* Sort the PERS dataset where FAMWT15C > 0 */
/* De-duplicating the results and keeping variables to use for PROC SURVEYMEANS statement */
PROC SORT DATA=PERS (WHERE=(FAMWT15C>0)) OUT=FAMWT (KEEP=DUID CPSFAMID FAMWT15C VARSTR VARPSU) NODUPKEY;
  BY DUID CPSFAMID;
RUN;

/* Merge FAM data with FAMWT data created above By Dwelling-Unit ID and CPS Family ID */
/* FAM2 is CPS families with WEIGHT variables for PROC SURVEYMEANS statement */
DATA FAM2;
  MERGE FAM (IN=AA) FAMWT (IN=BB);
  BY DUID CPSFAMID;
  IF AA AND BB;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
RUN;

/* Turn off graphics */
ods graphics off;

<<<<<<< HEAD
/**********************************************************************************

Provide CPS Family-Level Estimates on Family Size, CPS Family OUT-OF-POCKET EXP,
and CPS Family Income

 *********************************************************************************/;

PROC SURVEYMEANS DATA=FAM2 NOBS SUMWGT MEAN STDERR;
	STRATA VARSTR;
	CLUSTER VARPSU;
	WEIGHT FAMWT15C;
	TITLE3 "CPS FAMILY-LEVEL ESTIMATES ON FAMILY SIZE, OUT-OF-POCKET EXP, 
AND INCOME, 2015";
=======
/* Provide CPS Family-Level Estimates on Family Size, CPS Family OUT-OF-POCKET EXP, and CPS Family Income */
PROC SURVEYMEANS DATA=FAM2 NOBS SUMWGT MEAN STDERR;
	STRATA  VARSTR ;
	CLUSTER VARPSU ;
	WEIGHT  FAMWT15C ;
TITLE3 "CPS FAMILY-LEVEL ESTIMATES ON FAMILY SIZE, OUT-OF-POCKET EXP, AND INCOME, 2015";
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
	VAR FAMSIZE FAMOOP FAMINC;
RUN;

/* Close all the output */
ODS _ALL_ CLOSE;

/* THE PROC PRINTTO null step is required to close the PROC PRINTTO */
PROC PRINTTO;
<<<<<<< HEAD
RUN;
=======
RUN;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
