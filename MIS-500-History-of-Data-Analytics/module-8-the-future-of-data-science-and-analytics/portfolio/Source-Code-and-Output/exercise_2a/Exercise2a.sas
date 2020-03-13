/*********************************************************************\

<<<<<<< HEAD
PURPOSE:	THIS PROGRAM GENERATES SELECTED ESTIMATES FOR A 2015
VERSION OF THE MEPS STATISTICS BRIEF # 275: "Trends in Antipsychotics
Purchases and Expenses for the U.S. Civilian Noninstitutionalized
Population, 1997 and 2007"
=======
PURPOSE:	THIS PROGRAM GENERATES SELECTED ESTIMATES FOR A 2015 VERSION OF THE
MEPS STATISTICS BRIEF # 275: "Trends in Antipsychotics Purchases and Expenses for the U.S. Civilian
Noninstitutionalized Population, 1997 and 2007"
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9

(1) FIGURE 1: TOTAL EXPENSE FOR ANTIPSYCHOTICS

(2) FIGURE 2: TOTAL NUMBER OF PURCHASES OF ANTIPSYCHOTICS

<<<<<<< HEAD
(3) FIGURE 3: TOTAL NUMBER OF PERSONS PURCHASING ONE OR MORE
ANTIPSYCHOTICS

(4) FIGURE 4: AVERAGE TOTAL, OUT OF POCKET, AND THIRD PARTY
PAYER EXPENSE FOR ANTIPSYCHOTICS PER PERSON WITH AN ANTIPSYCHOTIC
MEDICINE PURCHASE

INPUT FILES:  (1) C:\MEPS\SAS\DATA\H1181.SAS7BDAT (2015 FULL-YEAR
CONSOLIDATED PUF) (2) C:\MEPS\SAS\DATA\H178A.SAS7BDAT
(2015 PRESCRIBED MEDICINES PUF)

 *********************************************************************/
OPTIONS NODATE NONUMBER PAGESIZE=200 FORMCHAR="|----|+|---+=|-/\<>*";
=======
(3) FIGURE 3: TOTAL NUMBER OF PERSONS PURCHASING ONE OR MORE ANTIPSYCHOTICS

(4) FIGURE 4: AVERAGE TOTAL, OUT OF POCKET, AND THIRD PARTY PAYER EXPENSE
FOR ANTIPSYCHOTICS PER PERSON WITH AN ANTIPSYCHOTIC MEDICINE PURCHASE

INPUT FILES:  (1) C:\MEPS\SAS\DATA\H1181.SAS7BDAT (2015 FULL-YEAR CONSOLIDATED PUF)
(2) C:\MEPS\SAS\DATA\H178A.SAS7BDAT (2015 PRESCRIBED MEDICINES PUF)

 *********************************************************************/
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
/* Update log and print output information based on exercise # */  	
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=2a;
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

TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
TITLE2 "EXERCISE 2.A SAS: Antipsychotics Purchases and Expenses, 2015";

/* Create a dataset with just a few variables for summary statistics */
DATA SUMMARYSET (KEEP=DUID PID DUPERSID RXRECIDX LINKIDX TC1 TC1S1 RXXP15X 
		RXSF15X);
	SET CDATA.H178A;
RUN;

/* Select only the position table in the output */
ODS Select Position;

<<<<<<< HEAD
/*********************************************************************\

Display summary statistics:
Variables, Labels, Type of variable, size of variable:
Basic Summarized overview

 *********************************************************************/
=======
/* Display summary statistics:
/* Variables, Labels, Type of variable, size of variable: Basic Summarized overview */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC DATASETS;
	CONTENTS DATA=WORK.SUMMARYSET VARNUM;
	Title3 'Short list of labels for relevant variables';
	RUN;

	/* Selct all output once again */
	ODS Select All;

<<<<<<< HEAD
	/*********************************************************************\
	
	Create summary statistics for the Sum of Payments and Amount Paid
	(Self or Family) Variables (2015 PRESCRIBED MEDICINES PUF)
	
	 *********************************************************************/
=======
	/* Create summary statistics for the Sum of Payments and Amount Paid (Self or Family) Variables (2015 PRESCRIBED MEDICINES PUF) */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC MEANS DATA=CDATA.H178A n nmiss mean mode min max maxdec=2 range std fw=8;
	var RXXP15X RXSF15X;
	title3 'Sum of Payments(2015), Amount Paid (Self or Family) (2015)';
RUN;

<<<<<<< HEAD
/*********************************************************************\

Create format variables
A variable is created to represent whether or
not a value is greater than zero

 *********************************************************************/
=======
/* Create format variables */
/* A variable is created to represent whether or not a value is greater than zero */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FORMAT;
	VALUE GTZERO 0='0' 0 <- HIGH='>0';
RUN;

<<<<<<< HEAD
/*********************************************************************\

1) IDENTIFY Antipsychotic Drugs Using Therapeutic
Classification (Tc) Codes

Create DRUG dataset based on defintion of antipsychotic drugs

 *********************************************************************/
=======
/* Create DRUG dataset based on defintion of antipsychotic drugs */
/* 1) IDENTIFY Antipsychotic Drugs Using Therapeutic Classification (Tc) Codes */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA DRUG;
	SET CDATA.H178A;

	/*definition of ANTIPSYCHOTIC DRUGS*/
	IF TC1=242 AND TC1S1=251;
RUN;

<<<<<<< HEAD
/* Print a sample (30 observations) of our selected variables
by Person-ID (Including RX Expenditures) */
=======
/* Print a sample (30 observations) of our selected variables by Person-ID (Including RX Expenditures) */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC PRINT DATA=DRUG (OBS=30);
	VAR RXRECIDX LINKIDX TC1 TC1S1 RXXP15X RXSF15X;
	BY DUPERSID;
	TITLE3 "A SAMPLE DUMP FOR PMED RECORDS WITH ANTIPSYCHOTIC DRUGS";
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
	VAR RXXP15X RXSF15X;
	OUTPUT OUT=PERDRUG (DROP=_TYPE_) sum=TOT OOP;
RUN;

<<<<<<< HEAD
/* Print the first 30 values from PERDRUG
Will display the FREQ of RX per person along with TOTEXP and OOP */
=======
/* Print the first 30 values from PERDRUG */
/* QC Check */
/* Will display the FREQ of RX per person along with TOTEXP and OOP */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC PRINT DATA=PERDRUG (OBS=30);
	TITLE3 "A SAMPLE DUMP FOR PERSON-LEVEL EXPENDITURES FOR ANTIPSYCHOTIC DRUGS";
RUN;

<<<<<<< HEAD
/* Create a new dataset where we rename _freq_ to 'N_PHRCHASE'
and create a calculated column called third payer, 
based on total and out of pocket expense */
=======
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
 antipsychotic medication based on the MERGE between datsets)
Additionally, we create appropriate labels for variables.

 *********************************************************************/

=======
/* 3) MERGE THE PERSON-LEVEL EXPENDITURES TO THE ORIG DATASET /*
/* Get the variables from the original dataset that will allow us to compute PROC SURVEYMEANS (STRATRA, CLUSTER, WEIGHT Variables) 
/* Merge dataset with PERDRUG2 created above. */
/* Create a bivariate FLAG (whether or not a person had an expenditure on antipsychotic medication based on the MERGE between datsets) */
/* Additionally, we create appropriate labels for variables. */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA FY;
	MERGE CDATA.H181 (IN=AA KEEP=DUPERSID VARSTR VARPSU PERWT15F) PERDRUG2  (IN=BB 
		KEEP=DUPERSID N_PHRCHASE TOT OOP THIRD_PAYER);
	BY DUPERSID;

	IF AA AND BB THEN
		DO;
			SUB=1;
		END;
	ELSE IF NOT BB THEN
		DO;

			/*FOR PERSONS WITHOUT ANY PURCHASE OF ANTIPSYCHOTIC DRUGS*/
			SUB=2;
			N_PHRCHASE=0;
			THIRD_PAYER=0;
			TOT=0;
			OOP=0;
		END;

	IF AA;
	LABEL THIRD_PAYER='TOTAL-OOP' N_PHRCHASE='# OF PURCHASES PER PERSON' 
		SUB='POPULATION FLAG FOR PERSONS WITH 1+ ANTIPSYCHOTIC DRUGS';
RUN;

<<<<<<< HEAD
/*********************************************************************\

Display Supporting cross-tabs for new variables
Population of N_PHRCHASE>0 with TOT>0 and OOP>0, etc. and FREQ Count
Format as LIST output, MISSING values are treated as valid nonmissing
levels

 *********************************************************************/

=======
/* Display Supporting cross-tabs for new variables */
/* Population of N_PHRCHASE>0 with TOT>0 and OOP>0, etc. and FREQ Count */
/* Format as LIST output, MISSING values are treated as valid nonmissing levels */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FREQ DATA=FY;
	TABLES SUB * N_PHRCHASE * TOT * OOP * THIRD_PAYER / LIST MISSING;
	FORMAT N_PHRCHASE TOT OOP THIRD_PAYER gtzero.;
	TITLE3 "SUPPORTING CROSSTABS FOR NEW VARIABLES";
RUN;

<<<<<<< HEAD
/* Suppress Graph output */
ODS graphics off;

/*********************************************************************\

4) CALCULATE ESTIMATES ON EXPENDITURES AND USE
Display PERSON-LEVEL Estimates on EXPENDITURES and USE FOR 
ANTIPSYCHOTIC DRUGS (2015)

Display Total results: Mean($) TOT Payment, N_PHRCHASE, OOP, 
THIRD_PAYER

Display Results for Subpopulation (Person w/ ANTI-PSYCH EXP.: 
Mean($) TOT Payment, N_PHRCHASE, OOP, THIRD_PAYER

 *********************************************************************/

=======

/* Suppress Graph output */
ODS graphics off;

/* 4) CALCULATE ESTIMATES ON EXPENDITURES AND USE */
/* Display PERSON-LEVEL Estimates on EXPENDITURES and USE FOR ANTIPSYCHOTIC DRUGS (2015) */
/* Display Total results: Mean($) TOT Payment, N_PHRCHASE, OOP, THIRD_PAYER */
/* Display Results for Subpopulation (Person w/ ANTI-PSYCH EXP.: Mean($) TOT Payment, N_PHRCHASE, OOP, THIRD_PAYER */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=FY NOBS SUMWGT SUM STD MEAN STDERR;
	STRATA VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15F;
	DOMAIN SUB('1');
	VAR TOT N_PHRCHASE OOP THIRD_PAYER;
	ODS OUTPUT DOMAIN=work.domain_results;
	TITLE3 
		"PERSON-LEVEL ESTIMATES ON EXPENDITURES AND USE FOR ANTIPSYCHOTIC DRUGS, 2015";
RUN;

<<<<<<< HEAD
=======

>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
/* Close all output */
ODS _ALL_ CLOSE;

/* THE PROC PRINTTO null step is required to close the PROC PRINTTO */
PROC PRINTTO;
RUN;