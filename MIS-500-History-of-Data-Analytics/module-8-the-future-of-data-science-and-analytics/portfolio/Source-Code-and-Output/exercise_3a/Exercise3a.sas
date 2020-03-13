/**********************************************************************************

DESCRIPTION:  THIS PROGRAM ILLUSTRATES HOW TO IDENTIFY PERSONS WITH A CONDITION AND
CALCULATE ESTIMATES ON USE AND EXPENDITURES FOR PERSONS WITH THE CONDITION

THE CONDITION USED IN THIS EXERCISE IS DIABETES (CCS CODE=049 OR 050)

DEFINITION OF 61 CONDITIONS BASED ON THE CCS CODE

1  Infectious diseases                                           : CCS CODE = 1-9
2  Cancer                                                        : CCS CODE = 11-45
3  Non-malignant neoplasm                                        : CCS CODE = 46, 47
4  Thyroid disease                                               : CCS CODE = 48
5  Diabetes mellitus                                             : CCS CODE = 49,50
6  Other endocrine, nutritional & immune disorder                : CCS CODE = 51, 52, 54 - 58
7  Hyperlipidemia                                                : CCS CODE = 53
8  Anemia and other deficiencies                                 : CCS CODE = 59
9  Hemorrhagic, coagulation, and disorders of White Blood cells  : CCS CODE = 60-64
10 Mental disorders                                              : CCS CODE = 650-670
11 CNS infection                                                 : CCS CODE = 76-78
12 Hereditary, degenerative and other nervous system disorders   : CCS CODE = 79-81
13 Paralysis                                                     : CCS CODE = 82
14 Headache                                                      : CCS CODE = 84
15 Epilepsy and convulsions                                      : CCS CODE = 83
16 Coma, brain damage                                            : CCS CODE = 85
17 Cataract                                                      : CCS CODE = 86
18 Glaucoma                                                      : CCS CODE = 88
19 Other eye disorders                                           : CCS CODE = 87, 89-91
20 Otitis media                                                  : CCS CODE = 92
21 Other CNS disorders                                           : CCS CODE = 93-95
22 Hypertension                                                  : CCS CODE = 98,99
23 Heart disease                                                 : CCS CODE = 96, 97, 100-108
24 Cerebrovascular disease                                       : CCS CODE = 109-113
25 Other circulatory conditions arteries, veins, and lymphatics  : CCS CODE = 114 -121
26 Pneumonia                                                     : CCS CODE = 122
27 Influenza                                                     : CCS CODE = 123
28 Tonsillitis                                                   : CCS CODE = 124
29 Acute Bronchitis and URI                                      : CCS CODE = 125 , 126
30 COPD, asthma                                                  : CCS CODE = 127-134
31 Intestinal infection                                          : CCS CODE = 135
32 Disorders of teeth and jaws                                   : CCS CODE = 136
33 Disorders of mouth and esophagus                              : CCS CODE = 137
34 Disorders of the upper GI                                     : CCS CODE = 138-141
35 Appendicitis                                                  : CCS CODE = 142
36 Hernias                                                       : CCS CODE = 143
37 Other stomach and intestinal disorders                        : CCS CODE = 144- 148
38 Other GI                                                      : CCS CODE = 153-155
39 Gallbladder, pancreatic, and liver disease                    : CCS CODE = 149-152
40 Kidney Disease                                                : CCS CODE = 156-158, 160, 161
41 Urinary tract infections                                      : CCS CODE = 159
42 Other urinary                                                 : CCS CODE = 162,163
43 Male genital disorders                                        : CCS CODE = 164-166
44 Non-malignant breast disease                                  : CCS CODE = 167
45 Female genital disorders, and contraception                   : CCS CODE = 168-176
46 Complications of pregnancy and birth                          : CCS CODE = 177-195
47 Normal birth/live born                                        : CCS CODE = 196, 218
48 Skin disorders                                                : CCS CODE = 197-200
49 Osteoarthritis and other non-traumatic joint disorders        : CCS CODE = 201-204
50 Back problems                                                 : CCS CODE = 205
51 Other bone and musculoskeletal  disease                       : CCS CODE = 206-209, 212
52 Systemic lupus and connective tissues disorders               : CCS CODE = 210-211
53 Congenital anomalies                                          : CCS CODE = 213-217
54 Perinatal Conditions                                          : CCS CODE = 219-224
55 Trauma-related disorders                                      : CCS CODE = 225-236, 239, 240, 244
56 Complications of surgery or device                            : CCS CODE = 237, 238
57 Poisoning by medical and non-medical substances               : CCS CODE = 241 - 243
58 Residual Codes                                                : CCS CODE = 259
59 Other care and screening                                      : CCS CODE = 10, 254-258
60 Symptoms                                                      : CCS CODE = 245-252
61 Allergic reactions                                            : CCS CODE = 253


INPUT FILES:  1) C:\MEPS\SAS\DATA\H180.SAS7BDAT (2015 CONDITION PUF DATA)
2) C:\MEPS\SAS\DATA\H181.SAS7BDAT (2015 FY PUF DATA)

 *********************************************************************************/;
<<<<<<< HEAD
OPTIONS NODATE NONUMBER FORMCHAR="|----|+|---+=|-/\<>*";
=======
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9

/* Update log and print output information based on exercise # */  	
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=3a;
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
<<<<<<< HEAD
TITLE2 'EXERCISE 3a SAS: CALCULATE ESTIMATES ON USE
 AND EXPENDITURES FOR PERSONS WITH A CONDITION (DIABETES)';
=======
TITLE2 'EXERCISE 3a SAS: CALCULATE ESTIMATES ON USE AND EXPENDITURES FOR PERSONS WITH A CONDITION (DIABETES)';
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9

/* Create format variables to format output tables
Create format variables for SEX and YESNO */
PROC FORMAT;
	VALUE SEX
     .='TOTAL' 1='MALE' 2='FEMALE';
	VALUE YESNO
     .='TOTAL' 1='YES' 2='NO';
RUN;

/* Summary statistics table 1 */
DATA SUMMARYSET (KEEP=DUID PID CCCODEX);
	SET CDATA.H180;
RUN;

/* Summary statistics table 2 */
DATA SUMMARYSET2 (KEEP=TOTEXP15 TOTSLF15 OBTOTV15);
	SET CDATA.H181;
RUN;

/* Select only the position table in the output */
ODS Select Position;

/* Display summary statistics: File #1 */
PROC CONTENTS DATA=WORK.SUMMARYSET VARNUM;
	Title3 'Summary of H180 Variables';
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
/*********************************************************************\

Create a dataset named DIAB
1) PULL OUT CONDITIONS WITH DIABETES (CCS CODE='049', '050')
FROM 2015 CONDITION PUF - HC180

 *********************************************************************/
=======
/* Create a dataset named DIAB */
/* 1) PULL OUT CONDITIONS WITH DIABETES (CCS CODE='049', '050') FROM 2015 CONDITION PUF - HC180 */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA DIAB;
	SET CDATA.H180;

	IF CCCODEX IN ('049', '050');
RUN;

/* Display summary counts for the values of the CCCODEX variable */
PROC FREQ DATA=DIAB;
	TABLES CCCODEX / LIST MISSING;
	TITLE3 "CHECK CCS CODES FOR DIABETIC CONDITIONS";
RUN;

<<<<<<< HEAD
/*********************************************************************\

2) IDENTIFY PERSONS WHO REPORTED DIABETES
SORT by DUPERSID
Remove any duplicates (NODUPKEY) as we consolidate records by DUPERSID

 *********************************************************************/
=======
/* 2) IDENTIFY PERSONS WHO REPORTED DIABETES */
/* SORT by DUPERSID */
/* Remove any duplicates (NODUPKEY) as we consolidate records by DUPERSID */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SORT DATA=DIAB OUT=DIABPERS (KEEP=DUPERSID) NODUPKEY;
	BY DUPERSID;
RUN;

<<<<<<< HEAD
/*********************************************************************\

3) CREATE A FLAG FOR PERSONS WITH DIABETES IN THE 2015 FY DATA
Merge the original dataset with the dataset for the person
who reported diabetes and create a flag based on the result of the
merge and whether the DUPERSID exists in both tables.
Provide LABELS for out

 *********************************************************************/
=======
/* 3) CREATE A FLAG FOR PERSONS WITH DIABETES IN THE 2015 FY DATA */
/* Merge the original dataset with the dataset for the person who reported diabetes */
/* and create a flag based on the result of the merge and whether the DUPERSID exists in both tables. */
/* Provide LABELS for out */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA FY1;
	MERGE CDATA.H181 (IN=AA) DIABPERS   (IN=BB);
	BY DUPERSID;
	LABEL DIABPERS='PERSONS WHO REPORTED DIABETES';

	IF AA AND BB THEN
		DIABPERS=1;
	ELSE
		DIABPERS=2;
RUN;

<<<<<<< HEAD
/*********************************************************************\

Display FREQ count (UNWEIGHTED) for all persons and 
FREQ by SEX (UNWEIGHTED)
Display as LIST format, MISSING values are treated as valid 
nonmissing levels
Format variables as needed

 *********************************************************************/

=======
/* Display FREQ count (UNWEIGHTED) for all persons and FREQ by SEX (UNWEIGHTED) */
/* Display as LIST format, MISSING values are treated as valid nonmissing levels */
/* Format variables as needed */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FREQ DATA=FY1;
	TABLES DIABPERS DIABPERS * SEX / LIST MISSING;
	FORMAT SEX sex.
         DIABPERS yesno.;
	TITLE3 "UNWEIGHTED # OF PERSONS WHO REPORTED DIABETES, 2015";
RUN;

<<<<<<< HEAD
/*********************************************************************\

Display FREQ count (WEIGHTED) for all persons and FREQ by 
SEX (WEIGHTED)

Display as LIST format, MISSING values are treated as valid 
nonmissing levels

Format variables as needed

 *********************************************************************/

=======
/* Display FREQ count (WEIGHTED) for all persons and FREQ by SEX (WEIGHTED) */
/* Display as LIST format, MISSING values are treated as valid nonmissing levels */
/* Format variables as needed */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FREQ DATA=FY1;
	TABLES DIABPERS DIABPERS * SEX /LIST MISSING;
	WEIGHT PERWT15F;
	FORMAT SEX sex.
         DIABPERS yesno.;
	TITLE3 "WEIGHTED # OF PERSONS WHO REPORTED DIABETES, 2015";
RUN;

/* Turn off graphs */
ODS GRAPHICS OFF;

/* Suppress the listing output temporarily */
<<<<<<< HEAD
*ODS LISTING CLOSE;

/*********************************************************************\

4) CALCULATE ESTIMATES ON EXPENDITURES AND USE

Calculate PERSON-LEVEL Estimates on USE and EXPENDITURES 
entire population (2015)

Calculate PERSON-LEVEL Estimates on USE and EXPENDITURES 
for persons with a condition (DIABETES) (2015)

Calculate PERSON-LEVEL Estimates on USE and EXPENDITURES for 
persons with a condition (DIABETES) (2015) Based on SEX

Pass the output of the domain table to a new TEMP dataset for 
further processing with PROC PRINT

 *********************************************************************/
=======
ODS LISTING CLOSE;

/* 4) CALCULATE ESTIMATES ON EXPENDITURES AND USE */
/* Calculate PERSON-LEVEL Estimates on USE and EXPENDITURES entire population (2015) */
/* Calculate PERSON-LEVEL Estimates on USE and EXPENDITURES for persons with a condition (DIABETES) (2015) */
/* Calculate PERSON-LEVEL Estimates on USE and EXPENDITURES for persons with a condition (DIABETES) (2015) Based on SEX*/
/* Pass the output of the domain table to a new TEMP dataset for further processing with PROC PRINT */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=FY1 NOBS SUMWGT SUM STD MEAN STDERR;
	STRATA VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15F;
	DOMAIN DIABPERS('1') SEX*DIABPERS('1');
	VAR TOTEXP15 TOTSLF15 OBTOTV15;
	ods output domain=work.domain_results;
RUN;

/* Turn the listing ODS output on */
<<<<<<< HEAD
*ODS LISTING;

/*********************************************************************\

Print the PROC SURVEYMENTS output, dropping the column title 
'domain label' and further specifying formatting options
such as blank lines, labels, & suppressing observation numbers

FORMAT the output with commas and number of characters to the 
left and right of the decimal and user defined format variables

PRINT ESTIMATES ON USE AND EXPENDITURES FOR PERSONS WHO REPORTED 
DIABETES FOR 2015 BY SEX

 *********************************************************************/

=======
ODS LISTING;

/* Print the PROC SURVEYMENTS output, dropping the column title 'domain label' and further specifying formatting options */
/* such as blank lines, labels, & suppressing observation numbers */
/* FORMAT the output with commas and number of characters to the left and right of the decimal and user defined format variables */
/* PRINT ESTIMATES ON USE AND EXPENDITURES FOR PERSONS WHO REPRTED DIABETES FOR 2015 BY SEX */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC PRINT DATA=work.domain_results (DROP=DOMAINLABEL) NOOBS LABEL BLANKLINE=3;
	VAR SEX VARNAME N SUMWGT SUM STDDEV MEAN STDERR;
	FORMAT N comma6.0 SUMWGT SUM STDDEV comma17.0 MEAN STDERR comma9.2 DIABPERS 
		yesno.
       SEX sex.;
	TITLE3 
<<<<<<< HEAD
		"ESTIMATES ON USE AND EXPENDITURES FOR PERSONS WHO 
		REPORTED DIABETES, 2015";
RUN; 
=======
		"ESTIMATES ON USE AND EXPENDITURES FOR PERSONS WHO REPORTED DIABETES, 2015";
RUN;
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9

/* Close all the output */
ODS _ALL_ CLOSE;

/* THE PROC PRINTTO null step is required to close the PROC PRINTTO */
PROC PRINTTO;
RUN;