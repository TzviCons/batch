REM @ECHO OFF
REM For a four part filename (with .jpg as the fifth part)
REM our format is expected to be: i-SKU_j-uniqueimagenumber_k-category_l-viewpoint.m-jpg
REM middle is k-category
REM use this if the filename does not yet have a category


:dir /B > files.txt
SET /P new=What term would you like to add to all the files?
for /f "tokens=1,2,3,4 delims=_." %%i in ("\*.*") DO IF "%%l"=="jpg" ECHO ren "%%i_%%j_%%k.%%l" "%%i_%%j_%new%_%%k.%%l"
:del files.txt

