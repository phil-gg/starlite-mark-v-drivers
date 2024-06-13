@set L=C:\Windows\temp\install.log
@set IP=[********Install Pass********]
@set IPR=[********Install Pass, Restart is need********]
@set IF=[********Install Fail********]

@echo [%time%]=========Install Intel DTT driver========= >> %L%

:ins1
pnputil /add-driver "%~dp0Drivers\dtt_ext.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins2)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins2)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins2)
@if not %errorlevel%==0 goto ERR

:ins2
pnputil /add-driver "%~dp0Drivers\dtt_sw.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins3)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins3)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins3)
@if not %errorlevel%==0 goto ERR


:ins3
pnputil /add-driver "%~dp0Drivers\ipf_acpi.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins4)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins4)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins4)
@if not %errorlevel%==0 goto ERR


:ins4
pnputil /add-driver "%~dp0Drivers\ipf_cpu.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto resultpass)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto resultpass)
@if not %errorlevel%==0 goto ERR

:resultpass
@echo [%time%]=========Intel DTT driver Install Complete========= >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
@set LL=C:\Windows\temp\DTT.log
@echo [%time%] >>%LL%
EXIT /B 0

:ERR
echo [%time%]%IF% >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 1