
@ECHO OFF
SETLOCAL
REM Has this been tested?
:: tested with none?yes
:: tested with one?yes
:: tested with two?
:: tested with three?
:: tested with last?yes

REM For a three part filename
REM (we're adding the fourth part, with .jpg as the fifth part)
REM Our format is expected to be:
REM C-SKU_D-uniqueimagenumber_A-category_E-viewpoint.jpg
REM Middle is k-category
REM Use this if the filename does not yet have a category

REM Instructions:
REM Create multiple folders with names matching
REM the term you wish to add to your filename. 
REM Move your files you wish to be renamed to
REM the folder named as the desired addition
REM Run this program from the base folder of your new_name folders.

REM VARIABLES %%A folder, %%B filename, %%C begins tokens
REM %%~nxA resolves to the filename with extension of A, %%~xB is .ext

:set_new_folder

SET /P newfolder=What would you like to call the folder?

IF "%newfolder%"=="" SET new=Renamed_Images
IF EXIST %newfolder% (
	ECHO The folder %newfolder% already exists.
	GOTO set_new_folder
	)
mkdir %newfolder%


SET count=0
:set_parts_variable
SET /P parts=After how many under_scores should I add the foldername? (To simply append the foldername to the filename enter -1.)
echo you entered %parts%

If "%parts%"=="0" GOTO none
If "%parts%"=="2" GOTO two
If "%parts%"=="-1" GOTO last
If "%parts%"=="1" GOTO one
echo Sorry, I didn't understand that answer.
GOTO set_parts_variable

GOTO end

:none
echo to add the foldername before the original filename

for /d %%A in (".\*") do IF NOT "%%A"==".\%newfolder%" @for %%B in ("%%A\*.*") do (
	copy "%%B" "%newfolder%\%%~nxA_%%~nB%%~xB"
	SET /A count=count + 1
	)
GOTO end


:one
echo to add the folder name after the first underscore
for /d %%A in (".\*") do IF NOT "%%A"==".\%newfolder%" @for %%B in ("%%A\*.*") do @for /f "tokens=1,2 delims=_" %%C in ("%%~nB") do (
	copy "%%B" "%newfolder%\%%C_%%~nxA_%%D%%~xB"
	SET /A count=count + 1
	)

GOTO end

:two
echo to add the foldername after two underscores
for /d %%A in (".\*") do IF NOT "%%A"==".\%newfolder%" @for %%B in ("%%A\*.*") do @for /f "tokens=1,2,3 delims=_" %%C in ("%%~nB") do (
	copy "%%B" "%newfolder%\%%C_%%D_%%~nxA_%%E%%~xB"
	SET /A count=count + 1
	)

REM del newfiles\*newfiles*.*

GOTO end

:last
echo to add the foldername at the end
for /d %%A in (".\*") do IF NOT "%%A"==".\%newfolder%" @for %%B in ("%%A\*.*") do (
	copy "%%B" "%newfolder%\%%~nB_%%~nxA%%~xB"
	SET /A count=count + 1
	)

GOTO end

:end