/**********************************************************************************

<<<<<<< HEAD
DESCRIPTION:  THIS PROGRAM ILLUSTRATES HOW TO POOL MEPS LONGITUDINAL DATA 
FILES FROM DIFFERENT PANELS

THE EXAMPLE USED IS PANELS 17-19 POPULATION AGE 26-30 WHO ARE 
UNINSURED BUT HAVE HIGH INCOME IN THE FIRST YEAR
=======
DESCRIPTION:  THIS PROGRAM ILLUSTRATES HOW TO POOL MEPS LONGITUDINAL DATA FILES FROM DIFFERENT PANELS
THE EXAMPLE USED IS PANELS 17-19 POPULATION AGE 26-30 WHO ARE UNINSURED BUT HAVE HIGH INCOME IN THE FIRST YEAR
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9

DATA FROM PANELS 17, 18, AND 19 ARE POOLED.

INPUT FILE:     (1) C:\MEPS\SAS\DATA\H183.SAS7BDAT (PANEL 19 LONGITUDINAL FILE)
(2) C:\MEPS\SAS\DATA\H172.SAS7BDAT (PANEL 18 LONGITUDINAL FILE)
(3) C:\MEPS\SAS\DATA\H164.SAS7BDAT (PANEL 17 LONGITUDINAL FILE)

 *********************************************************************************/;
<<<<<<< HEAD
OPTIONS NODATE NONUMBER PAGESIZE=200 FORMCHAR="|----|+|---+=|-/\<>*";
=======

>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
/* Update log and print output information based on exercise # */ 

%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=4b;
%LET logFolderOutput=&folderPath.&exerciseNumber/my-output/;
<<<<<<< HEAD
=======
OPTIONS LINESIZE=160 PAGESIZE=79 NODATE FORMCHAR="|----|+|---+=|-/\<>*" 
	PAGENO=1;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
FILENAME MYLOG "&logFolderOutput\Exercise&exerciseNumber._log.TXT";
FILENAME MYPRINT "&logFolderOutput\Exercise&exerciseNumber._OUTPUT.TXT";

PROC PRINTTO LOG=MYLOG PRINT=MYPRINT NEW;
RUN;

/* Suppress the date and time in the output */
OPTIONS NODATE;
TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
<<<<<<< HEAD
TITLE2 'EXERCISE 4B SAS: POOL MEPS DATA FILES 
FROM DIFFERENT PANELS (PANELS 17, 18, 19)';

/* Create format variables to display Poverty Category, 
Insurance status, and Age Subpopulation variables */
=======
TITLE2 'EXERCISE 4B SAS: POOL MEPS DATA FILES FROM DIFFERENT PANELS (PANELS 17, 18, 19)';

/* Create format variables to display Poverty Category, Insurance status, and Age Subpopulation variables */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FORMAT;
	VALUE POVCAT 1='1 POOR/NEGATIVE' 2='2 NEAR POOR' 3='3 LOW INCOME' 
		4='4 MIDDLE INCOME' 5='5 HIGH INCOME';
	VALUE INSF-1='-1 INAPPLICABLE' 1='1 ANY PRIVATE' 2='2 PUBLIC ONLY' 
		3='3 UNINSURED';
	VALUE AGE -1='-1 INAPPLICABLE' 26-30='26-30' 0-25, 31-HIGH='0-25, 31+';
run;

<<<<<<< HEAD
/**********************************************************************************

Select subset of variables from main datatable

Display summary statatistics for data file

 *********************************************************************************/;
=======
/*******************************
/* Summary Statistics for 1 of 3 data files */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA SUMMARYSET (KEEP=DUPERSID INSCOVY1 INSCOVY2 LONGWT VARSTR VARPSU POVCATY1 
		AGEY1X PANEL);
	SET CDATA.H164;
RUN;

/* Select only the position table in the output */
ODS Select Position;

/* Display summary statistics: File #2 */
PROC CONTENTS DATA=WORK.SUMMARYSET VARNUM;
	Title3 'Summary of Datafile Variables for LONGITUDINAL Files';
RUN;
<<<<<<< HEAD

/**********************************************************************************

Create a pooled dataset based off of 3 data files

Insurance coverage, age, poverty category, as well as variables for 
CLUSTER, STRATA, and WEIGHT are kept 

Divide the LONGWT VARIABLE by 3 because we are now dealing with datasets in 3 years
 - assign to the POOLWT variable 

Create a SUBPOP FLAG to denote Persons (26-30, high income, uninsured) IN FIRST
YEAR

 *********************************************************************************/;

=======
/*******************************/

/* Create a pooled dataset based off of 3 data files */
/* Insurance coverage, age, poverty category, as well as variables for CLUSTER, STRATA, and WEIGHT are kept */
/* Divide the LONGWT VARIABLE by 3 because we are now dealing with datasets in 3 years - assign to the POOLWT variable */
/* Create a SUBPOP FLAG to denote Persons (26-30, high income, uninsured) IN FIRST YEAR */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA POOL;
	LENGTH INSCOVY1 INSCOVY2 PANEL AGEY1X POVCATY1 VARSTR VARPSU 8;
	SET CDATA.H164 (KEEP=DUPERSID INSCOVY1 INSCOVY2 LONGWT VARSTR VARPSU POVCATY1 
		AGEY1X PANEL) CDATA.H172 (KEEP=DUPERSID INSCOVY1 INSCOVY2 LONGWT VARSTR 
		VARPSU POVCATY1 AGEY1X PANEL) CDATA.H183 (KEEP=DUPERSID INSCOVY1 INSCOVY2 
		LONGWT VARSTR VARPSU POVCATY1 AGEY1X PANEL);
	POOLWT=LONGWT/3;

	IF INSCOVY1=3 AND 26 LE AGEY1X LE 30 AND POVCATY1=5 THEN
		SUBPOP=1;
	ELSE
		SUBPOP=2;
	LABEL 
		SUBPOP='POPULATION WITH AGE=26-30, UNINSURED, AND HIGH INCOME IN FIRST YEAR' 
		INSCOVY2="HEALTH INSURANCE COVERAGE INDICATOR IN YEAR 2";
RUN;

<<<<<<< HEAD
/* Check missing values on the combined dataset (2015 and 2016)
(N provides # of observations, while NMISS provides
# of observations missing) */

=======
/* Check missing values on the combined dataset (2015 and 2016) */
/* (N provides # of observations, while NMISS provides # of observations missing) */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC MEANS DATA=POOL N NMISS;
	TITLE3 "CHECK MISSING VALUES ON THE COMBINED DATA";
RUN;

<<<<<<< HEAD
/**********************************************************************************

Create FREQ count for SUBPOP Flag (26-30, high income, uninsured)

Create FREQ display for SUBPOP FLAG (26-30, high income, uninsured) By Survey Panel

Create FREQ display for SUBPOP FLAG (26-30, high income, uninsured)

Insurance Coverage Indicator, Age as of 12/31/12, and Poverty Category in first year

 *********************************************************************************/;

=======
/* Create FREQ count for SUBPOP Flag (26-30, high income, uninsured)
/* Create FREQ display for SUBPOP FLAG (26-30, high income, uninsured) By Survey Panel */
/* Create FREQ display for SUBPOP FLAG (26-30, high income, uninsured) */
/* Insurance Coverage Indicator, Age as of 12/31/12, and Poverty Category in first year */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FREQ DATA=POOL;
	TABLES SUBPOP SUBPOP*PANEL SUBPOP*INSCOVY1*AGEY1X*POVCATY1/LIST MISSING;
	FORMAT AGEY1X AGE. POVCATY1 POVCAT. INSCOVY1 INSF.;
	TITLE3 'SUPPORTING CROSSTAB FOR THE CREATION OF THE SUBPOP FLAG';
RUN;

/* Turn all graphs off */
ODS GRAPHICS OFF;

/* Suppress the printing of output */
ODS EXCLUDE ALL;

<<<<<<< HEAD
/**********************************************************************************

Estimate Insurance Coverage Indicator for 2nd year of SUBPOP 
(26-30, high income, uninsured)

Calculate the estimated proportion of Insurance Coverage Indicator for 
SUBPOP in Year 2

Pipe DOMAIN output to temporary dataset for further processing by 
PROC PRINT procedure

 *********************************************************************************/;

=======
/* Estimate Insurance Coverage Indicator for 2nd year of SUBPOP (26-30, high income, uninsured) */
/* Calculate the estimated proportion of Insurance Coverage Indicator for SUBPOP in Year 2 */
/* Pipe DOMAIN output to temporary dataset for further processing by PROC PRINT procedure */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=POOL NOBS MEAN STDERR;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT POOLWT;
	VAR INSCOVY2;
	CLASS INSCOVY2;
	FORMAT INSCOVY2 INSF.;
	DOMAIN SUBPOP('1');
	ODS OUTPUT DOMAIN=work.domain_results;
<<<<<<< HEAD
	TITLE3 'INSURANCE STATUS IN THE SECOND YEAR FOR THOSE W/ AGE=26-30, 
	UNINSURED WHOLE YEAR, AND HIGH INCOME IN THE FIRST YEAR';
=======
	TITLE3 'INSURANCE STATUS IN THE SECOND YEAR FOR THOSE W/ AGE=26-30, UNINSURED WHOLE YEAR, AND HIGH INCOME IN THE FIRST YEAR';
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
RUN;

/* Unsuppress the printing of output */
ODS EXCLUDE NONE;

<<<<<<< HEAD
/**********************************************************************************

Print the results of the DOMAIN table from the dataset output above
NOOBS= SUPPRESS # OF OBSERVATIONS
SPLIT= SPLIT ON DESIGNATED FIELD IN COLUMN HEADINGS
VAR specifies the designated variables to display
LABEL and FORMAT provide appropriate display opptions
Display Estimated Insurance Coverage Status for SUBPOP in 2nd Year 

 *********************************************************************************/;

=======
/* Print the results of the DOMAIN table from the dataset output above */
/* NOOBS= SUPPRESS # OF OBSERVATIONS */
/* SPLIT= SPLIT ON DESIGNATED FIELD IN COLUMN HEADINGS */
/* VAR specifies the designated variables to display */
/* LABEL and FORMAT provide appropriate display opptions */
/* Display Estimated Insurance Coverage Status for SUBPOP in 2nd Year */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
proc print data=work.domain_results noobs split='*';
	var VARLEVEL N mean StdErr;
	label mean='Proportion' StdErr='SE of Proportion';
	format N Comma12. mean comma9.3 stderr 9.6;
<<<<<<< HEAD
	TITLE3 'INSURANCE STATUS IN THE SECOND YEAR FOR THOSE W/ AGE=26-30, 
	UNINSURED WHOLE YEAR, AND HIGH INCOME IN THE FIRST YEAR';
=======
	TITLE3 'INSURANCE STATUS IN THE SECOND YEAR FOR THOSE W/ AGE=26-30, UNINSURED WHOLE YEAR, AND HIGH INCOME IN THE FIRST YEAR';
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
run;

/* Close all the output */
ODS _ALL_ CLOSE;

/* THE PROC PRINTTO null step is required to close the PROC PRINTTO */
PROC PRINTTO;
RUN;