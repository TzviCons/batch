REM @ECHO OFF
REM This has been testes successfully!
REM For a four part filename (with .jpg as the fifth part)
REM our format is expected to be: i-SKU_j-uniqueimagenumber_k-category_l-viewpoint.m-jpg
REM middle is k-category
REM
REM TODO perhaps move jpg filter to dir line

dir /B > files.txt
for /f "tokens=1,2,3,4,5 delims=_." %%i in (files.txt) DO IF "%%m"=="jpg" ren "%%i_%%j_%%k_%%l.%%m" "%%i_%%j_%%l.%%m"
del files.txt

