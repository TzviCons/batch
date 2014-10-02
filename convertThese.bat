REM @ECHO OFF
REM To select files based on user input and run
REM convert file -thumbnail 200 file_th.jpg
@setlocal enableextensions enabledelayedexpansion

SET /P filter=What word must the filename contain?
SET /P ext=What file extension should I look for?

for %%A IN (".\*") DO (
ECHO %%A
ECHO %%~xA
ECHO %%~nA
 SET fext="%%~xA"
 SET fname="%%~nA"
 ECHO %fname%.%fext%
 FOR /f "delims=" %%B IN ("%fname%") DO IF "%%B:%filters%=" NEQ "%filters%" ECHO %%A
 )
 
 ::IF "%fext%"==".%ext%" IF NOT !fname:%filter%=a!==%%~nA ECHO %%A
::IF "%%~xA"==".%ext%" IF NOT %%~nA:%filter%=a==%%~nA ECHO %%A