@ECHO OFF
REM This works!
REM For a four part filename (with .jpg as the fifth part)
REM our format is expected to be: C-SKU_D-uniqueimagenumber_E-category_F-viewpoint.jpg
REM middle is k-category
REM use this if the filename does not yet have a category

REM Instructions:
REM Create folders whose names contain the part you wish to change
REM Move the files with those names into those folders
REM Change the folder names to what you prefer
REM Run the program


REM %%A folder, %%B filename, %%C begins tokens
REM %%~nxA resolves to the filename with extension of A, %%~xB is .ext
mkdir newfiles
for /d %%A in (".\*") do @for %%B in ("%%A\*.*") do @for /f "tokens=1* delims=_." %%C in ("%%~nB") do copy "%%B" "newfiles\%%C_%%D_%%~nxA_%%F%%~xB"



