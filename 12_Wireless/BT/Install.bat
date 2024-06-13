@echo off

echo Start Installing Intel 9461 9462 9560 BT driver...
@set L=C:\windows\temp\Driver_install.log
@set IP=[===========Install Pass===========]
@set IPR=[===========Install Pass, Restart is need===========]
@set IF=[===========Install Fail===========]

@echo [%time%]=========Install Intel  9461 9462 9560BT driver========= >> %L%
pnputil /add-driver "%~dp0Drivers\ibtusb.inf" /install >> %L%

@set value=%errorlevel%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & set value=0)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & set value=0)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & set value=0)
@if not %value%==0 (echo [%time%]%IF% >> %L% & exit /b 1)
@echo [%time%]=========Intel  9461 9462 9560 BT driver Install Complete========= >> %L%