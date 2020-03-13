/**********************************************************************************

<<<<<<< HEAD
DESCRIPTION:  THIS PROGRAM GENERATES THE FOLLOWING ESTIMATES ON NATIONAL
HEALTH CARE EXPENSES, 2016:
=======
DESCRIPTION:  THIS PROGRAM GENERATES THE FOLLOWING ESTIMATES ON NATIONAL HEALTH CARE EXPENSES, 2016:
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9

(1) OVERALL EXPENSES
(2) PERCENTAGE OF PERSONS WITH AN EXPENSE
(3) MEAN EXPENSE PER PERSON WITH AN EXPENSE


INPUT FILE:   C:\MEPS\SAS\DATA\H192.SAS7BDAT (2016 FULL-YEAR FILE)

 *********************************************************************************/;
<<<<<<< HEAD
OPTIONS NODATE NONUMBER PAGESIZE=200 FORMCHAR="|----|+|---+=|-/\<>*";
* Update log and print output information based on exercise;

%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=1a;
%LET logFolderOutput=&folderPath.&exerciseNumber/my-output/;

=======

/* Update log and print output information based on exercise # */  
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=1a;
%LET logFolderOutput=&folderPath.&exerciseNumber/my-output/;
OPTIONS LINESIZE=160 PAGESIZE=79 NODATE FORMCHAR="|----|+|---+=|-/\<>*" 
	PAGENO=1;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
FILENAME MYLOG "&logFolderOutput\Exercise&exerciseNumber._log.TXT";
FILENAME MYPRINT "&logFolderOutput\Exercise&exerciseNumber._OUTPUT.TXT";

PROC PRINTTO LOG=MYLOG PRINT=MYPRINT NEW;
RUN;

<<<<<<< HEAD
TITLE1 '2018 AHRQ MEPS DATA USERS WORKSHOP';
TITLE2 "EXERCISE 1.A SAS: ESTIMATES ON NATIONAL HEALTH CARE EXPENSES, 2016";

/**********************************************************************************

Create format variables
Age is divided into 3 categories: 'ALL AGES','0-64','65+'
A variable is created to represent whether or not a value is greater than zero
A FLAG is created with 3 possible outcomes: 'No or any expense',
'No expense', 'Any expense'

 *********************************************************************************/;

=======
/* Create format variables */
/* Age is divided into 3 categories: 'ALL AGES','0-64','65+' */
/* A variable is created to represent whether or not a value is greater than zero */
/* A FLAG is created with 3 possible outcomes: 'No or any expense', 'No expense', 'Any expense' */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FORMAT;
	VALUE AGEF .='ALL AGES' 0-64='0-64' 65-HIGH='65+';
	VALUE AGECAT .='ALL AGES' 1='0-64' 2='65+';
	VALUE GTZERO 0='0' 0 <- HIGH='>0';
	VALUE FLAG .='No or any expense' 0='No expense' 1='Any expense';
RUN;

<<<<<<< HEAD
* Create summary statistics for dataset;

PROC MEANS DATA=CDATA.H192 n nmiss mean mode min max maxdec=2 range std fw=8;
	var TOTEXP16 AGE16X AGE42X AGE31X VARSTR VARPSU PERWT16F;
	title3 "Descriptive Statistics for age variables and expenditure 
	variables in (2016 FULL-YEAR FILE) dataset";
RUN;

/**********************************************************************************

READ IN DATA FROM 2016 CONSOLIDATED DATA FILE (HC-192)

The Age variable (AGE16X) represents the exact age, calculated from
date of birth and indicates age status as of 12/31/16.

Demographic variables that are round-specific are identified by names
including numbers “xy”, where x and y refer to round numbers of
Panel 20 and Panel 21 respectively.

For example, AGE31X represents the age data relevant to Round 3 of
Panel 20 or Round 1 of Panel 21. (It's Round #3 of Panel 20 because the
31 is marked with an X).

The variables VARSTR and VARPSU on this MEPS data file serve to identify
the sampling strata and primary sampling units required by the
variance estimation programs. In conjunction with the person-level
weight variable (PERWT16F) provided on this file, data for persons
with a positive person-level weight can be used to make estimates
for the civilian noninstitutionalized U.S. population for 2016.

Rename the TOTEXP16 Variable to Total

 *********************************************************************************/;

=======
/* Create summary statistics for dataset*/
PROC MEANS DATA=CDATA.H192 n nmiss mean mode min max maxdec=2 range std fw=8;
	var TOTEXP16 AGE16X AGE42X AGE31X VARSTR VARPSU PERWT16F;
	title3 "Descriptive Statistics for age variables and expenditure variables in (2016 FULL-YEAR FILE) dataset";
RUN;

/* READ IN DATA FROM 2016 CONSOLIDATED DATA FILE (HC-192) */
/* The Age variable (AGE16X) represents the exact age, calculated from date of birth and indicates age status as of 12/31/16. */
/* Demographic variables that are round-specific are identified by names including numbers “xy”, where x and y refer to round numbers of Panel 20 and Panel 21 respectively. */
/* For example, AGE31X represents the age data relevant to Round 3 of Panel 20 or Round 1 of Panel 21. (It's Round #3 of Panel 20 because the 31 is marked with an X) */
/* The variables VARSTR and VARPSU on this MEPS data file serve to identify the sampling strata and primary sampling units required by the variance estimation programs. */
/* In conjunction with the person-level weight variable (PERWT16F) provided on this file, data for persons with a positive person-level weight
can be used to make estimates for the civilian noninstitutionalized U.S. population for 2016. */
/* Rename the TOTEXP16 Variable to Total */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA PUF192;
	SET CDATA.H192 (KEEP=TOTEXP16 AGE16X AGE42X AGE31X VARSTR VARPSU PERWT16F);
	TOTAL=TOTEXP16;

	/* CREATE FLAG (1/0) VARIABLES FOR PERSONS WITH AN EXPENSE */
	X_ANYSVCE=0;

	IF TOTAL > 0 THEN
		X_ANYSVCE=1;

	/* CREATE A SUMMARY VARIABLE FROM END OF YEAR, 42, AND 31 VARIABLES*/
	IF AGE16X >=0 THEN
		AGE=AGE16X;
	ELSE IF AGE42X >=0 THEN
		AGE=AGE42X;
	ELSE IF AGE31X >=0 THEN
		AGE=AGE31X;

	/* CREATE 2 LEVEL AGE CATEGORIZATION VARIABLE (0-64,65+) */
	IF 0 LE AGE LE 64 THEN
		AGECAT=1;
	ELSE IF AGE  > 64 THEN
		AGECAT=2;
RUN;

<<<<<<< HEAD
/**********************************************************************************

Display the X_ANYSVCE FLAG Along side the TOTAL FLAG
Display the AGECAT FLAG Along side the AGE FLAG
Display Frequency counts for cross-tabs. Format as a LIST and treat missing
values as VALID non-missing levels.

 *********************************************************************************/;

=======
/* Display the X_ANYSVCE FLAG Along side the TOTAL FLAG */
/* Display the AGECAT FLAG Along side the AGE FLAG */
/* Display Frequency counts for cross-tabs. Format as a LIST and treat missing values as VALID non-missing levels */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FREQ DATA=PUF192;
	TABLES X_ANYSVCE*TOTAL AGECAT*AGE /LIST MISSING;
	FORMAT TOTAL gtzero.
          AGE agef.;
	TITLE3 "Supporting crosstabs for the flag variables";
RUN;

<<<<<<< HEAD
* Suppress all output of the ODS;
ods graphics off;
ods exclude all;

/**********************************************************************************

Estimate the percentage of individuals with an expense & overall expenses
for the entire population

Estimate the proportion of individuals with an expense in the entire
population of the U.S.

Provide standard error estimations as well

Output the results of the statistics table to be later passed as input the
PROC PRINT statement for printing to the ODS Display

 *********************************************************************************/;

=======
/* Suppress all output of the ODS */
ods graphics off;
ods exclude all;

/* Estimate the percentage of individuals with an expense & overall expenses for the entire population */
/* Estimate the proportion of individuals with an expense in the entire population of the U.S. */
/* Provide standard error estimations as well */
/* Output the results of the statistics table to be later passed as input the the PROC PRINT statement for printing to the ODS Display */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=PUF192 MEAN NOBS SUMWGT STDERR SUM STD;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT16F;
	VAR X_ANYSVCE TOTAL;
	ods output Statistics=work.Overall_results;
	TITLE3 'PERCENTAGE OF PERSONS WITH AN EXPENSE & OVERALL EXPENSES';
RUN;

/* Exclude nothing from the output */
ods exclude none;

<<<<<<< HEAD
/**********************************************************************************

Print the results of the statistics table from the PROC SURVEYMEANS statement above
exclude the # of observations (NOOBS) and split the header on the * symbol
relabel variables for appropriate display output
format variables with commas for readability
Display the percentage of persons with an expense estimated for the entire
population, as well as the proportion

 *********************************************************************************/;

=======
/* Print the results of the statistics table from the PROC SURVEYMEANS statement above */
/* exclude the # of observations (NOOBS) and split the header on the * symbol */
/* relabel variables for appropriate display output */
/* format variables with commas for readability */
/* Display the percentage of persons with an expense estimated for the entire population, as well as the proportion */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
proc print data=work.Overall_results (firstobs=1 obs=1) noobs split='*';
	var N SumWgt mean StdErr Sum stddev;
	label SumWgt='Population*Size' mean='Proportion' StdErr='SE of Proportion' 
		Sum='Persons*with Any*Expense ' 
		Stddev='SE of*Number*Persons*with*Any Expense';
	format N SumWgt Comma12. mean comma7.2 stderr 7.5 sum Stddev comma17.;
	TITLE3 'PERCENTAGE OF PERSONS WITH AN EXPENSE';
run;

<<<<<<< HEAD
/**********************************************************************************

Print additional results from the Statistics table from the PROC SURVEYMEANS
statement above

Begin printing with the 2nd row, exclude the # of observations, and split the
header on the '*' symbol

relabel variables for appropriate display output

format variables with commas for readability

Display the Overall Expenses estimates projected for the entire U.S. population

 *********************************************************************************/;

=======
/* Print additional results from the Statistics table from the PROC SURVEYMEANS statement above */
/* Begin printing with the 2nd row, exclude the # of observations, and split the header on the '*' symbol */
/* relabel variables for appropriate display output */
/* format variables with commas for readability */
/* Display the Overall Expenses estimates projected for the entire U.S. population */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
proc print data=work.Overall_results (firstobs=2) noobs split='*';
	var N SumWgt mean StdErr Sum stddev;
	label SumWgt='Population*Size' mean='Mean($)' StdErr='SE of Mean($)' 
		Sum='Total*Expense ($)' Stddev='SE of*Total Expense($)';
	format N SumWgt Comma12. mean comma9.2 stderr 9.5 sum Stddev comma17.;
	TITLE3 'OVERALL EXPENSES';
run;

/* Exclude everything from the output */
ods exclude all;

<<<<<<< HEAD
/**********************************************************************************

Use the PROC SURVEYMEANS function to estimate the average expense per
person with an expense as well as estimate the average expense per person
with an expense as dependent upon age category (0-64, 65+)

print the output of the domain table to the domain_results dataset in the
temporary WORK library

The domain table will later be printed via the PROC PRINT procedure

 *********************************************************************************/;

=======
/* Use the PROC SURVEYMEANS function to estimate the average expense per person with an expense */
/* as well as estimate the average expense per person with an expense as dependent upon age category (0-64, 65+) */
/* print the output of the domain table to the domain_results dataset in the temporary WORK library */
/* The domain table will later be printed via the PROC PRINT procedure */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=PUF192 MEAN NOBS SUMWGT STDERR SUM STD;
	STRATUM VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT16F;
	VAR TOTAL;
	DOMAIN X_ANYSVCE('1') X_ANYSVCE('1')*AGECAT;
	FORMAT AGECAT agecat.;
	ods output domain=work.domain_results;
	TITLE3 
		'MEAN EXPENSE PER PERSON WITH AN EXPENSE, FOR OVERALL, AGE 0-64, AND AGE 65+';
RUN;

/* Exclude nothing from the output */
ods exclude none;

<<<<<<< HEAD
/**********************************************************************************

Display the results of the PROC SURVEYMEANS procedure above

Display the AGECAT with user-defined formatting, the number of observations (N),
as well as Population Size and Mean($) Estimated Expenditure, etc.

 *********************************************************************************/;

=======
/* Display the results of the PROC SURVEYMEANS procedure above */
/* Display the AGECAT with user-defined formatting, the number of observations (N), as well as Population Size and Mean($) Estimated Expenditure, etc. */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
proc print data=work.domain_results noobs split='*';
	var AGECAT N SumWgt mean StdErr Sum stddev;
	label AGECAT='Age Group' SumWgt='Population*Size' mean='Mean($)' 
		StdErr='SE of Mean($)' Sum='Total*Expense ($)' 
		Stddev='SE of*Total Expense($)';
	format AGECAT agecat. N SumWgt Comma12. mean comma9.1 stderr 9.4 sum Stddev 
		comma17.;
run;

ods graphics on;
<<<<<<< HEAD

/**********************************************************************************

Perform a tTest on the variables AGECAT and TOTAL Expenditure
 
Display MEAN, STD DEV, STD ERR of the MEAN, MIN. and MAX. for each value of AGECAT 

Display 95% CLI for MEAN and STD DEV in each AGECAT group. 

Display 95% CLI for the difference in the group means using a pooled 
estimate vs. Satterthwaite 

Display the results of the t-test for both pooled and Satterthwaite versions 

Display the results of the F-Test for deciding whether the variances 
can be considered equal 

Display Histogram (w/ normal curves, kernel density estimators, and 
boxplots) and Q-Q Plots 

 *********************************************************************************/;

=======
/* Perform a tTest on the variables AGECAT and TOTAL Expenditure */
/* Display MEAN, STD DEV, STD ERR of the MEAN, MIN. and MAX. for each value of AGECAT */
/* Display 95% CLI for MEAN and STD DEV in each AGECAT group. */
/* Display 95% CLI for the difference in the group means using a pooled estimate vs. Satterthwaite */
/* Display the results of the t-test for both pooled and Satterthwaite versions */
/* Display the results of the F-Test for deciding whether the variances can be considered equal */
/* Display Histogram (w/ normal curves, kernel density estimators, and boxplots) and Q-Q Plots */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC TTEST DATA=puf192;
	CLASS AGECAT;
	VAR TOTAL;
	Format AGECAT agecat.;
<<<<<<< HEAD
	Title3 'Independent Group t-Test Example (AGECAT By TOTAL Expenditure)';
=======
	Title 'Independent Group t-Test Example (AGECAT By TOTAL Expenditure)';
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
Run;

/* Close All open ODS output destinations. */
ODS _ALL_ CLOSE;

/* THE PROC PRINTTO null step is required to close the PROC PRINTTO */
PROC PRINTTO;
RUN;