@ECHO OFF
REM This has been tested and will remove the part of the filename between
REM This should convert all the FILES in the current folder to web optimized size "size" and
REM copy the new image the the folder "folder"
REM note: Atifa thumbnail should be 100x150 not 200x300 - can scale down 50%
REM What do we recommend for "zoomed in" images?

SET /P folder=Where do you want me to place the new images?
SET /P size=What rsolution do you want the images in?

echo Finding images...
IF NOT EXIST %folder%\. mkdir %folder%
rem cd %folder%

for %%B in (".\*.*") DO (
echo Processing %%~nxB...
IF NOT %%~nxB==.\%0 convert "%%B" -thumbnail %size% -quality 86 -strip %folder%\%%~nB.jpg
)