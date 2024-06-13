@echo off

echo Start Installing Intel Serial IO driver...
@set L=C:\windows\temp\Driver_install.log
@set IP=[===========Install Pass===========]
@set IPR=[===========Install Pass, Restart is need===========]
@set IF=[===========Install Fail===========]

@echo [%time%]=========Install Intel Serial IO driver========= >> %L%
:ins1
@echo [%time%]1.iaLPSS2_GPIO2_ADL_N.inf >> %L%
pnputil /add-driver "%~dp0Drivers\iaLPSS2_GPIO2_ADL_N.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins2)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins2)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins2)
@if not %errorlevel%==0 goto ERR

:ins2
@echo [%time%]2.iaLPSS2_I2C_ADL_N.inf >> %L%
pnputil /add-driver "%~dp0Drivers\iaLPSS2_I2C_ADL_N.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins3)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins3)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins3)
@if not %errorlevel%==0 goto ERR

:ins3
@echo [%time%]3.iaLPSS2_SPI_ADL_N.inf >> %L%
pnputil /add-driver "%~dp0Drivers\iaLPSS2_SPI_ADL_N.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins4)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins4)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & set goto ins4)
@if not %errorlevel%==0 goto ERR

:ins4
@echo [%time%]iaLPSS2_UART2_ADL_N.inf>> %L%
pnputil /add-driver "%~dp0Drivers\iaLPSS2_UART2_ADL_N.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto resultpass)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto resultpass)
@if not %errorlevel%==0 goto ERR

:resultpass
@echo [%time%]=========Intel Serial IO Install complete========= >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 0

:ERR
echo [%time%]%IF% >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 1
