/*********************************************************************\

<<<<<<< HEAD
PURPOSE:	THIS PROGRAM GENERATES SELECTED ESTIMATES
FOR A 2016 VERSION OF THE Purchases and Expenses for Narcotic
analgesics or Narcotic analgesic combos

(1) FIGURE 1: TOTAL EXPENSE FOR Narcotic analgesics or Narcotic
analgesic combos

(2) FIGURE 2: TOTAL NUMBER OF PURCHASES OF Narcotic analgesics or
Narcotic analgesic combos

(3) FIGURE 3: TOTAL NUMBER OF PERSONS PURCHASING ONE OR MORE Narcotic
analgesics or Narcotic analgesic combos

(4) FIGURE 4: AVERAGE TOTAL, OUT OF POCKET, AND THIRD PARTY PAYER
EXPENSE FOR Narcotic analgesics or Narcotic analgesic combos PER
PERSON WITH AN Narcotic analgesics or Narcotic analgesic combos
MEDICINE PURCHASE

INPUT FILES:  (1) C:\MEPS\SAS\DATA\H1192.SAS7BDAT
(2016 FULL-YEAR CONSOLIDATED PUF)(2) C:\MEPS\SAS\DATA\H188A.SAS7BDAT
(2016 PRESCRIBED MEDICINES PUF)

 *********************************************************************/
OPTIONS NODATE NONUMBER FORMCHAR="|----|+|---+=|-/\<>*";
=======
PURPOSE:	THIS PROGRAM GENERATES SELECTED ESTIMATES FOR A 2016 VERSION OF THE Purchases and Expenses for Narcotic analgesics or Narcotic analgesic combos


(1) FIGURE 1: TOTAL EXPENSE FOR Narcotic analgesics or Narcotic analgesic combos

(2) FIGURE 2: TOTAL NUMBER OF PURCHASES OF Narcotic analgesics or Narcotic analgesic combos

(3) FIGURE 3: TOTAL NUMBER OF PERSONS PURCHASING ONE OR MORE Narcotic analgesics or Narcotic analgesic combos

(4) FIGURE 4: AVERAGE TOTAL, OUT OF POCKET, AND THIRD PARTY PAYER EXPENSE
FOR Narcotic analgesics or Narcotic analgesic combos PER PERSON WITH AN Narcotic analgesics or Narcotic analgesic combos MEDICINE PURCHASE

INPUT FILES:  (1) C:\MEPS\SAS\DATA\H1192.SAS7BDAT (2016 FULL-YEAR CONSOLIDATED PUF)
(2) C:\MEPS\SAS\DATA\H188A.SAS7BDAT (2016 PRESCRIBED MEDICINES PUF)

 *********************************************************************/
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
/* Update log and print output information based on exercise # */  		
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=2b;
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

<<<<<<< HEAD
TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
TITLE2 "EXERCISE 2b SAS: Narcotic analgesics or Narcotic analgesic 
	combos, 2016";

/* Create a dataset with just a few variables for summary 
statistics */
=======

TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
TITLE2 
	"EXERCISE 2b SAS: Narcotic analgesics or Narcotic analgesic combos, 2016";

/* Create a dataset with just a few variables for summary statistics */	
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA SUMMARYSET (KEEP=DUID PID DUPERSID RXRECIDX LINKIDX TC1 TC1S1 RXXP16X 
		RXSF16X);
	SET CDATA.H188A;
RUN;

/* Select only the position table in the output */
ODS Select Position;

<<<<<<< HEAD
/*********************************************************************\

Display summary statistics:
Variables, Labels, Type of variable, size of variable:
Basic Summarized overview

 *********************************************************************/
PROC DATASETS;
	CONTENTS DATA=WORK.SUMMARYSET VARNUM;
	Title3 'Short list of labels for relevant variables';
	RUN;

	/* Selct all output once again */
	ODS Select All;

	/* Create summary statistics for the Sum of Payments
	and Amount Paid (Self or Family) Variables
	(2016 PRESCRIBED MEDICINES PUF) */
PROC MEANS DATA=CDATA.H188A n nmiss mean mode min max maxdec=2 range std fw=8;
	var RXXP16X RXSF16X;
	title3 'Sum of Payments, Amount Paid (Self or Family)';
RUN;

/* Create format variables
A variable is created to represent whether or
not a value is greater than zero */
=======
/* Display summary statistics:
/* Variables, Labels, Type of variable, size of variable: Basic Summarized overview */
PROC DATASETS;
	CONTENTS DATA=WORK.SUMMARYSET VARNUM;
	Title 'Short list of labels for relevant variables';
	RUN;
	
	/* Selct all output once again */
	ODS Select All;

	/* Create summary statistics for the Sum of Payments and Amount Paid (Self or Family) Variables (2016 PRESCRIBED MEDICINES PUF) */
PROC MEANS DATA=CDATA.H188A n nmiss mean mode min max maxdec=2 range std fw=8;
	var RXXP16X RXSF16X;
	title 'Sum of Payments, Amount Paid (Self or Family)';
RUN;

/* Create format variables
A variable is created to represent whether or not a value is greater than zero */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FORMAT;
	VALUE GTZERO 0='0' 0 <- HIGH='>0';
RUN;

<<<<<<< HEAD
/*********************************************************************\

1) IDENTIFY Narcotic analgesics or Narcotic analgesic combos
USING THERAPEUTIC CLASSIFICATION (TC) CODES

Create DRUG dataset based on defintion of Narcotic analgesics

 *********************************************************************/
=======
/* Create DRUG dataset based on defintion of Narcotic analgesics */
/*1) IDENTIFY Narcotic analgesics or Narcotic analgesic combos USING THERAPEUTIC CLASSIFICATION (TC) CODES*/
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA DRUG;
	SET CDATA.H188A;

	/*definition of Narcotic analgesics or Narcotic analgesic combos*/
	IF TC1S1_1 IN (60, 191);
<<<<<<< HEAD
RUN;

/* Print a sample (30 observations) of our selected variables 
by Person-ID (Including RX Expenditures) */
PROC PRINT DATA=DRUG (OBS=30);
	TITLE3 "A SAMPLE DUMP FOR PMED RECORDS WITH Narcotic 
	analgesics or Narcotic analgesic combos";
=======

RUN;

/* Print a sample (30 observations) of our selected variables by Person-ID (Including RX Expenditures) */
PROC PRINT DATA=DRUG (OBS=30);
TITLE3 "A SAMPLE DUMP FOR PMED RECORDS WITH Narcotic analgesics or Narcotic analgesic combos";
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
	VAR RXRECIDX LINKIDX TC1S1_1 RXXP16X RXSF16X;
	BY DUPERSID;
RUN;

<<<<<<< HEAD
/* 2) SUM DATA TO PERSON-LEVEL (Total out OOP Expenditures)
Output to a dataset named: PERDRUG */
=======
/* 2) SUM DATA TO PERSON-LEVEL (Total out OOP Expenditures) */
/* Output to a dataset named: PERDRUG */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SUMMARY DATA=DRUG NWAY;
	CLASS DUPERSID;
	VAR RXXP16X RXSF16X;
	OUTPUT OUT=PERDRUG (DROP=_TYPE_) sum=TOT OOP;
RUN;

/* Print the first 30 values from PERDRUG */
/* QC Check */
/* Will display the FREQ of RX per person along with TOTEXP and OOP */
PROC PRINT DATA=PERDRUG (OBS=30);
<<<<<<< HEAD
	TITLE3 "A SAMPLE DUMP FOR PERSON-LEVEL EXPENDITURES FOR Narcotic
	analgesics or Narcotic analgesic combos";
RUN;

/* Create a new dataset where we rename _freq_ to 'N_PHRCHASE' 
and create a calculated column called third payer, based 
on total and out of pocket expense */
=======
TITLE3 "A SAMPLE DUMP FOR PERSON-LEVEL EXPENDITURES FOR Narcotic analgesics or Narcotic analgesic combos";
RUN;

/* Create a new dataset where we rename _freq_ to 'N_PHRCHASE' and create a calculated column
 called third payer, based on total and out of pocket expense */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA PERDRUG2;
	SET PERDRUG;
	RENAME _FREQ_=N_PHRCHASE;
	THIRD_PAYER=TOT - OOP;
RUN;

<<<<<<< HEAD
/*********************************************************************\

3) MERGE THE PERSON-LEVEL EXPENDITURES TO THE ORIG DATASET
Get the variables from the original dataset that will allow us
to compute PROC SURVEYMEANS (STRATRA, CLUSTER, WEIGHT Variables)
Merge dataset with PERDRUG2 created above.
Create a bivariate FLAG (whether or not a person had an expenditure on
Narcotic analgesics based on the MERGE between datsets)
Additionally, we create appropriate labels for variables.

 *********************************************************************/
=======

/* 3) MERGE THE PERSON-LEVEL EXPENDITURES TO THE ORIG DATASET /*
/* Get the variables from the original dataset that will allow us to compute PROC SURVEYMEANS (STRATRA, CLUSTER, WEIGHT Variables) 
/* Merge dataset with PERDRUG2 created above. */
/* Create a bivariate FLAG (whether or not a person had an expenditure on Narcotic analgesics based on the MERGE between datsets) */
/* Additionally, we create appropriate labels for variables. */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA FY;
	MERGE CDATA.H192 (IN=AA KEEP=DUPERSID VARSTR VARPSU PERWT16F) PERDRUG2  (IN=BB 
		KEEP=DUPERSID N_PHRCHASE TOT OOP THIRD_PAYER);
	BY DUPERSID;

	IF AA AND BB THEN
		DO;
			SUB=1;
		END;
	ELSE IF NOT BB THEN
		DO;

<<<<<<< HEAD
			/*FOR PERSONS WITHOUT ANY PURCHASE OF Narcotic 
			analgesics or Narcotic analgesic combos*/
=======
			/*FOR PERSONS WITHOUT ANY PURCHASE OF Narcotic analgesics or Narcotic analgesic combos*/
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
			SUB=2;
			N_PHRCHASE=0;
			THIRD_PAYER=0;
			TOT=0;
			OOP=0;
		END;

	IF AA;
<<<<<<< HEAD
	LABEL THIRD_PAYER='TOTAL-OOP' N_PHRCHASE='# OF PURCHASES PER PERSON' 
	SUB='POPULATION FLAG FOR PERSONS WITH 1+ Narcotic analgesics or
	Narcotic analgesic combos';
RUN;

/*********************************************************************\

Display Supporting cross-tabs for new variables
Population of N_PHRCHASE>0 with TOT>0 and OOP>0, etc. and FREQ Count
Format as LIST output, MISSING values are treated as
valid nonmissing levels

 *********************************************************************/
PROC FREQ DATA=FY;
	TABLES SUB * N_PHRCHASE * TOT * OOP * THIRD_PAYER / LIST MISSING;
	FORMAT N_PHRCHASE TOT OOP THIRD_PAYER gtzero.;
	TITLE3 "SUPPORTING CROSSTABS FOR NEW VARIABLES";
RUN;

/*4) CALCULATE ESTIMATES ON USE AND EXPENDITURES*/
/* Suppress the printing of output */
ODS EXCLUDE ALL;

/*********************************************************************\

4) CALCULATE ESTIMATES ON EXPENDITURES AND USE
Calculate PERSON-LEVEL Estimates on EXPENDITURES and USE FOR
NARCOTIC ANALGESICS (2016)

Calculate Total results: Mean($) TOT Payment, N_PHRCHASE, OOP,
THIRD_PAYER

Calculate Results for Subpopulation (Person w/ NARCOTIC ANALGESICS
EXP.: Mean($) TOT Payment, N_PHRCHASE, OOP, THIRD_PAYER

Pipe output of Domain table to new temporary dataset for further
processing via PROC PRINT

 *********************************************************************/
=======
	LABEL THIRD_PAYER='TOTAL-OOP' N_PHRCHASE='# OF PURCHASES PER PERSON' SUB='POPULATION FLAG FOR PERSONS WITH 1+ Narcotic analgesics or Narcotic analgesic combos';
RUN;


/* Display Supporting cross-tabs for new variables */
/* Population of N_PHRCHASE>0 with TOT>0 and OOP>0, etc. and FREQ Count */
/* Format as LIST output, MISSING values are treated as valid nonmissing levels */

PROC FREQ DATA=FY;
	TABLES SUB * N_PHRCHASE * TOT * OOP * THIRD_PAYER / LIST MISSING;
	FORMAT N_PHRCHASE TOT OOP THIRD_PAYER gtzero.;
TITLE3 "SUPPORTING CROSSTABS FOR NEW VARIABLES";
RUN;

/*4) CALCULATE ESTIMATES ON USE AND EXPENDITURES*/

/* Suppress the printing of output */
ODS EXCLUDE ALL;

/* 4) CALCULATE ESTIMATES ON EXPENDITURES AND USE */
/* Calculate PERSON-LEVEL Estimates on EXPENDITURES and USE FOR NARCOTIC ANALGESICS (2016) */
/* Calculate Total results: Mean($) TOT Payment, N_PHRCHASE, OOP, THIRD_PAYER */
/* Calculate Results for Subpopulation (Person w/ NARCOTIC ANALGESICS EXP.: Mean($) TOT Payment, N_PHRCHASE, OOP, THIRD_PAYER */
/* Pipe output of Domain table to new temporary dataset for further processing via PROC PRINT */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=FY NOBS SUMWGT SUM STD MEAN STDERR;
	STRATA VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT16F;
	VAR TOT N_PHRCHASE OOP THIRD_PAYER;
	DOMAIN SUB('1');
	ODS OUTPUT DOMAIN=work.domain_results;
<<<<<<< HEAD
	TITLE3 "PERSON-LEVEL ESTIMATES ON EXPENDITURES AND USE FOR 
	Narcotic analgesics or Narcotic analgesic combos, 2016";
=======
	TITLE3 "PERSON-LEVEL ESTIMATES ON EXPENDITURES AND USE FOR Narcotic analgesics or Narcotic analgesic combos, 2016";
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
RUN;

/* Unsuppress the printing of output */
ODS EXCLUDE NONE;

<<<<<<< HEAD
/* Display Results for Subpopulation (Person w/ NARCOTIC ANALGESICS
EXP) w/ projected estimates for entire U.S. Population */
=======
/* Display Results for Subpopulation (Person w/ NARCOTIC ANALGESICS EXP) w/ projected estimates for entire U.S. Population */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
proc print data=work.domain_results noobs split='*';
	var VARLABEL N SumWgt mean StdErr Sum stddev;
	label SumWgt='Population*Size' mean='Mean' StdErr='SE of Mean' Sum='Total' 
		Stddev='SE of*Total';
	format N SumWgt Comma12. mean comma9.1 stderr 9.4 sum Stddev comma17.;
<<<<<<< HEAD
	TITLE3 "SUBSET THE ESTIMATES FOR PERSONS ONLY WITH 1+ Narcotic
	analgesics or Narcotic analgesic combos";
=======
TITLE4 "SUBSET THE ESTIMATES FOR PERSONS ONLY WITH 1+ Narcotic analgesics or Narcotic analgesic combos";
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
run;

/* Close all the output */
ODS _ALL_ CLOSE;

/* THE PROC PRINTTO null step is required to close the PROC PRINTTO */
PROC PRINTTO;
RUN;