ECHO This is beibg tested.
ECHO OFF
REM To select files ending with side.jpg
REM convert file -thumbnail 200 SKU.jpg
@setlocal enableextensions enabledelayedexpansion

SET /P filter=What word must the filename contain?
SET /P ext=What file extension should I look for?

Echo looking for %filter% in %ext% files

for %%A IN (".\*") DO (
	
	rem ECHO %%~xA
	rem ECHO %%~nA
	SET fext="%%~xA"
	SET fname="%%~nA"
	rem ECHO %%~nxA
	ECHO %fname%.%fext%
	rem FOR /f "delims=" %%B IN ("%%~nA") DO (
	ECHO looking at %%B in %%~nA
	IF "%%~nA:%filter%=" NEQ "%filter%" ECHO found %%A
	rem )
 )

 ::IF "%fext%"==".%ext%" IF NOT !fname:%filter%=a!==%%~nA ECHO %%A
::IF "%%~xA"==".%ext%" IF NOT %%~nA:%filter%=a==%%~nA ECHO %%A