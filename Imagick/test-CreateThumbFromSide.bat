
@ECHO OFF






REM This has been tested and works just fine!
rem this will find all files in source directory matching criteria 
rem and create a thumbnail wih the same name in the dest folder. 
rem Afterwards you may append the color to the image-name as needed for the upload process


SET /P source=Where do I find the images?
SET /P dest=Where do you want me to place the thumbs?


If NOT EXIST %dest%\. mkdir %dest%











SET count=0
FOR %%B IN (%source%\*side*.jpg) DO (
echo Processing %%~nxB...
convert "%%B" -thumbnail 200 %dest%\%%~nxB
SET /A count=count + 1
)



echo All done! Processed %count% images.