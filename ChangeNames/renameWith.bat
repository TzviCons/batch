
REM rename files and replace a single character
SETLOCAL 
ENABLEDELAYEDEXPANSION
SET /P find=Which letter number would you like to change?
SET /P replace=Which character would you like to change it to?

dir /B > files.txt
for /f %%i in (files.txt) DO (
@set old=%%i

SET "new=!old:%find%=%replace%!"

echo ren "%old%" "%new%"
)

