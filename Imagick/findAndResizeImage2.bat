@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
REM Has this been tested?
::default folder (if left blank)?
::simple convert?
::other?yes

REM This should convert all the FILES in the current folder to web optimized size "size" and
REM copy the new image the the folder "folder"
REM note: Atifa thumbnail should be 100x150 not 200x300 - can scale down 50%
REM What do we recommend for "blown up" images? 667x1000


REM If size = 100% then do simple convert else web optimized
REM use -interlace Plane

SET /P source=Where would I find the original images(for the current folder just press ENTER)?
FOR %%i IN ("%source%") DO IF NOT EXIST %%~si\NUL GOTO not_found
ECHO
SET /P folder=Where do you want me to place the new images?
ECHO
SET /P ext=What extension should the new images end with?(This may decide the image type.)
ECHO

ECHO The most common resolution format is maxwidth x maxheight in pixels. (ex. 100x200)
ECHO If you want to change the ratio and distort the image add \! after the number.
ECHO You may alternatively enter the max total pixels of the image using @. (ex. 2000@)
ECHO For more options see http://www.imagemagick.org/Usage/resize/
SET /P size=What resolution do you want the images in?

echo Finding images...
IF NOT EXIST %folder%\. mkdir %folder%
rem cd %folder%

IF "%size%"=="100" GOTO simple_convert

FOR /f "usebackq delims=|" %%B IN (`dir /b "%source%"`) DO (
ECHO Processing %%~nxB...
REM Use this for simple conversion
rem IF NOT %%~nxB==.\%0 convert "%source%\%%B" "%folder%\%%~nB.%ext%"
REM Use this for web optimization For web optimization use quality 80 or 86
IF NOT %%~nxB==.\%0 convert "%source%\%%B" -thumbnail %size% -quality 86 -strip %folder%\%%~nB.%ext%
)

GOTO end

:not_found
ECHO Source folder does not exist!
GOTO end

:simple_convert
FOR /f "usebackq delims=|" %%B IN (`dir /b "%source%"`) DO (
ECHO Converting %%~nxB...
REM Use this for simple conversion
IF NOT %%~nxB==.\%0 convert "%source%\%%B" "%folder%\%%~nB.%ext%"
)
:end