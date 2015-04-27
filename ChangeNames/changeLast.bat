REM To change the last character of the filename to %%A while retaining the extension

FOR %%I IN (.\*.*) DO (
	@IF NOT %%~nxI==.\%0 (
		SET fname=%%~nI
		echo ren %%I %fname:~0,~4%u
	)
)