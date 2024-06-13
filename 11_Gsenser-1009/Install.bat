@set L=C:\Windows\temp\install.log
@set IP=[********Install Pass********]
@set IPR=[********Install Pass, Restart is need********]
@set IF=[********Install Fail********]

@echo [%time%]=========Install Intel Gsensor-1009 driver========= >> %L%

pnputil /add-driver "%~dp0Drivers\*.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto resultpass)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto resultpass)
@if not %errorlevel%==0 goto ERR

:resultpass
@echo [%time%]=========Intel Gsensor-1009 driver Install Complete========= >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
@set LL=C:\Windows\temp\Gsensor-1009.log
@echo [%time%] >>%LL%
EXIT /B 0

:ERR
echo [%time%]%IF% >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 1