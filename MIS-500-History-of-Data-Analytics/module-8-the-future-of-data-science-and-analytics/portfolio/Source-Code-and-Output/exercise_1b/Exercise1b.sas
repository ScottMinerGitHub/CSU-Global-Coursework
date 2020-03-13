/**********************************************************************************

<<<<<<< HEAD
DESCRIPTION:  THIS PROGRAM GENERATES THE FOLLOWING ESTIMATES ON NATIONAL
HEALTH CARE EXPENSES BY TYPE OF SERVICE, 2015:
=======
DESCRIPTION:  THIS PROGRAM GENERATES THE FOLLOWING ESTIMATES ON NATIONAL HEALTH CARE EXPENSES BY TYPE OF SERVICE, 2015:
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9

(1) PERCENTAGE DISTRIBUTION OF EXPENSES BY TYPE OF SERVICE
(2) PERCENTAGE OF PERSONS WITH AN EXPENSE, BY TYPE OF SERVICE
(3) MEAN EXPENSE PER PERSON WITH AN EXPENSE, BY TYPE OF SERVICE

DEFINED SERVICE CATEGORIES ARE:
HOSPITAL INPATIENT
AMBULATORY SERVICE: OFFICE-BASED & HOSPITAL OUTPATIENT VISITS
PRESCRIBED MEDICINES
DENTAL VISITS
EMERGENCY ROOM
<<<<<<< HEAD
HOME HEALTH CARE (AGENCY & NON-AGENCY) AND OTHER
(TOTAL EXPENDITURES - ABOVE EXPENDITURE CATEGORIES)
=======
HOME HEALTH CARE (AGENCY & NON-AGENCY) AND OTHER (TOTAL EXPENDITURES - ABOVE EXPENDITURE CATEGORIES)
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9

NOTE: EXPENSES INCLUDE BOTH FACILITY AND PHYSICIAN EXPENSES.

INPUT FILE:   C:\MEPS\SAS\DATA\H181.SAS7BDAT (2015 FULL-YEAR FILE)

 *********************************************************************************/
<<<<<<< HEAD
OPTIONS NODATE NONUMBER PAGESIZE=200 FORMCHAR="|----|+|---+=|-/\<>*";
=======
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
/* Update log and print output information based on exercise # */  		
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=1b;
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
TITLE2 "EXERCISE 1.B SAS: ESTIMATES ON NATIONAL
 HEALTH CARE EXPENSES BY TYPE OF SERVICE, 2015";

/**********************************************************************************

Create format variables
Age is divided into 3 categories: 'ALL AGES','0-64','65+'
A variable is created to represent whether or not a value is greater than zero
A FLAG is created with 3 possible outcomes: 'No or any expense', 'No expense',
'Any expense'

 *********************************************************************************/
=======
/* Create format variables */
/* Age is divided into 3 categories: 'ALL AGES','0-64','65+' */
/* A variable is created to represent whether or not a value is greater than zero */
/* A FLAG is created with 3 possible outcomes: 'No or any expense', 'No expense', 'Any expense' */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FORMAT;
	VALUE AGEF 0-64='0-64' 65-HIGH='65+';
	VALUE AGECAT .='All Ages' 1='0-64' 2='65+';
	VALUE GTZERO 0='$0' 0 <- HIGH='>$0';
	VALUE FLAG .='No or any expense' 0='No expense' 1='Any expense';
RUN;

<<<<<<< HEAD
/**********************************************************************************

/* Create summary statistics for dataset */
/* Display label information for the variables we are going to be analyzing,
along with more descriptive statistics for numerical variables */
*********************************************************************************/

	PROC MEANS DATA=CDATA.H181 n nmiss mean mode min max maxdec=2 range std fw=8;
var TOTEXP15 IPDEXP15 IPFEXP15 OBVEXP15 RXEXP15 OPDEXP15 OPFEXP15 DVTEXP15 
	ERDEXP15 ERFEXP15 HHAEXP15 HHNEXP15 OTHEXP15 VISEXP15 AGE15X AGE42X AGE31X 
	VARSTR VARPSU PERWT15f;
title3 "Descriptive Statistics for selected variables
 in the 2015 CONSOLIDATED DATA FILE (HC-181) ";
RUN;

/**********************************************************************************

READ IN DATA FROM 2015 CONSOLIDATED DATA FILE (HC-181) (keep only specified fields)

Create TOTAL expenditure variables based on type of service
(I.E., Prescription Medicine, Dental, Hospital Inpatient, or
Home Health Care/Other)

Create DIFF variable to serve as a check (Calculate the DIFF of all Total
EXP Variables based on type - TOTAL)

Create ARRAY variabless for FLAG variable creation

Do Loop iterates through Expenditure by Service Array
(I.E. Hospital_inpatient, ambulatory, etc.) and creates FLAG for
corresponding Expenditure by type FLAG

A Summary variable AGE is created from end-of-year and round-specific
AGE variables

 *********************************************************************************/
=======
/* Create summary statistics for dataset */
/* Display label information for the variables we are going to be analyzing, along with more descriptive statistics for numerical variables */
PROC MEANS DATA=CDATA.H181 n nmiss mean mode min max maxdec=2 range std fw=8;
	var TOTEXP15 IPDEXP15 IPFEXP15 OBVEXP15 RXEXP15 OPDEXP15 OPFEXP15 DVTEXP15 
		ERDEXP15 ERFEXP15 HHAEXP15 HHNEXP15 OTHEXP15 VISEXP15 AGE15X AGE42X AGE31X 
		VARSTR VARPSU PERWT15f;
	title "Descriptive Statistics for selected variables in the 2015 CONSOLIDATED DATA FILE (HC-181) ";
RUN;

/* READ IN DATA FROM 2015 CONSOLIDATED DATA FILE (HC-181) (keep only specified fields) */
/* Create TOTAL expenditure variables based on type of service (I.E., Prescription Medicine, Dental, Hospital Inpatient, or Home Health Care/Other)*/
/* Create DIFF variable to serve as a check (Calculate the DIFF of all Total EXP Variables based on type - TOTAL) */
/* Create ARRAY variabless for FLAG variable creation */
/* Do Loop iterates through Expenditure by Service Array (I.E. Hospital_inpatient, ambulatory, etc.) and creates FLAG for corresponding Expenditure by type FLAG */
/* A Summary variable AGE is created from end-of-year and round-specific AGE variables */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA PUF181;
	SET CDATA.H181 (KEEP=TOTEXP15 IPDEXP15 IPFEXP15 OBVEXP15 RXEXP15 OPDEXP15 
		OPFEXP15 DVTEXP15 ERDEXP15 ERFEXP15 HHAEXP15 HHNEXP15 OTHEXP15 VISEXP15 
		AGE15X AGE42X AGE31X VARSTR VARPSU PERWT15f);

	/* Define expenditure variables by type of service  */
	TOTAL=TOTEXP15;
	HOSPITAL_INPATIENT=IPDEXP15 + IPFEXP15;
	AMBULATORY=OBVEXP15 + OPDEXP15 + OPFEXP15 + ERDEXP15 + ERFEXP15;
	PRESCRIBED_MEDICINES=RXEXP15;
	DENTAL=DVTEXP15;
	HOME_HEALTH_OTHER=HHAEXP15 + HHNEXP15 + OTHEXP15 + VISEXP15;

<<<<<<< HEAD
	/*QC CHECK IF THE SUM OF EXPENDITURES BY TYPE OF SERVICE IS EQUAL
	TO TOTAL*/
	DIFF=TOTAL-HOSPITAL_INPATIENT - AMBULATORY   - PRESCRIBED_MEDICINES
              - DENTAL            - HOME_HEALTH_OTHER;

	/* CREATE FLAG (1/0) VARIABLES FOR PERSONS WITH AN EXPENSE,
	BY TYPE OF SERVICE*/
=======
	/*QC CHECK IF THE SUM OF EXPENDITURES BY TYPE OF SERVICE IS EQUAL TO TOTAL*/
	DIFF=TOTAL-HOSPITAL_INPATIENT - AMBULATORY   - PRESCRIBED_MEDICINES
              - DENTAL            - HOME_HEALTH_OTHER;

	/* CREATE FLAG (1/0) VARIABLES FOR PERSONS WITH AN EXPENSE, BY TYPE OF SERVICE  */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
	ARRAY EXX  (6) TOTAL HOSPITAL_INPATIENT AMBULATORY PRESCRIBED_MEDICINES DENTAL 
		HOME_HEALTH_OTHER;
	ARRAY ANYX (6) X_ANYSVCE X_HOSPITAL_INPATIENT X_AMBULATORY 
		X_PRESCRIBED_MEDICINES X_DENTAL X_HOME_HEALTH_OTHER;

<<<<<<< HEAD
	/* Loop checks for any expense greater than 0 and assigns
	appropriate flag by type*/
=======
	/* Loop checks for any expense greater than 0 and assigns appropriate flag by type */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
	DO II=1 TO 6;
		ANYX(II)=0;

		IF EXX(II) > 0 THEN
			ANYX(II)=1;
	END;
	DROP II;

	/* CREATE A SUMMARY VARIABLE FROM END OF YEAR, 42, AND 31 VARIABLES */
	IF AGE15X >=0 THEN
		AGE=AGE15X;
	ELSE IF AGE42X >=0 THEN
		AGE=AGE42X;
	ELSE IF AGE31X >=0 THEN
		AGE=AGE31X;

	/* Define AGECAT Variable based on (0-64)(65+) Age Group */
	IF 0 LE AGE LE 64 THEN
		AGECAT=1;
	ELSE IF AGE  > 64 THEN
		AGECAT=2;
	;
<<<<<<< HEAD
RUN;

/**********************************************************************************

Display the cross-tables for each FLAG Variable By Total Cost based on
Type of Service

QC Frequency Count Check

 *********************************************************************************/
=======
	TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
	TITLE2 "EXERCISE 1.B SAS: NATIONAL HEALTH CARE EXPENSES, 2015";
RUN;

/* Display the cross-tables for each FLAG Variable By Total Cost based on Type of Service */
/* QC Frequency Count Check */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FREQ DATA=PUF181;
	TABLES X_ANYSVCE * TOTAL X_HOSPITAL_INPATIENT * HOSPITAL_INPATIENT 
		X_AMBULATORY * AMBULATORY X_PRESCRIBED_MEDICINES * PRESCRIBED_MEDICINES 
		X_DENTAL * DENTAL X_HOME_HEALTH_OTHER * HOME_HEALTH_OTHER AGECAT*AGE 
		DIFF/LIST MISSING;
	FORMAT TOTAL HOSPITAL_INPATIENT AMBULATORY PRESCRIBED_MEDICINES DENTAL 
		HOME_HEALTH_OTHER gtzero.
           AGE agef.
           X_ANYSVCE X_HOSPITAL_INPATIENT X_AMBULATORY 
		X_PRESCRIBED_MEDICINES X_DENTAL X_HOME_HEALTH_OTHER flag.
           AGECAT agecat.;
	TITLE3 "Supporting crosstabs for the flag variables";
RUN;

/* Turn the graph output off */
ods graphics off;

<<<<<<< HEAD
/**********************************************************************************

Display the ratios of Expence By Type of Service
Each type in the ratio option is divided by the total expenditure

 *********************************************************************************/
=======
/* Display the ratios of Expence By Type of Service */
/* Each type in the ratio option is divided by the total expenditure */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=PUF181 sum;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15f;
	VAR HOSPITAL_INPATIENT AMBULATORY PRESCRIBED_MEDICINES DENTAL 
		HOME_HEALTH_OTHER TOTAL;
	RATIO HOSPITAL_INPATIENT AMBULATORY PRESCRIBED_MEDICINES DENTAL 
		HOME_HEALTH_OTHER / TOTAL;
<<<<<<< HEAD
	TITLE3 'PERCENTAGE DISTRIBUTION OF EXPENSES BY 
	TYPE OF SERVICE (STAT BRIEF #491 FIGURE 1)';
RUN;

/**********************************************************************************

Display percentage of persons with an expense by service type and
estimates for population at large

 *********************************************************************************/
=======
TITLE3 'PERCENTAGE DISTRIBUTION OF EXPENSES BY TYPE OF SERVICE (STAT BRIEF #491 FIGURE 1)';
RUN;

/* Display percentage of persons with an expense by service type and estimates for population at large */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=PUF181 NOBS MEAN STDERR SUM;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15f;
	VAR X_ANYSVCE X_HOSPITAL_INPATIENT X_AMBULATORY X_PRESCRIBED_MEDICINES 
		X_DENTAL X_HOME_HEALTH_OTHER;
<<<<<<< HEAD
	TITLE3 'PERCENTAGE OF PERSONS WITH AN EXPENSE, BY TYPE OF SERVICE';
RUN;

/**********************************************************************************

Display the estimated average expenditure for the U.S. population
Display the estimated average expenditure for the U.S. population based on AGECAT
Display the estimated average expenditure for the U.S. population
for those w/ an EXPENSE, based on AGECAT
Output results of Statistics table and domain table to datasets in the
TEMPORARY WORK Library for later processing in PROC PRINT

 *********************************************************************************/
=======
TITLE3 'PERCENTAGE OF PERSONS WITH AN EXPENSE, BY TYPE OF SERVICE';
RUN;

/* Display the estimated average expenditure for the U.S. population */
/* Display the estimated average expenditure for the U.S. population based on AGECAT */
/* Display the estimated average expenditure for the U.S. population for those w/ an EXPENSE, based on AGECAT */
/* Output results of Statistics table and domain table to datasets in the TEMPORARY WORK Library for later processing in PROC PRINT */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=PUF181 MEAN NOBS SUMWGT STDERR SUM;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	VAR TOTAL;
	DOMAIN AGECAT AGECAT*X_ANYSVCE('1');
	WEIGHT PERWT15f;
	FORMAT AGECAT agecat.;
	ods output Statistics=work.Overall_results domain=work.domain_results;
<<<<<<< HEAD
	TITLE3 'MEAN TOTAL EXPENSE PER PERSON WITH AN 
	EXPENSE, AGE 0-64, AND AGE 65+ (via ODS Output)';
=======
	TITLE3 'MEAN TOTAL EXPENSE PER PERSON WITH AN EXPENSE, AGE 0-64, AND AGE 65+ (via ODS Output)';
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
RUN;

/* Create a new dataset based on the combined ODS OUTPUT above */
data combine;
	set work.Overall_results work.domain_results;
run;

<<<<<<< HEAD
/**********************************************************************************

Print the output of the combined results with appropriate formatting
and labels

Combine all of the results above into one table that is more easily readable
with appropriate formatting and labels

 *********************************************************************************/
=======
/* Print the output of the combined results with appropriate formatting and labels */
/* Combine all of the results above into one table that is more easily readable with appropriate formatting and labels */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
proc print data=combine noobs split='*';
	var AGECAT X_ANYSVCE N SumWgt mean StdErr Sum stddev;
	label AGECAT='Age Group' X_ANYSVCE='Expense*Category*(Flag)' 
		SumWgt='Population*Size' mean='Mean($)' StdErr='SE of Mean($)' 
		Sum='Total*Expense ($)' Stddev='SE of*Total Expense($)';
	format N SumWgt Comma12. mean comma7. stderr 7.3 sum Stddev comma17.
        X_ANYSVCE flag.;
<<<<<<< HEAD
	Title3 'MEAN TOTAL EXPENSE FOR ALL AGES, 
	BY AGE GROUP, AND BY AGE GROUP WITH AN EXPENSE';
run;

/**********************************************************************************

The following perform a simliar pattern analysis for each of the remaining
types of services.

The code in the workshop did not combine the results of the Statistics and
the domain tables,as it did in the above example with X_ANYSVCE.

Similar statistics to those above are generated for each type of service,
though the output is not combined into one table as it is above.


Display the estimated average expenditure for the U.S. population
Display the estimated average expenditure for the U.S. population per
person with an inpatient expense
Display the estimated average expenditure for the U.S. population
per person with an inpatient expense based on AGECAT

 *********************************************************************************/
=======
    Title3 'MEAN TOTAL EXPENSE FOR ALL AGES, BY AGE GROUP, AND BY AGE GROUP WITH AN EXPENSE';  
run;


/* ********************************************* 
/* The following perform a simliar pattern analysis for each of the remaining types of services.
/* The code in the workshop did not combine the results of the Statistics and the domain tables,
/* as it did in the above example with X_ANYSVCE. 
/* Similar statistics to those above are generated for each type of service, though the output 
/* is not combined into one table as it is above.   
/* ********************************************* */

/* Display the estimated average expenditure for the U.S. population */ 
/* Display the estimated average expenditure for the U.S. population per person with an inpatient expense */
/* Display the estimated average expenditure for the U.S. population per person with an inpatient expense based on AGECAT */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=PUF181 NOBS MEAN SUMWGT STDERR SUM;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15f;
	VAR HOSPITAL_INPATIENT;
	DOMAIN X_HOSPITAL_INPATIENT('1') AGECAT*X_HOSPITAL_INPATIENT ('1');
	FORMAT AGECAT agecat.;
<<<<<<< HEAD
	TITLE3 'MEAN HOSPITAL INPATIENT EXPENSE PER PERSON WITH 
	AN INPATIENT EXPENSE, AGE 0-64, AND AGE 65+';
RUN;

/**********************************************************************************

Display the estimated average expenditure for the U.S. population.
Display the estimated average expenditure for the U.S. population
per person with an ambulance expense
Display the estimated average expenditure for the U.S. population per person 
with an ambulance expense based on AGECAT

 *********************************************************************************/
=======
TITLE3 'MEAN HOSPITAL INPATIENT EXPENSE PER PERSON WITH AN INPATIENT EXPENSE, AGE 0-64, AND AGE 65+';
RUN;


/* Display the estimated average expenditure for the U.S. population */ 
/* Display the estimated average expenditure for the U.S. population per person with an ambulance expense */
/* Display the estimated average expenditure for the U.S. population per person with an ambulance expense based on AGECAT */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=PUF181 NOBS MEAN SUMWGT STDERR SUM;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15f;
	VAR AMBULATORY;
	DOMAIN X_AMBULATORY('1') AGECAT*X_AMBULATORY('1');
	FORMAT AGECAT agecat.;
<<<<<<< HEAD
	TITLE3 'MEAN AMBULATORY EXPENSE PER PERSON WITH
	AN AMBULATORY EXPENSE, AGE 0-64, AND AGE 65+';
RUN;

/**********************************************************************************

Display the estimated average expenditure for the U.S. population

Display the estimated average expenditure for the U.S. population per person 
with a prescribed medicine expense

Display the estimated average expenditure for the U.S. population per person 
with a prescribed medicine expense based on AGECAT

 *********************************************************************************/

PROC SURVEYMEANS DATA=PUF181 MEAN NOBS SUMWGT STDERR SUM
STRATUM VARSTR;
CLUSTER VARPSU;
WEIGHT PERWT15f;
VAR PRESCRIBED_MEDICINES;
DOMAIN X_PRESCRIBED_MEDICINES('1') AGECAT*X_PRESCRIBED_MEDICINES('1');
FORMAT AGECAT agecat.;
TITLE3 'MEAN PRESCRIPTION MEDICINE EXPENSE PER PERSON 
WITH A PRESCRIPTION MEDICINE EXPENSE, AGE 0-64, AND AGE 65+';
RUN;

/**********************************************************************************

Display the estimated average expenditure for the U.S. population 

Display the estimated average expenditure for the U.S. population per person 
with a dental expense 

Display the estimated average expenditure for the U.S. population per person 
with a dental expense based on AGECAT

 *********************************************************************************/

=======
TITLE3 'MEAN AMBULATORY EXPENSE PER PERSON WITH AN AMBULATORY EXPENSE, AGE 0-64, AND AGE 65+';
RUN;

/* Display the estimated average expenditure for the U.S. population */ 
/* Display the estimated average expenditure for the U.S. population per person with a prescribed medicine expense */
/* Display the estimated average expenditure for the U.S. population per person with a prescribed medicine expense based on AGECAT */
PROC SURVEYMEANS DATA=PUF181 MEAN NOBS SUMWGT STDERR SUM;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15f;
	VAR PRESCRIBED_MEDICINES;
	DOMAIN X_PRESCRIBED_MEDICINES('1') AGECAT*X_PRESCRIBED_MEDICINES('1');
	FORMAT AGECAT agecat.;
TITLE3 'MEAN PRESCRIPTION MEDICINE EXPENSE PER PERSON WITH A PRESCRIPTION MEDICINE EXPENSE, AGE 0-64, AND AGE 65+';
RUN;

/* Display the estimated average expenditure for the U.S. population */ 
/* Display the estimated average expenditure for the U.S. population per person with a dental expense */
/* Display the estimated average expenditure for the U.S. population per person with a dental expense based on AGECAT */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=PUF181 MEAN NOBS SUMWGT STDERR SUM;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15f;
	VAR DENTAL;
	DOMAIN X_DENTAL('1') AGECAT*X_DENTAL('1');
	FORMAT AGECAT agecat.;
<<<<<<< HEAD
	TITLE3 
		'MEAN DENTAL EXPENSE PER PERSON WITH A DENATL 
		EXPENSE, AGE 0-64, AND AGE 65+';
RUN;

/**********************************************************************************

Display the estimated average expenditure for the U.S. population 

Display the estimated average expenditure for the U.S. population per 
person with a home health expense

Display the estimated average expenditure for the U.S. population per person
with a home health expense based on AGECAT 

 *********************************************************************************/

=======
TITLE3 'MEAN DENTAL EXPENSE PER PERSON WITH A DENATL EXPENSE, AGE 0-64, AND AGE 65+';
RUN;


/* Display the estimated average expenditure for the U.S. population */ 
/* Display the estimated average expenditure for the U.S. population per person with a home health expense */
/* Display the estimated average expenditure for the U.S. population per person with a home health expense based on AGECAT */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=PUF181 MEAN NOBS SUMWGT STDERR SUM;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15f;
	VAR HOME_HEALTH_OTHER;
	DOMAIN X_HOME_HEALTH_OTHER('1') AGECAT*X_HOME_HEALTH_OTHER('1');
	FORMAT AGECAT agecat.;
<<<<<<< HEAD
	TITLE3 'MEAN OTHER EXPENSE (INCLUDING HOME HEALTH EXPENSE) PER PERSON WITH 
	AN OTHER  EXPENSE, AGE 0-64, AND AGE 65+';
RUN;

ods select all;
TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
TITLE2 "EXERCISE 1.B SAS: ESTIMATES ON NATIONAL HEALTH 
CARE EXPENSES BY TYPE OF SERVICE, 2015";

/**********************************************************************************

Develop code fot t-test.

Analyze AGE Category by Insurance Service Type

 *********************************************************************************/

PROC TTEST DATA=WORK.PUF181;
	CLASS AGECAT;
	VAR TOTAL HOSPITAL_INPATIENT AMBULATORY PRESCRIBED_MEDICINES DENTAL 
		HOME_HEALTH_OTHER;
	TITLE3 "Additional T-Test for Type of Service By AGECAT";
	FORMAT AGECAT agecat.;
=======
TITLE3 'MEAN  OTHER EXPENSE (INCLUDING HOME HEALTH EXPENSE) PER PERSON WITH AN OTHER  EXPENSE, AGE 0-64, AND AGE 65+';
RUN;

PROC TTEST DATA=PUF181;
CLASS AGECAT;
VAR TOTAL HOSPITAL_INPATIENT AMBULATORY PRESCRIBED_MEDICINES DENTAL HOME_HEALTH_OTHER;
FORMAT AGECAT agecat.;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
RUN;

PROC PRINTTO;
RUN;