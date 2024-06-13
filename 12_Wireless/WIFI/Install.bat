@echo off

echo Start Installing Intel AC9462 AC9461 AC9560WIFI driver...
@set L=C:\windows\temp\Driver_install.log
@set IP=[===========Install Pass===========]
@set IPR=[===========Install Pass, Restart is need===========]
@set IF=[===========Install Fail===========]

@echo [%time%]=========Install Intel AC9462 AC9461 AC9560WIFI driver========= >> %L%
:ins1
@echo [%time%]1.Netwtw08.INF >> %L%
pnputil /add-driver "%~dp0Drivers\Netwtw08.INF" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins2)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins2)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins2)
@if not %errorlevel%==0 goto ERR

:ins2
@echo [%time%]2.WifiDrv08Customizations.inf >> %L%
pnputil /add-driver "%~dp0Drivers\Special_Configs\WifiDrv08Customizations.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins3)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins3)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins3)
@if not %errorlevel%==0 goto ERR

:ins3
@echo [%time%]3.PieComponent.INF >> %L%
pnputil /add-driver "%~dp0Drivers\PIE\PieComponent.INF" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins4)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins4)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & set goto ins4)
@if not %errorlevel%==0 goto ERR

:ins4
@echo [%time%]4.PieExtension.INF>> %L%
pnputil /add-driver "%~dp0Drivers\PIE\PieExtension.INF" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto resultpass)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto resultpass)
@if not %errorlevel%==0 goto ERR

:resultpass
@echo [%time%]=========Intel AC9462 AC9461 AC9560 WIFI Install complete========= >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 0

:ERR
echo [%time%]%IF% >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 1
