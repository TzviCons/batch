@ECHO OFF
REM This has been tested
REM Will create a low resolution copy of all the files in the current directory named the original name with "_lowres" appended.
setlocal
SET dir=newfolder
SET /P dir=Which directory do you want to place the lo-res images? 
SET /P append=What do want the new file names to end with? (nothing):
::SET appends = _%append%
ECHO Creating Directory: %dir%
mkdir %dir%

for %%B in (".\*.*") do (
IF NOT %%~nxB==.\%0 convert %%B -thumbnail 200 %dir%\%%~nB%append%.jpg
ECHO Adding %%~nxB
)