@echo off

echo Start Installing ME driver...
@set L=C:\windows\temp\Driver_install.log
@set IP=[===========Install Pass===========]
@set IPR=[===========Install Pass, Restart is need===========]
@set IF=[===========Install Fail===========]

@echo [%time%]=========Install Intel ME driver========= >> %L%
:ins1
@echo [%time%]1.heci.inf >> %L%
pnputil /add-driver "%~dp0Drivers\MEI\win10\*.INF" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins3)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins3)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins3)
@if not %errorlevel%==0 goto ERR

:ins3
@echo [%time%]3.WMIProvider >> %L%
pnputil /add-driver "%~dp0Drivers\WMIProvider\MEWMIProv.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins4)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins4)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & set goto ins4)
@if not %errorlevel%==0 goto ERR

:ins4
@echo [%time%]4.JHI>> %L%
pnputil /add-driver "%~dp0Drivers\JHI\DAL.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins5)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins5)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins5)
@if not %errorlevel%==0 goto ERR

:ins5
@echo [%time%]4.iclsClient >> %L%
pnputil /add-driver "%~dp0Drivers\ICLS\iclsClient.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto resultpass)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto resultpass)
@if not %errorlevel%==0 goto ERR

:resultpass
@echo [%time%]=========Intel ME Install complete========= >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 0

:ERR
echo [%time%]%IF% >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 1
