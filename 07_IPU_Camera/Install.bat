@set L=C:\Windows\temp\install.log
@set IP=[===========Install Pass===========]
@set IPR=[===========Install Pass, Restart is need===========]
@set IF=[===========Install Fail===========]

@echo [%time%]=========Install IPU Camera driver========= >> %L%

:ins1
pnputil /add-driver "%~dp0Drivers\gc5035.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins2)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins2)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins2)
@if not %errorlevel%==0 goto ERR

:ins2
pnputil /add-driver "%~dp0Drivers\gc8034.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins3)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins3)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins3)
@if not %errorlevel%==0 goto ERR

:ins3
pnputil /add-driver "%~dp0Drivers\iacamera64.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins4)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins4)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins4)
@if not %errorlevel%==0 goto ERR

:ins4
pnputil /add-driver "%~dp0Drivers\iacamera64_gc5035_gc8034.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins5)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins5)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins5)
@if not %errorlevel%==0 goto ERR

:ins5
pnputil /add-driver "%~dp0Drivers\iactrllogic64.inf" /install >> %L%

@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins6)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins6)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins6)
@if not %errorlevel%==0 goto ERR


:ins6
pnputil /add-driver "%~dp0Drivers\iaisp64.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto resultpass)
@if not %errorlevel%==0 goto ERR

:resultpass
@echo [%time%]=========Intel IPU Install complete========= >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
@set LL=C:\Windows\temp\IPU.log
@echo [%time%] >>%LL%
EXIT /B 0

:ERR
echo [%time%]%IF% >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 1
