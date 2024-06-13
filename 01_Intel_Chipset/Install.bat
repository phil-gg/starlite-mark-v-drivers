@echo off

echo Start Installing Intel Chipset driver...
@set L=C:\windows\temp\Driver_install.log
@set IP=[===========Install Pass===========]
@set IPR=[===========Install Pass, Restart is need===========]
@set IF=[===========Install Fail===========]

@echo [%time%]=========Install Chipset driver========= >> %L%

:ins1
@echo [%time%]1.AlderLakeSystem.inf >> %L%
pnputil /add-driver "%~dp0Drivers\AlderLakeSystem.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins2)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins2)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins2)
@if not %errorlevel%==0 goto ERR

:ins2
@echo [%time%]2.AlderLakePCH-NSystem.inf >> %L%
pnputil /add-driver "%~dp0Drivers\AlderLakePCH-NSystem.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins3)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins3)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins3)
@if not %errorlevel%==0 goto ERR

:ins3
@echo [%time%]3.AlderLakePCH-NSystemISH.inf >> %L%
pnputil /add-driver "%~dp0Drivers\AlderLakePCH-NSystemISH.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins4)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins4)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & set goto ins4)
@if not %errorlevel%==0 goto ERR

:ins4
@echo [%time%]4.AlderLakePCH-NDmaSecExtension.inf >> %L%
pnputil /add-driver "%~dp0Drivers\AlderLakePCH-NDmaSecExtension.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins5)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins5)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & set goto ins5)
@if not %errorlevel%==0 goto ERR

:ins5
@echo [%time%]5.AlderLakePCH-NSystemNorthpeak.inf>> %L%
pnputil /add-driver "%~dp0Drivers\AlderLakePCH-NSystemNorthpeak.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto resultpass)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto resultpass)
@if not %errorlevel%==0 goto ERR

:resultpass
@echo [%time%]=========Intel Chipset Install Complete========= >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 0

:ERR
echo [%time%]%IF% >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 1