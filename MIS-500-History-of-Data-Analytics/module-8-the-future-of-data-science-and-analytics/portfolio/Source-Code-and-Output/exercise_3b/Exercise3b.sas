/**********************************************************************************

DESCRIPTION:  THIS PROGRAM ILLUSTRATES HOW TO CALCULATE EXPENDITURES FOR ALL EVENTS ASSOCIATED WITH A CONDITION

THE CONDITION USED IN THIS EXERCISE IS DIABETES (CCS CODE=049 OR 050)

THE DEFINITION OF 61 CONDITIONS BASED ON CCS CODE

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


INPUT FILES:  1) C:\MEPS\SAS\DATA\H181.SAS7BDAT    (2015 FY PUF DATA)
2) C:\MEPS\SAS\DATA\H180.SAS7BDAT    (2015 CONDITION PUF DATA)
3) C:\MEPS\SAS\DATA\H178A.SAS7BDAT   (2015 PMED PUF DATA)
4) C:\MEPS\SAS\DATA\H178D.SAS7BDAT   (2015 INPATIENT VISITS PUF DATA)
5) C:\MEPS\SAS\DATA\H178E.SAS7BDAT   (2015 EROM VISITS PUF DATA)
6) C:\MEPS\SAS\DATA\H178F.SAS7BDAT   (2015 OUTPATIENT VISITS PUF DATA)
7) C:\MEPS\SAS\DATA\H178G.SASBDAT   (2015 OFFICE-BASED VISITS PUF DATA)
8) C:\MEPS\SAS\DATA\H178H.SAS7BDAT   (2015 HOME HEALTH PUF DATA)
9) C:\MEPS\SAS\DATA\H178IF1.SAS7BDAT  (2015 CONDITION-EVENT LINK PUF DATA)

 *********************************************************************************/;
<<<<<<< HEAD
OPTIONS NODATE NONUMBER PAGESIZE=200 FORMCHAR="|----|+|---+=|-/\<>*";
=======

>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
/* Update log and print output information based on exercise # */  		
%LET folderPath=/folders/myfolders/sasuser.v94/MEPS/GitHub/MEPS/SAS/workshop_exercises/exercise_;
%LET exerciseNumber=3b;
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

TITLE1 'AHRQ MEPS DATA USERS WORKSHOP -- 2018';
<<<<<<< HEAD
TITLE2 'EXERCISE 3b SAS: CALCULATE EXPENDITURES FOR ALL EVENTS ASSOCIATED 
WITH A CONDITION (DIABETES)';
=======
TITLE2 'EXERCISE 3b SAS: CALCULATE EXPENDITURES FOR ALL EVENTS ASSOCIATED WITH A CONDITION (DIABETES)';
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9

/* Create format variables: greater than zero and greater than or equal to zero */
PROC FORMAT;
	VALUE GTZERO 0='0' 0 <- HIGH='>0';
	VALUE GEZERO 0 - HIGH='GE 0';
RUN;

<<<<<<< HEAD
/*********************************************************************\

1) PULL OUT CONDITIONS WITH DIABETES (CCS CODE='049', '050') 
FROM 2015 CONDITION PUF - HC180
Create a dataset named DIAB 

 *********************************************************************/

=======
/* Create a dataset named DIAB */
/*1) PULL OUT CONDITIONS WITH DIABETES (CCS CODE='049', '050') FROM 2015 CONDITION PUF - HC180*/
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA DIAB;
	SET CDATA.H180;

	IF CCCODEX IN ('049', '050');
RUN;

/* Provide a frequency count of Diabetes condition codes */
PROC FREQ DATA=DIAB;
	TABLES CCCODEX / LIST MISSING;
TITLE3 "CHECK CCS CODES";
RUN;

<<<<<<< HEAD
/*********************************************************************\

2) GET EVENT ID FOR THE DIABETIC CONDITIONS FROM 
CONDITION-EVENT LINK FILE

Merge Diabetes Dataset with the CONDITION-EVENT LINK PUF DATASET

CONDITION-EVENTLINK links an event (outpatient visit, inpatient visit,
ER visit, home health visit, etc.) to a condition (DIABETES)

Add the EVNTIDX field from the linking file, which corresponds 
to a unique record in one of the MEPS event files, HC-178B through 
HC-178H.

Call the dataset DIAB2 

 *********************************************************************/

=======
/* 2) GET EVENT ID FOR THE DIABETIC CONDITIONS FROM CONDITION-EVENT LINK FILE */
/* Merge Diabetes Dataset with the CONDITION-EVENT LINK PUF DATASET */
/* CONDITION-EVENTLINK links an event (outpatient visit, inpatient visit, ER visit, home health visit, etc.) to a condition (DIABETES) */ 
/* Add the EVNTIDX field from the linking file, which corresponds to a unique record in one of the MEPS event files, HC-178B through HC-178H. */
/* Call the dataset DIAB2 */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA DIAB2;
	MERGE DIAB          (IN=AA KEEP=DUPERSID CONDIDX CCCODEX) CDATA.H178IF1 (IN=BB 
		KEEP=CONDIDX EVNTIDX);
	BY CONDIDX;

	IF AA AND BB;
RUN;

<<<<<<< HEAD
/* Review the output we just created by CONDIDX 
(first 20 observations) */
=======
/* Review the output we just created by CONDIDX (first 20 observations) */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC PRINT DATA=DIAB2 (OBS=20);
	BY CONDIDX;
TITLE3 "SAMPLE DUMP FOR CONDITION-EVENT LINK FILE";
RUN;

/*3) DELETE DUPLICATE CASES PER EVENT*/
/* CALL THE OUTPUT DIAB3 */
PROC SORT DATA=DIAB2 (KEEP=DUPERSID EVNTIDX) OUT=DIAB3 NODUPKEY;
	BY EVNTIDX;
RUN;

<<<<<<< HEAD
/* Review the output after deleting duplicated cases 
first 30 observations) */
=======
/* Review the output after deleting duplicated cases (first 30 observations) */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC PRINT DATA=DIAB3 (OBS=30);
TITLE3 "SAMPLE DUMP AFTER DUPLICATE CASES ARE DELETED";
RUN;

<<<<<<< HEAD

/*********************************************************************\

4) SUM UP PMED PURCHASE-LEVEL DATA TO EVENT-LEVEL
(EVNTIDX is not included on the 2015 Prescribed Medicines 
event file, HC-178A;

Rather, on this file the variable for linking with EVNTIDX on the 
CLNK file is LINKIDX.)

Include additional fields representing the event type 
(outpatient visit, inpatient visit, ER visit, etc.) (RXSF15X--RXOUT15X)

Rename fields as discussed above

 *********************************************************************/

=======
/* 4) SUM UP PMED PURCHASE-LEVEL DATA TO EVENT-LEVEL */
/* (EVNTIDX is not included on the 2015 Prescribed Medicines event file, HC-178A; */
/* Rather, on this file the variable for linking with EVNTIDX on the CLNK file is LINKIDX.) */
/* Include additional fields representing the event type (outpatient visit, inpatient visit, ER visit, etc.) (RXSF15X--RXOUT15X) */
/* Rename fields as discussed above */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SORT DATA=CDATA.H178A OUT=PMED (KEEP=LINKIDX RXXP15X RXSF15X--RXOU15X 
		RENAME=(LINKIDX=EVNTIDX));
	BY LINKIDX;
RUN;

<<<<<<< HEAD
/* Summarize the data to the EVENTID Level; Call the output PMED2 */
=======
/* Summarize the data to the EVENTID Level */
/* Call the output PMED2 */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SUMMARY DATA=PMED NWAY;
	CLASS EVNTIDX;
	VAR RXXP15X RXSF15X--RXOU15X;
	OUTPUT OUT=PMED2 SUM=;
RUN;

<<<<<<< HEAD
/*********************************************************************\

5) ALIGN EXP VARIABLES IN DIFFERENT EVENTS WITH THE SAME NAMES 

Prescribed Medications File (keep Event ID and source
of payment and total expenditure) 

Rename variables to keep consistency among source of payment between 
different event types 

 *********************************************************************/

=======
/*5) ALIGN EXP VARIABLES IN DIFFERENT EVENTS WITH THE SAME NAMES */
/* Prescribed Medications File (keep Event ID and source of payment and total expenditure) */
/* rename variables to keep consistency among source of payment between different event types */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA PMED3 (KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP);
	SET PMED2;
	SF=RXSF15X;
	MR=RXMR15X;
	MD=RXMD15X;
	PV=RXPV15X;
	VA=RXVA15X;
	TR=RXTR15X;
	OF=RXOF15X;
	SL=RXSL15X;
	WC=RXWC15X;
	OR=RXOR15X;
	OU=RXOU15X;
	OT=RXOT15X;
	TOTEXP=RXXP15X;

	IF TOTEXP GE 0;
RUN;

<<<<<<< HEAD
/*********************************************************************\

Office-based Medical Provider Visits File (keep ID and source of 
payment)

Rename variables to keep consistency among source of payment 
between different event types

 *********************************************************************/

=======
/* Office-based Medical Provider Visits File (keep ID and source of payment) */
/* rename variables to keep consistency among source of payment between different event types */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA OB (KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP);
	SET CDATA.H178G;
	SF=OBSF15X;
	MR=OBMR15X;
	MD=OBMD15X;
	PV=OBPV15X;
	VA=OBVA15X;
	TR=OBTR15X;
	OF=OBOF15X;
	SL=OBSL15X;
	WC=OBWC15X;
	OR=OBOR15X;
	OU=OBOU15X;
	OT=OBOT15X;
	TOTEXP=OBXP15X;

	IF TOTEXP GE 0;
RUN;
 
<<<<<<< HEAD
/*********************************************************************\

Emergency Room Event File (keep Event ID and source of payment and 
total expenditure)

Rename variables to keep consistency among source of payment 
between different event types

 *********************************************************************/

=======
/* Emergency Room Event File (keep Event ID and source of payment and total expenditure) */
/* rename variables to keep consistency among source of payment between different event types */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA EROM (KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP);
	SET CDATA.H178E;
	SF=ERFSF15X + ERDSF15X;
	MR=ERFMR15X + ERDMR15X;
	MD=ERFMD15X + ERDMD15X;
	PV=ERFPV15X + ERDPV15X;
	VA=ERFVA15X + ERDVA15X;
	TR=ERFTR15X + ERDTR15X;
	OF=ERFOF15X + ERDOF15X;
	SL=ERFSL15X + ERDSL15X;
	WC=ERFWC15X + ERDWC15X;
	OR=ERFOR15X + ERDOR15X;
	OU=ERFOU15X + ERDOU15X;
	OT=ERFOT15X + ERDOT15X;
	TOTEXP=ERXP15X;

	IF TOTEXP GE 0;
RUN;

<<<<<<< HEAD
/*********************************************************************\

Inpatient Event File (keep Event ID and source of payment 
and total expenditure)

Rename variables to keep consistency among source of payment between 
different event types

 *********************************************************************/

=======
/* Inpatient Event File (keep Event ID and source of payment and total expenditure) */
/* rename variables to keep consistency among source of payment between different event types */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA IPAT (KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP);
	SET CDATA.H178D;
	SF=IPFSF15X + IPDSF15X;
	MR=IPFMR15X + IPDMR15X;
	MD=IPFMD15X + IPDMD15X;
	PV=IPFPV15X + IPDPV15X;
	VA=IPFVA15X + IPDVA15X;
	TR=IPFTR15X + IPDTR15X;
	OF=IPFOF15X + IPDOF15X;
	SL=IPFSL15X + IPDSL15X;
	WC=IPFWC15X + IPDWC15X;
	OR=IPFOR15X + IPDOR15X;
	OU=IPFOU15X + IPDOU15X;
	OT=IPFOT15X + IPDOT15X;
	TOTEXP=IPXP15X;

	IF TOTEXP GE 0;
RUN;

<<<<<<< HEAD
/*********************************************************************\

Home Health Visit Event File (keep Event ID and source of payment 
and total expenditure)

Rename variables to keep consistency among source of payment between 
different event types

 *********************************************************************/

=======
/* Home Health Visit Event File (keep Event ID and source of payment and total expenditure) */
/* rename variables to keep consistency among source of payment between different event types */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA HVIS (KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP);
	SET CDATA.H178H;
	SF=HHSF15X;
	MR=HHMR15X;
	MD=HHMD15X;
	PV=HHPV15X;
	VA=HHVA15X;
	TR=HHTR15X;
	OF=HHOF15X;
	SL=HHSL15X;
	WC=HHWC15X;
	OR=HHOR15X;
	OU=HHOU15X;
	OT=HHOT15X;
	TOTEXP=HHXP15X;

	IF TOTEXP GE 0;
RUN;

<<<<<<< HEAD

/*********************************************************************\

Outpatient Event File (keep Event ID and source of 
payment and total expenditure)

Rename variables to keep consistency among source of payment 
between different event types

 *********************************************************************/

=======
/* Outpatient Event File (keep Event ID and source of payment and total expenditure) */
/* rename variables to keep consistency among source of payment between different event types */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA OPAT (KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP);
	SET CDATA.H178F;
	SF=OPFSF15X + OPDSF15X;
	MR=OPFMR15X + OPDMR15X;
	MD=OPFMD15X + OPDMD15X;
	PV=OPFPV15X + OPDPV15X;
	VA=OPFVA15X + OPDVA15X;
	TR=OPFTR15X + OPDTR15X;
	OF=OPFOF15X + OPDOF15X;
	SL=OPFSL15X + OPDSL15X;
	WC=OPFWC15X + OPDWC15X;
	OR=OPFOR15X + OPDOR15X;
	OU=OPFOU15X + OPDOU15X;
	OT=OPFOT15X + OPDOT15X;
	TOTEXP=OPXP15X;

	IF TOTEXP GE 0;
RUN;

<<<<<<< HEAD
/*********************************************************************\

6)  COMBINE ALL EVENTS INTO ONE DATASET
Rename datasets with 2 letter references (i.e. IN=) and keep 
corresponding variables created above

Create an EVNTYP variable to describe the type of event based 
on the original file

Set the EVNTYP variable based on the name of the dataset that was
combined into ALLEVENT Dataset

Create labels for the display output

 *********************************************************************/

=======
/* 6)  COMBINE ALL EVENTS INTO ONE DATASET */
/* Rename datasets with 2 letter references (i.e. IN=) and keep corresponding variables created above */
/* Create an EVNTYP variable to describe the type of event based on the original file */
/* Set the EVNTYP variable based on the name of the dataset that was combined into ALLEVENT Dataset */
/* Create labels for the display output */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA ALLEVENT;
	SET OB   (IN=MV KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP) 
		EROM (IN=ER KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP) 
		IPAT (IN=ST KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP) 
		HVIS (IN=HH KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP) 
		OPAT (IN=OP KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP) 
		PMED3 (IN=RX KEEP=EVNTIDX SF MR MD PV VA TR OF SL WC OR OU OT TOTEXP);
	BY EVNTIDX;
	LENGTH EVNTYP $4;
	LABEL EVNTYP='EVENT TYPE' TOTEXP='TOTAL EXPENDITURE FOR EVENT' 
		SF="SOURCE OF PAYMENT: FAMILY" MR="SOURCE OF PAYMENT: MEDICARE" 
		MD="SOURCE OF PAYMENT: MEDICAID" PV="SOURCE OF PAYMENT: PRIVATE INSURANCE" 
		VA="SOURCE OF PAYMENT: VETERANS" TR="SOURCE OF PAYMENT: TRICARE" 
		OF="SOURCE OF PAYMENT: OTHER FEDERAL" 
		SL="SOURCE OF PAYMENT: STATE & LOCAL GOV" 
		WC="SOURCE OF PAYMENT: WORKERS COMP" OR="SOURCE OF PAYMENT: OTHER PRIVATE" 
		OU="SOURCE OF PAYMENT: OTHER PUBLIC" OT="SOURCE OF PAYMENT: OTHER INSURANCE";

	IF MV OR OP THEN
		EVNTYP='AMBU';
	ELSE IF ER THEN
		EVNTYP='EROM';
	ELSE IF ST THEN
		EVNTYP='IPAT';
	ELSE IF HH THEN
		EVNTYP='HVIS';
	ELSE IF RX THEN
		EVNTYP='PMED';
RUN;

<<<<<<< HEAD
/*********************************************************************\

Display frequency counts for the events combined into 1 file
LIST displays as list output, MISSING treats missing values as
valid nonmissing levels
FORMAT as appropriate

 *********************************************************************/

=======
/* Display frequency counts for the events combined into 1 file */
/* LIST displays as list output, MISSING treats missing values as valid nonmissing levels */
/* FORMAT as appropriate */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC FREQ DATA=ALLEVENT;
	TABLES EVNTYP TOTEXP SF MR MD PV VA TR OF SL WC OR OU OT /LIST MISSING;
	FORMAT TOTEXP SF MR MD PV VA TR OF SL WC OR OU OT gezero.;
TITLE3 "ALL EVENTS ARE COMBINED INTO ONE FILE";
RUN;

/* Print the first 20 observations (ALL EVENTS COMINTED INTO ONE FILE) */
PROC PRINT DATA=ALLEVENT (OBS=20);
RUN;

<<<<<<< HEAD
/*********************************************************************\

7) SUBSET EVENTS TO THOSE ONLY WITH DIABETES
MERGE DIAB3 dataset with ALLEVENT dataset
Create a dataset of all events for DIAB Condition called DIAB4

 *********************************************************************/

=======
/* 7) SUBSET EVENTS TO THOSE ONLY WITH DIABETES */
/* MERGE DIAB3 dataset with ALLEVENT dataset */
/* Create a dataset of all events for DIAB Condition called DIAB4 */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA DIAB4;
	MERGE DIAB3(IN=AA) ALLEVENT(IN=BB);
	BY EVNTIDX;

	IF AA AND BB;
RUN;

<<<<<<< HEAD

/*********************************************************************\

8) CALCULATE ESTIMATES ON EXPENDITURES AND USE, ALL TYPES OF SERVICE
Push output to ALL Dataset
Group by DUPERSID

 *********************************************************************/


=======
/* 8) CALCULATE ESTIMATES ON EXPENDITURES AND USE, ALL TYPES OF SERVICE */
/* Push output to ALL Dataset */
/* Group by DUPERSID */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SUMMARY DATA=DIAB4 NWAY;
	CLASS DUPERSID;
	VAR TOTEXP SF MR MD PV VA TR OF SL WC OR OU OT;
	OUTPUT OUT=ALL SUM=;
RUN;

<<<<<<< HEAD
/*********************************************************************\

Merge the original dataset with the previous dataset to calculate 
estimates on EXPENDITURES and USE for ALL TYPES OF SERVICE per person

Create a FLAG (Subpop.) for people who have at least 1 event 
(Home health visit, ambulance, prescribed medication, emergency room) 
associated with DIAB

Keep only those in Analysis with PERWT15F > 0

 *********************************************************************/

=======
/* Merge the original dataset with the previous dataset to calculate estimates on EXPENDITURES and USE for ALL TYPES OF SERVICE per person */
/* Create a FLAG (Subpop.) for people who have at least 1 event (Home health visit, ambulance, prescribed medication, emergency room) associated with DIAB */
/* Keep only those in Analysis with PERWT15F > 0 */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA FY1;
	MERGE CDATA.H181 (IN=AA KEEP=DUPERSID VARPSU VARSTR 
		PERWT15F /*ADD MORE VARIABLES*/) ALL        (IN=BB KEEP=DUPERSID TOTEXP SF MR 
		MD PV VA TR OF SL WC OR OU OT);
	BY DUPERSID;
	LABEL SUB='PERSONS WHO HAVE AT LEAST 1 EVENT ASSOCIATED WITH DIABETES';

	IF AA AND BB THEN
		SUB=1;
	ELSE IF AA AND NOT BB THEN
		DO;

			/*PERSONS WITHOUT EVENTS WITH DIABETES*/
			SUB=2;
			TOTEXP=0;
			SF=0;
			MR=0;
			MD=0;
			PV=0;
			VA=0;
			TR=0;
			OF=0;
			SL=0;
			WC=0;
			OR=0;
			OU=0;
			OT=0;
		END;

	IF PERWT15F > 0;
RUN;

/* Turn off graphs and suppress output */
ODS GRAPHICS OFF;

/* Close the ODS LISTING output */
ODS LISTING CLOSE;

<<<<<<< HEAD

/*********************************************************************\

Calculate persons with condition (DIAB) who reported EVENT
(home health visit, prescribed medication, ambulance, etc. )

Calculate estimates for all sources of payments for sub-pop 
(persons with DIAB reporting an Event)

 *********************************************************************/

=======
/* Calculate persons with condition (DIAB) who reported EVENT (home health visit, prescribed medication, ambulance, etc. ) */
/* Calculate estimates for all sources of payments for sub-pop (persons with DIAB reporting an Event) */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=FY1 NOBS SUMWGT SUM STD MEAN STDERR;
	STRATA VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15F;
	DOMAIN SUB('1');
	VAR TOTEXP SF MR MD PV VA TR OF SL WC OR OU OT;
	ODS OUTPUT DOMAIN=OUT1;
RUN;

/* Turn output on */
ODS LISTING;

<<<<<<< HEAD
/*********************************************************************\

Display ESTIMATES ON USE AND EXPENDITURES FOR ALL EVENTS 
ASSOCIATED WITH DIABETES FOR 2015 BY SOURCE OF PAYMENTS

 *********************************************************************/

=======
/* Display ESTIMATES ON USE AND EXPENDITURES FOR ALL EVENTS ASSOCIATED WITH DIABETES FOR 2015 BY SOURCE OF PAYMENTS */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC PRINT DATA=OUT1 NOOBS LABEL;
	VAR VARNAME /*VARLABEL*/
	N SUMWGT SUM STDDEV MEAN STDERR;
	FORMAT N comma6.0 SUMWGT SUM STDDEV comma17.0 MEAN STDERR comma9.2;
TITLE3 "ESTIMATES ON USE AND EXPENDITURES FOR ALL EVENTS ASSOCIATED WITH DIABETES, 2015";
RUN;

<<<<<<< HEAD
/*********************************************************************\

9) CALCULATE ESTIMATES ON EXPENDITURES AND USE BY TYPE OF SERVICE

Further consolidate data by summing up to PERSON-EVENT TYPE LEVEL

How many event types per person? 1 AMB, 13 PMED for person with DB
Pass output TOS (Type of Service) Temporary dataset

 *********************************************************************/


=======
/* 9) CALCULATE ESTIMATES ON EXPENDITURES AND USE BY TYPE OF SERVICE */
/* Further consolidate data by summing up to PERSON-EVENT TYPE LEVEL */
/* How many event types per person? 1 AMB, 13 PMED for person with DB */
/* Pass output TOS (Type of Service) Temporary dataset */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SUMMARY DATA=DIAB4 NWAY;
	CLASS DUPERSID EVNTYP;
	VAR TOTEXP SF MR MD PV VA TR OF SL WC OR OU OT;
	OUTPUT OUT=TOS SUM=;
RUN;

<<<<<<< HEAD
/* Drop the _TYPE_ Field and rename _FREQ_ to N_VISITS
Call the dataset TOS2 (TYPE OF SERVICE 2) */
=======
/* Drop the _TYPE_ Field and rename _FREQ_ to N_VISITS */
/* Call the dataset TOS2 (TYPE OF SERVICE 2) */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA TOS2;
	SET TOS (DROP=_TYPE_ RENAME=(_FREQ_=N_VISITS));
	LABEL N_VISITS='# OF VISITS PER PERSON FOR EACH TYPE OF SERVICE';
RUN;


<<<<<<< HEAD
/* Print the results to check output
QC - Sample Dump */
=======
/* Print the results to check output */
/* QC - Sample Dump */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC PRINT DATA=TOS2 (OBS=20);
	BY DUPERSID;
TITLE3 "SAMPLE DUMP AFTER DATA IS SUMMED UP TO PERSON-EVENT TYPE-LEVEL";
RUN;

<<<<<<< HEAD
/*********************************************************************\

Create dataset and FLAG variable for Persons who have at least 1 
event associated with diabetes.

SubPop either has event associated with DIAB (Condition) or does not.

Keep only those individuals for analysis with a PERWT15F > 0.

 *********************************************************************/

=======
/* Create dataset and FLAG variable for Persons who have at least 1 event associated with diabetes */
/* SubPop either has event associated with DIAB (Condition) or does not */
/* Keep only those individuals for analysis with a PERWT15F > 0 */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
DATA FYTOS;
	MERGE CDATA.H181 (IN=AA KEEP=DUPERSID VARPSU VARSTR 
		PERWT15F /*ADD MORE VARIABLES*/) TOS2       (IN=BB);
	BY DUPERSID;

	IF AA AND BB THEN
		SUB=1;
	ELSE IF AA AND NOT BB THEN
		DO;

			/*PERSONS WITHOUT EVENTS WITH DIABETES*/
			SUB=2;
			EVNTYP='NA';
			N_VISITS=0;
			TOTEXP=0;
			SF=0;
			MR=0;
			MD=0;
			PV=0;
			VA=0;
			TR=0;
			OF=0;
			SL=0;
			WC=0;
			OR=0;
			OU=0;
			OT=0;
		END;
	LABEL SUB='PERSONS WHO HAVE AT LEAST 1 EVENT ASSOCIATED WITH DIABETES';

	IF PERWT15F > 0;
RUN;

/* Turn off graphics and turn off ODS LISTING output */
ODS GRAPHICS OFF;
<<<<<<< HEAD
*ODS LISTING CLOSE;


/*********************************************************************\

Compute estimates by SOURCE PAYMENT for persons who reported an
EVENT with DIAB by EVENT TYPE.

Output the Domain table for further processing in PROC PRINT 
statement.

 *********************************************************************/

=======
ODS LISTING CLOSE;

/* Compute estimates by SOURCE PAYMENT for persons who reported an EVENT with DIAB by EVENT TYPE */
/* Output the Domain table for further processing in PROC PRINT statement */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC SURVEYMEANS DATA=FYTOS NOBS SUMWGT SUM STD MEAN STDERR;
	STRATA VARSTR;
	CLUSTER VARPSU;
	WEIGHT PERWT15F;
	DOMAIN SUB('1') * EVNTYP;
	VAR N_VISITS TOTEXP SF MR MD PV VA TR OF SL WC OR OU OT;
	ODS OUTPUT DOMAIN=OUT2;
RUN;

<<<<<<< HEAD
=======
/* Turn ODS LISTING output on */
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
ODS LISTING;

/* Sort data by event type */
PROC SORT DATA=OUT2;
	BY EVNTYP;
RUN;

<<<<<<< HEAD
/*********************************************************************\

DISPLAY THE OUT2 DATASETS WITH LABELS
DISPLAY THE ESTIMATED EXPENTIRUES AND POPULATION TOTALS FOR INDIVIDUALS
REPORTING AND EVENT WITH DIABETES BY EVENT TYPE

 *********************************************************************/

PROC PRINT DATA=OUT2 NOOBS LABEL;
	BY EVNTYP;
	VAR VARNAME /*VARLABEL*/
TITLE3 "ESTIMATES ON USE AND EXPENDITURES FOR 
EVENTS ASSOCIATED WITH DIABETES, BY TYPE OF SERVICE, 2015";
=======
/* DISPLAY THE OUT2 DATASETS WITH LABELS */
/* DISPLAY THE ESTIMATED EXPENTIRUES AND POPULATION TOTALS FOR INDIVIDUALS REPORTING AND EVENT WITH DIABETES BY EVENT TYPE */
PROC PRINT DATA=OUT2 NOOBS LABEL;
	BY EVNTYP;
	VAR VARNAME /*VARLABEL*/
TITLE3 "ESTIMATES ON USE AND EXPENDITURES FOR EVENTS ASSOCIATED WITH DIABETES, BY TYPE OF SERVICE, 2015";
>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
	N SUMWGT SUM STDDEV MEAN STDERR;
	FORMAT N comma6.0 SUMWGT SUM STDDEV comma17.0 MEAN STDERR comma9.2;
RUN;

/* THE PROC PRINTTO null step is required to close the PROC PRINTTO */
<<<<<<< HEAD
=======

>>>>>>> dbd5d2d48b8dbf415b49d69286228274eb4a90f9
PROC PRINTTO;
RUN;