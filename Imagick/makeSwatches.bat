@ECHO OFF
SETLOCAL 
ENABLEDELAYEDEXPANSION
REM Has this been tested?
@REM Will create a png file 100x100 pixels with the specified color, named the-specified-color.png
REM You need to have imconvert in your system path.
REM If your copy of imagick does not contain imconvert,  rename or copy convert.exe to imconvert.exe
rem @enableextensions

rem @enabledelayedexpansion


SET filetype=png

IF [%2]==[] (
SET output=%1.%filetype%
rem echo 2 is not defined
) ELSE (
SET output=%1-%2.%filetype% 
rem echo 2 is defined
)
imconvert -size 100x100 xc:%1%2 %output%