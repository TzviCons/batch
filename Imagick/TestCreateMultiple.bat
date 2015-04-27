@ECHO OFF
REM This has not been tested and works!
REM Will create a low resolution copy of all the files in the current directory named the original name with "_lowres" appended.
setlocal
SET dirhi=hi-res
SET dirlo=lo-res
SET appendhi=
SET appendlo=
SET dirth=thumb


SET /P dirhi=Which folder do you want to place the high resolution images(hi-res)? 
SET /P appendhi=What do want the file names in %dirhi% to end with? (nothing):
SET /P dirth=Which folder do you want to place the lo-res images(lo-res)? 
ECHO The thumbnail images will be named as the first section of the original filename.
SET /P dirlo=Which folder do you want to place the lo-res images(lo-res)? 
SET /P appendlo=What do want the file names in %dirlo% to end with? (nothing):
::SET appends = _%append%
ECHO Creating Directory: %dirlo%
mkdir %dirlo%
ECHO Creating Directory: %dirhi%
mkdir %dirhi%

FOR %%B IN (".\*.*") DO IF NOT %%~nxB==.\%0 (
	ECHO Adding %%~nxB
	echo convert %%B -thumbnail 200 %dirlo%\%%~nB%appendlo%.%%~xB
	echo @for /f "tokens=1,2,3,4 delims=_" %%i in ("%%~nB") DO convert %%B -thumbnail 200 %dirth%\%%i.%%~xB
	echo copy %%B %dirhi%\%%~nB%appendhi%.%%~xB
)