@ECHO OFF
REM to test reading user input and 
REM displaying it: yes
REM applying it: yes


SET /P new=What would you like to call the folder?
IF "%new%"=="" SET new=ImagesWithNewNames
ECHO I said mkdir %new%
mkdir %new%