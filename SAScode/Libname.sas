/*File paths for farm income and wealth statistics data product*/
%Let SdrivePath=\\D04nt04\farmincome\shared\;
%Let SdriveEstimatePath=&SdrivePath.Estimates\;
%Let LocationPath=&SdriveEstimatePath.Expenses\SASCode\Expenses\;
%Let LocationPathForecast=&SdrivePath.FORECAST\New Farm Income Model\SASprograms\farm-income\;
%Let LocationPathFarmBiz=&SdrivePath.FarmBusiness\SAScode\;
%Let FarmRelatedLocationPath=&SdriveEstimatePath.Farm-related_income\SASCode\;
%Let BEAPath=&SdrivePath.BEA\SAS\;
/*File path of mted files read into SAS in ReadinMTEDFiles SAS program.*/
%Let MTEDFileLocation=\\d05nt10\MTEDCOMMON\CrossDiv\Farm_Income_Forecast_Crops_Data\CSV\NewForecastmethod\;

/*Libname statements for sdrive, farm income and wealth statistics*/
LIBNAME INPEFILE "&SdriveEstimatePath.Expenses\Input Data";
libname ExInput "&SdriveEstimatePath.Expenses\Input Data";
Libname CRinput "&SdriveEstimatePath.Cash_Receipts\Input data";
/*Libname statements for ndrive, ARMS data*/
libname ARMStemp 	'N:\ARMS\farmdata\Temp';
libname ARMS 		'N:\ARMS\farmdata';
libname ALLARMS 	'N:\ARMS\farmdata';
Libname ARMSPre		'N:\workfiles\FCRSARMSP3\ArmsArea\Data Review';
Libname ARMS16      'N:\workfiles\FCRSARMSP3\ArmsArea\Arms16\Data';
/*DSN file locations used in the SQL libname statements below*/
%Let NASSQuickstatsdsn = &GitLocation.Reusable-code\DSN_files\NASSQUICKSTATS.dsn;
%Let FarmIncomeInternaldsn = &GitLocation.Reusable-code\DSN_files\FarmIncomeInternal.dsn; 
%Let FarmIncomeInternalSqlDev02dsn = &GitLocation.Reusable-code\DSN_files\FarmIncomeInternalSqlDev02.dsn; 
/*Libname statements for SQL server management studio*/
libname NASSQS 		ODBC NOPROMPT="FILEDSN=&NASSQuickstatsdsn;"  	schema=NASSQSFTP;
libname nFarmInc 	ODBC NOPROMPT="FILEDSN=&FarmIncomeInternaldsn;" schema=NewFarmInc;
libname Archive 	ODBC NOPROMPT="FILEDSN=&FarmIncomeInternaldsn;" schema=FarmIncArchive;
libname lookups 	ODBC NOPROMPT="FILEDSN=&FarmIncomeInternaldsn;" schema=lookups;
libname nCashRec 	ODBC NOPROMPT="FILEDSN=&FarmIncomeInternaldsn;" schema=NewCashRec;
libname loadWork 	ODBC NOPROMPT="FILEDSN=&FarmIncomeInternaldsn;" schema=WorkArea BULKLOAD=YES DBCOMMIT=10000;
libname loadArea 	ODBC NOPROMPT="FILEDSN=&FarmIncomeInternaldsn;" schema=LoadArea BULKLOAD=YES DBCOMMIT=10000;
libname WorkArea 	ODBC NOPROMPT="FILEDSN=&FarmIncomeInternaldsn;" schema=Workarea;
libname BEA 		ODBC NOPROMPT="FILEDSN=&FarmIncomeInternaldsn;" schema=BEA_NIPA;
libname Confide 	ODBC NOPROMPT="FILEDSN=&FarmIncomeInternaldsn;" schema=Confidential;
libname sqldev02	ODBC NOPROMPT="FILEDSN=&FarmIncomeInternalSqlDev02dsn;" schema=farminc;
libname ErsWide 	ODBC NOPROMPT="FILEDSN=&FarmIncomeInternaldsn;" schema=ERS_wide_access;

/*This includes macro programs that easily manipulate lists*/
%INCLUDE "&GitLocation.Reusable-code\SAScode\Writevars.sas";