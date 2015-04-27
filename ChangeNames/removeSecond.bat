@ECHO OFF
REM This has been tested and will remove the part of the filename between
REM the first and second _ We recieved the photos as SKU_number.jpg
REM After appending a detailed description to the filename we
REM would like to remove the incremented number as it does
REM not help identify the file

for %%B in (".\*.*") do IF NOT %%~nxB==.\%0 @for /f "tokens=1,2,3,4 delims=_" %%i in ("%%~nB") DO ren "%%i_%%j_%%k_%%l%%~xB" "%%i_%%k_%%l%%~xB"