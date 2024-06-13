@set L=C:\Windows\temp\install.log
@set IP=[===========Install Pass===========]
@set IPR=[===========Install Pass, Restart is need===========]
@set IF=[===========Install Fail===========]

@echo [%time%]=========Install Intel Intel_Smart_Sound_Technology driver========= >> %L%

:ins1
pnputil /add-driver "%~dp0Drivers\DetectionVerificationDrv.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins2)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins2)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins2)
@if not %errorlevel%==0 goto ERR

:ins2
pnputil /add-driver "%~dp0Drivers\IntcAudioBus.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins3)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins3)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins3)
@if not %errorlevel%==0 goto ERR

:ins3
pnputil /add-driver "%~dp0Drivers\IntcBTAu.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins4)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins4)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins4)
@if not %errorlevel%==0 goto ERR

:ins4
pnputil /add-driver "%~dp0Drivers\IntcDMic.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins5)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins5)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins5)
@if not %errorlevel%==0 goto ERR

:ins5
pnputil /add-driver "%~dp0Drivers\IntcOED.inf" /install >> %L%

@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins6)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins6)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins6)
@if not %errorlevel%==0 goto ERR

:ins6
pnputil /add-driver "%~dp0Drivers\IntcSDW.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins7)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins7)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins7)
@if not %errorlevel%==0 goto ERR

:ins7
pnputil /add-driver "%~dp0Drivers\IntcSdwBus.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins8)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins8)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins8)
@if not %errorlevel%==0 goto ERR

:ins8
pnputil /add-driver "%~dp0Drivers\IntcSST.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins9)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto ins9)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins9)
@if not %errorlevel%==0 goto ERR

:ins9
pnputil /add-driver "%~dp0Drivers\IntcUSB.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==259 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto resultpass)
@if not %errorlevel%==0 goto ERR

:resultpass
@echo [%time%]=========Intel SST Install complete========= >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
@set LL=C:\Windows\temp\SST.log
@echo [%time%] >>%LL%
EXIT /B 0

:ERR
echo [%time%]%IF% >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 1
