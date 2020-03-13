/**********************************************************************************

<<<<<<< HEAD
DESCRIPTION:  THIS PROGRAM ILLUSTRATES HOW TO POOL MEPS DATA FILES FROM
DIFFERENT YEARS

THE EXAMPLE USED IS POPULATION AGE 26-30 WHO ARE UNINSURED BUT HAVE HIGH INCOME

DATA FROM 2015 AND 2016 ARE POOLED.

VARIABLES WITH YEAR-SPECIFIC NAMES MUST BE RENAMED BEFORE COMBINING FILES.
IN THIS PROGRAM THE INSURANCE COVERAGE VARIABLES 'INSCOV15' AND 'INSCOV16' ARE
 RENAMED TO 'INSCOV'.

SEE HC-036 (1996-2015 POOLED ESTIMATION FILE) FOR
INSTRUCTIONS ON POOOLING AND CONSIDERATIONS FOR VARIANCE
ESTIMATION FOR PRE-2002 DATA.

INPUT FILE:     (1) C:\MEPS\SAS\DATA\H192.SAS7BDAT (2016 FULL-YEAR FILE)
(2) C:\MEPS\SAS\DATA\H181.SAS7BDAT (2015 FULL-YEAR FILE)

 *********************************************************************************/;
OPTIONS NODATE NONUMBER PAGESIZE=200 FORMCHAR="|----|+|---+=|-/\<>*";
/* Update log and print output information based on exercise # */  
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=4a;
%LET logFolderOutput=&folderPath.&exerciseNumber/my-output/;
=======
DESCRIPTION:  THIS PROGRAM ILLUSTRATES HOW TO POOL MEPS DATA FILES FROM DIFFERENT YEARS
              THE EXAMPLE USED IS POPULATION AGE 26-30 WHO ARE UNINSURED BUT HAVE HIGH INCOME

	         DATA FROM 2015 AND 2016 ARE POOLED.

              VARIABLES WITH YEAR-SPECIFIC NAMES MUST BE RENAMED BEFORE COMBINING FILES.
              IN THIS PROGRAM THE INSURANCE COVERAGE VARIABLES 'INSCOV15' AND 'INSCOV16' ARE RENAMED TO 'INSCOV'.

	         SEE HC-036 (1996-2015 POOLED ESTIMATION FILE) FOR
              INSTRUCTIONS ON POOOLING AND CONSIDERATIONS FOR VARIANCE
	         ESTIMATION FOR PRE-2002 DATA.

INPUT FILE:     (1) C:\MEPS\SAS\DATA\H192.SAS7BDAT (2016 FULL-YEAR FILE)
	            (2) C:\MEPS\SAS\DATA\H181.SAS7BDAT (2015 FULL-YEAR FILE)

*********************************************************************************/;
/* Update log and print output information based on exercise # */  
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=4a;   
%LET logFolderOutput=&folderPath.&exerciseNumber/my-output/;
OPTIONS LINESIZE=160 PAGESIZE=79 NODATE FORMCHAR="|----|+|---+=|-/\<>*" PAGENO=1;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
FILENAME MYLOG "&logFolderOutput\Exercise&exerciseNumber._log.TXT";
FILENAME MYPRINT "&logFolderOutput\Exercise&exerciseNumber._OUTPUT.TXT";

PROC PRINTTO LOG=MYLOG PRINT=MYPRINT NEW;
RUN;

<<<<<<< HEAD

TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
TITLE2 
	'EXERCISE6.SAS: POOL MEPS DATA FILES FROM DIFFERENT YEARS (2015 and 2016)';

/* Create format variables */
PROC FORMAT;
	VALUE POVCAT 1='1 POOR/NEGATIVE' 2='2 NEAR POOR' 3='3 LOW INCOME' 
		4='4 MIDDLE INCOME' 5='5 HIGH INCOME';
	VALUE INSF 1='1 ANY PRIVATE' 2='2 PUBLIC ONLY' 3='3 UNINSURED';
	VALUE AGE 26-30='26-30' 0-25='0-25' 31-HIGH='31+';
run;

/* Summary statistics table 2 */
DATA SUMMARYSET2 (KEEP=DUPERSID INSCOV15 PERWT15F VARSTR VARPSU POVCAT15 
		AGELAST TOTSLF15);
=======
/* System options - suppress the date and time */
OPTIONS NODATE;
TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
TITLE2 'EXERCISE6.SAS: POOL MEPS DATA FILES FROM DIFFERENT YEARS (2015 and 2016)';

/* Create format variables */
PROC FORMAT;
	VALUE POVCAT
    1 = '1 POOR/NEGATIVE'
    2 = '2 NEAR POOR'
    3 = '3 LOW INCOME'
    4 = '4 MIDDLE INCOME'
    5 = '5 HIGH INCOME'
    ;

	VALUE INSF
	1 = '1 ANY PRIVATE'
	2 = '2 PUBLIC ONLY'
	3 = '3 UNINSURED';

    VALUE AGE
    26-30='26-30'
    0-25='0-25'
    31-HIGH='31+';
run;

/* Summary statistics table 2 */
DATA SUMMARYSET2 (KEEP=DUPERSID INSCOV15 PERWT15F VARSTR VARPSU POVCAT15 AGELAST TOTSLF15);
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
	SET CDATA.H181;
RUN;

/* Select only the position table in the output */
ODS Select Position;

/* Display summary statistics: File #2 */
PROC CONTENTS DATA=WORK.SUMMARYSET2 VARNUM;
	Title3 'Summary of H181 Variables';
RUN;

/* Selct all output once again */
ODS Select All;

<<<<<<< HEAD
/**********************************************************************************

FREQUENCY OF 2015 

Create a dataset called YR1

Keep PERSON ID, AGE, INC AS % OF POVERTY LINE, and INSURANCE COVERAGE INDICATOR

 *********************************************************************************/;

DATA YR1;
	SET CDATA.H181 (KEEP=DUPERSID INSCOV15 PERWT15F VARSTR VARPSU POVCAT15 AGELAST 
		TOTSLF15);

	IF PERWT15F>0;
RUN;

/**********************************************************************************

PROC FREQ show INC AS % OF POVERTY LINE by INSURANCE COVERAGE INDICATOR
(26 <= AGE <= 30)

Dislpay UNWEIGHTED output

Display LIST format MISSING values are treated as valid nonmissing levels

Format variables

Display Poverty Category By Insurance Coverage Indicator with FREQ Count

 *********************************************************************************/;


PROC FREQ DATA=YR1 (WHERE=(26 LE AGELAST LE 30));
	TABLES POVCAT15*INSCOV15/ LIST MISSING;
	FORMAT INSCOV15 INSF.  POVCAT15 POVCAT.;
	TITLE3 'UNWEIGHTED FREQUENCY FOR 2015 FY PERSONS WITH AGE 26-30';
RUN;

/**********************************************************************************

FREQUENCY OF 2016

Create a dataset called YR2
Keep PERSON ID, AGE, INC AS % OF POVERTY LINE, and INSURANCE COVERAGE INDICATOR

 *********************************************************************************/;

DATA YR2;
	SET CDATA.H192 (KEEP=DUPERSID INSCOV16 PERWT16F VARSTR VARPSU POVCAT16 AGELAST 
		TOTSLF16);

	IF PERWT16F>0;
run;


/**********************************************************************************

PROC FREQ show INC AS % OF POVERTY LINE by INSURANCE COVERAGE INDICATOR 
(26 <= AGE <= 30)
Dislpay UNWEIGHTED output
Display LIST format MISSING values are treated as valid nonmissing levels
Format variables
Display Poverty Category By Insurance Coverage Indicator with FREQ Count

 *********************************************************************************/;

PROC FREQ DATA=YR2 (WHERE=(26 LE AGELAST LE 30));
	TABLES POVCAT16*INSCOV16/ LIST MISSING;
	FORMAT INSCOV16 INSF.  POVCAT16 POVCAT.;
	TITLE3 'UNWEIGHTED FREQUENCY FOR 2016 FY PERSONS WITH AGE 26-30';
RUN;

/* RENAME YEAR SPECIFIC VARIABLES PRIOR TO COMBINING FILES */
DATA YR1X;
	SET YR1 (RENAME=(INSCOV15=INSCOV PERWT15F=PERWT POVCAT15=POVCAT 
		TOTSLF15=TOTSLF));
RUN;

DATA YR2X;
	SET YR2 (RENAME=(INSCOV16=INSCOV PERWT16F=PERWT POVCAT16=POVCAT 
		TOTSLF16=TOTSLF));
RUN;

/**********************************************************************************

Create a pooled dataset with the two year (2015,2016) datasets created above

Insurance coverage, last age, poverty category, as well as variables for 
CLUSTER, STRATA, and WEIGHT are kept

Divide the PERWT by 2 because we are now dealing with datasets in 2 years
 - assign to the POOLWT variable
 
Create a FLAG if individuals are Between 26 and 30 years of AGE 
(range inclusive), UNINSURED, and HIGH INCOME

Create LABELS to enhance readability for SUBPOP variable and TOTSLF 
(Amount paid by self/family)

 *********************************************************************************/;

DATA POOL;
	LENGTH INSCOV AGELAST POVCAT VARSTR VARPSU 8;
	SET YR1X YR2X;
	POOLWT=PERWT/2;

	IF 26 LE AGELAST LE 30 AND POVCAT=5 AND INSCOV=3 THEN
		SUBPOP=1;
	ELSE
		SUBPOP=2;
	LABEL 
		SUBPOP='POPULATION WITH AGE=26-30, UNINSURED WHOLE YEAR, AND HIGH INCOME' 
		TOTSLF='TOTAL AMT PAID BY SELF/FAMILY';
RUN;

/**********************************************************************************

Check missing values on the combined dataset (2015 and 2016)

(N provides # of observations, while NMISS provides # of observations missing)

 *********************************************************************************/;

PROC MEANS DATA=POOL N NMISS;
	TITLE3 "CHECK MISSING VALUES ON THE COMBINED DATA";
RUN;

/**********************************************************************************

Display FREQ counts for both years combined (2015, 2016)

Display FREQ for SUBPOP (26-30, high income, uninsured) Flag

Dislpay FREQ for SUBPOP (26-30, high income, uninsured) by AGE, POVCAT, and INSCOV

 *********************************************************************************/;

PROC FREQ DATA=POOL;
	TITLE3 'SUPPORTING CROSSTAB FOR THE CREATION OF THE SUBPOP FLAG';
	TABLES SUBPOP SUBPOP*AGELAST*POVCAT*INSCOV/ LIST MISSING;
	FORMAT AGELAST AGE.;
RUN;

/* Suppress the printing of output */
ODS EXCLUDE ALL;

/**********************************************************************************

Use the SURVEYMEANS PROC to create estimates for larger population based on the 
design of our survey sample

OUTPUT is temporarily suppressed and later used in PRINT PROC to display results

CALCULATIONS show weighted estimated EXPENDITURES for SUBPOP 
(AGE:26-30,Uninsured Whole Year,High Income) for combined years (2015,2016)

OUTPUT DOMAIN Result for Further processing in PROC PRINT statement

 *********************************************************************************/;

PROC SURVEYMEANS DATA=POOL NOBS MEAN STDERR;
	TITLE3 'WEIGHTED ESTIMATE ON TOTSLF FOR COMBINED DATA W/AGE=26-30, 
	UNINSURED WHOLE YEAR, AND HIGH INCOME';
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT POOLWT;
	VAR TOTSLF;
	DOMAIN SUBPOP("1");
	ODS OUTPUT DOMAIN=work.domain_results;
RUN;

/* Unsuppress the printing of output */
ODS EXCLUDE NONE;

/**********************************************************************************

Print the results of the DOMAIN table from the dataset output above 
NOOBS= SUPPRESS # OF OBSERVATIONS
SPLIT= SPLIT ON DESIGNATED FIELD IN COLUMN HEADINGS
Display WEIGHTED ESTIMATE ON TOTSLF FOR COMBINED DATA W/ AGE=26-30, 
UNINSURED WHOLE YEAR, AND HIGH INCOME'
Display the estimated amount paid by SELF/FAMILY for SUBPOP for combined years

 *********************************************************************************/;

proc print data=work.domain_results noobs split='*';
	var VARLABEL N mean StdErr;
	label mean='Mean' StdErr='SE of Mean';
	format N Comma12. mean comma9.1 stderr 9.4;
	TITLE3 'WEIGHTED ESTIMATE ON TOTSLF FOR COMBINED DATA W/AGE=26-30, UNINSURED WHOLE YEAR, AND HIGH INCOME';
=======
/* FREQUENCY OF 2015 */
/* Create a dataset called YR1 */
/* Keep PERSON ID, AGE, INC AS % OF POVERTY LINE, and INSURANCE COVERAGE INDICATOR */
DATA YR1;
	SET CDATA.H181 (KEEP= DUPERSID INSCOV15 PERWT15F VARSTR VARPSU POVCAT15 AGELAST TOTSLF15);
     IF PERWT15F>0;
RUN;

/* PROC FREQ show INC AS % OF POVERTY LINE by INSURANCE COVERAGE INDICATOR (26 <= AGE <= 30)*/
/* Dislpay UNWEIGHTED output */
/* Display LIST format MISSING values are treated as valid nonmissing levels */
/* Format variables */
/* Display Poverty Category By Insurance Coverage Indicator with FREQ Count */
PROC FREQ DATA= YR1 (WHERE=(26 LE AGELAST LE 30));
	TABLES POVCAT15*INSCOV15/ LIST MISSING ;
	FORMAT INSCOV15 INSF.  POVCAT15 POVCAT.;
TITLE3 'UNWEIGHTED FREQUENCY FOR 2015 FY PERSONS WITH AGE 26-30';
RUN;

/* FREQUENCY OF 2016 */
/* Create a dataset called YR2 */
/* Keep PERSON ID, AGE, INC AS % OF POVERTY LINE, and INSURANCE COVERAGE INDICATOR */
DATA YR2;
	SET CDATA.H192 (KEEP= DUPERSID INSCOV16 PERWT16F VARSTR VARPSU POVCAT16 AGELAST TOTSLF16);
     IF PERWT16F>0;
run;

/* PROC FREQ show INC AS % OF POVERTY LINE by INSURANCE COVERAGE INDICATOR (26 <= AGE <= 30) */
/* Dislpay UNWEIGHTED output */
/* Display LIST format MISSING values are treated as valid nonmissing levels */
/* Format variables */
/* Display Poverty Category By Insurance Coverage Indicator with FREQ Count */
PROC FREQ DATA= YR2 (WHERE=(26 LE AGELAST LE 30));
	TABLES POVCAT16*INSCOV16/ LIST MISSING ;
	FORMAT INSCOV16 INSF.  POVCAT16 POVCAT.;
TITLE3 'UNWEIGHTED FREQUENCY FOR 2016 FY PERSONS WITH AGE 26-30';
RUN;


/* RENAME YEAR SPECIFIC VARIABLES PRIOR TO COMBINING FILES */
DATA YR1X;
	SET YR1 (RENAME=(INSCOV15=INSCOV PERWT15F=PERWT POVCAT15=POVCAT TOTSLF15=TOTSLF));
RUN;

DATA YR2X;
	SET YR2 (RENAME=(INSCOV16=INSCOV PERWT16F=PERWT POVCAT16=POVCAT TOTSLF16=TOTSLF));
RUN;


/* Create a pooled dataset with the two year (2015,2016) datasets created above */
/* Insurance coverage, last age, poverty category, as well as variables for CLUSTER, STRATA, and WEIGHT are kept */
/* Divide the PERWT by 2 because we are now dealing with datasets in 2 years - assign to the POOLWT variable */
/* Create a FLAG if individuals are Between 26 and 30 years of AGE (range inclusive), UNINSURED, and HIGH INCOME */
/* Create LABELS to enhance readability for SUBPOP variable and TOTSLF (Amount paid by self/family) */
DATA POOL;
     LENGTH INSCOV AGELAST POVCAT VARSTR VARPSU 8;
	 SET YR1X YR2X;
     POOLWT = PERWT/2 ;

     IF 26 LE AGELAST LE 30 AND POVCAT=5 AND INSCOV=3 THEN SUBPOP=1;
     ELSE SUBPOP=2;

     LABEL SUBPOP='POPULATION WITH AGE=26-30, UNINSURED WHOLE YEAR, AND HIGH INCOME'
           TOTSLF='TOTAL AMT PAID BY SELF/FAMILY';
RUN;

/* Check missing values on the combined dataset (2015 and 2016) */
/* (N provides # of observations, while NMISS provides # of observations missing) */
PROC MEANS DATA=POOL N NMISS;
TITLE3 "CHECK MISSING VALUES ON THE COMBINED DATA";
RUN;

/* Display FREQ counts for both years combined (2015, 2016) */
/* Display FREQ for SUBPOP (26-30, high income, uninsured) Flag */
/* Dislpay FREQ for SUBPOP (26-30, high income, uninsured) by AGE, POVCAT, and INSCOV */
PROC FREQ DATA=POOL;
TITLE3 'SUPPORTING CROSSTAB FOR THE CREATION OF THE SUBPOP FLAG';
	TABLES SUBPOP SUBPOP*AGELAST*POVCAT*INSCOV/ LIST MISSING ;
	FORMAT  AGELAST AGE. ;
RUN;

/* Suppress the printing of output */
ODS EXCLUDE ALL; 

/* Use the SURVEYMEANS PROC to create estimates for larger population based on the design of our survey sample */
/* OUTPUT is temporarily suppressed and later used in PRINT PROC to display results */
/* CALCULATIONS show weighted estimated EXPENDITURES for SUBPOP (AGE:26-30,Uninsured Whole Year,High Income) for combined years (2015,2016) */
/* OUTPUT DOMAIN Result for Further processing in PROC PRINT statement */
PROC SURVEYMEANS DATA=POOL NOBS MEAN STDERR;
TITLE3 'WEIGHTED ESTIMATE ON TOTSLF FOR COMBINED DATA W/AGE=26-30, UNINSURED WHOLE YEAR, AND HIGH INCOME';
	STRATUM VARSTR ;
	CLUSTER VARPSU ;
	WEIGHT  POOLWT;
	VAR  TOTSLF;
	DOMAIN  SUBPOP("1");
	ODS OUTPUT DOMAIN=work.domain_results;
RUN;

 /* Unsuppress the printing of output */
ODS EXCLUDE NONE;

/* Print the results of the DOMAIN table from the dataset output above */
/* NOOBS= SUPPRESS # OF OBSERVATIONS */
/* SPLIT= SPLIT ON DESIGNATED FIELD IN COLUMN HEADINGS */
/* Display WEIGHTED ESTIMATE ON TOTSLF FOR COMBINED DATA W/ AGE=26-30, UNINSURED WHOLE YEAR, AND HIGH INCOME' */
/* Display the estimated amount paid by SELF/FAMILY for SUBPOP for combined years */ 
proc print data= work.domain_results noobs split='*';
 var   VARLABEL N  mean StdErr  ;
 label mean = 'Mean'
       StdErr = 'SE of Mean';
       format N Comma12. mean comma9.1 stderr 9.4;
TITLE3 'WEIGHTED ESTIMATE ON TOTSLF FOR COMBINED DATA W/AGE=26-30, UNINSURED WHOLE YEAR, AND HIGH INCOME';
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
run;

/* CLOSE ALL OUTPUT */
ODS _ALL_ CLOSE;

/* THE PROC PRINTTO null step is required to close the PROC PRINTTO */
PROC PRINTTO;
<<<<<<< HEAD
RUN;
=======
RUN;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
