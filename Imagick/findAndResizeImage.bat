@ECHO OFF
SETLOCAL
REM has this been tested ?
REM This should convert all the FILES in the current folder to web optimized size "size" and
REM copy the new image the the folder "folder"
REM note: Atifa thumbnail should be 100x150 not 200x300 - can scale down 50%
REM What do we recommend for "zoomed in" images?


REM If size = 100% then do simple convert else web optimized
REM use -interlace Plane

SET /P source=Where would I find the original images?
FOR %%i IN ("%source%") DO IF NOT EXIST %%~si\NUL GOTO not_found
SET /P folder=Where do you want me to place the new images?
SET /P ext=What extension should the new images end with?(This may decide the image type.)
SET /P size=What resolution do you want the images in(Leave blank for full resolution.)?
echo You chose -%size%-
IF NOT DEFINED size GOTO simple_convert
IF %size%==psd GOTO psd


:full_convert
echo DOing full convert
echo Finding images...
IF NOT EXIST %folder%\. mkdir %folder%
rem goto end
FOR /f "usebackq delims=|" %%B IN (`dir /b "%source%"`) DO (
ECHO Processing %%~nxB...
REM Use this for web optimization For web optimization use quality 80 or 86
IF NOT "%%~nxB"==".\%0" convert "%source%\%%B" -thumbnail %size% -quality 86 -strip "%folder%\%%~nB.%ext%"
)
GOTO end

:simple_convert
echo Doing simple convert
echo Finding images...
IF NOT EXIST %folder%\. mkdir %folder%
rem goto end
FOR /f "usebackq delims=|" %%B IN (`dir /b "%source%"`) DO (
ECHO Processing %%~nxB ...
REM Use this for simple conversion
IF NOT %%~nxB==.\%0 convert "%source%\%%B" "%folder%\%%~nB.%ext%"
)

GOTO end

:psd
echo Doing psd convert with flattened layers
echo Finding images...
IF NOT EXIST %folder%\. mkdir %folder%
rem goto end
FOR /f "usebackq delims=|" %%B IN (`dir /b "%source%"`) DO (
ECHO Processing %%~nxB ...
REM Use this for simple conversion
IF NOT %%~nxB==.\%0 convert "%source%\%%B"[0] "%folder%\%%~nB.%ext%"
)
GOTO end

:not_found 
ECHO Source folder does not exist!
GOTO end

:end