@ECHO OFF
REM Has this been tested?
::mostly
REM this will find all files in source directory matching criteria 
REM and create a thumbnail wih the same name in the dest folder. 
REM Afterwards you may append the color to the image-name as needed for the upload process

SET /P source=Where do I find the images?
SET /P dest=Where do you want me to place the thumbs?

SET /P filter=What word must the filename contain?
SET /P ext=What file extension should I look for?

If NOT EXIST %dest%\. mkdir %dest%

SET count=0
rem old-version FOR %%B IN (%source%\*side*.jpg) DO (
FOR %%B IN (%source%\*%filter%*.%ext%) DO (

echo Processing %%~nxB...
convert "%%B" -thumbnail 200 %dest%\%%~nxB
SET /A count=count + 1
)

echo All done! Processed %count% images.