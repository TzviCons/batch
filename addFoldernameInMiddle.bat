rem @ECHO OFF
REM Has this been tested? yes with great success
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
REM Run this program

REM VARIABLES %%A folder, %%B filename, %%C begins tokens
REM %%~nxA resolves to the filename with extension of A, %%~xB is .ext
SET /P newfolder=What would you like to call the folder?
IF "%newfolder%"=="" SET new=Renamed_Images
mkdir %newfolder%
SET amount=0
for /d %%A in (".\*") do IF NOT "%%A"==".\%newfolder%" @for %%B in ("%%A\*.*") do @for /f "tokens=1,2,3 delims=_" %%C in ("%%~nB") do copy "%%B" "%newfolder%\%%C_%%D_%%~nxA_%%E%%~xB"
REM del newfiles\*newfiles*.*

