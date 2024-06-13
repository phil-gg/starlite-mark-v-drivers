@set L=C:\Windows\temp\install.log
@set IP=[********Install Pass********]
@set IPR=[********Install Pass, Restart is need********]
@set IF=[********Install Fail********]

@echo [%time%]=========Install Realtek Audio driver========= >> %L%

:ins1
@echo [%time%]1.HDX_IP3Ext_RTK.inf>> %L%
pnputil /add-driver "%~dp0Drivers\ExtRtk_9421.1\HDX_IP3Ext_RTK.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins2)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins2)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins2)
@if not %errorlevel%==0 goto ERR

:ins2
timeout /t 5 /nobreak
@echo [%time%]2.HDXSSTWHITE.inf >> %L%
pnputil /add-driver "%~dp0Drivers\Codec_9421.1\HDXSSTIP3.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins3)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins3)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins3)
@if not %errorlevel%==0 goto ERR

:ins3
timeout /t 60 /nobreak
@echo [%time%]3.RealtekAPO.inf  >> %L%
pnputil /add-driver "%~dp0Drivers\RealtekAPO_1062\RealtekAPO.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins4)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins4)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins4)
@if not %errorlevel%==0 goto ERR

:ins4
@echo [%time%]4.RealtekHSA.inf  >> %L%
pnputil /add-driver "%~dp0Drivers\RealtekHSA_281\RealtekHSA.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins5)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins5)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins5)
@if not %errorlevel%==0 goto ERR

:ins5
@echo [%time%]5.RealtekASIO.inf  >> %L%
pnputil /add-driver "%~dp0Drivers\RealtekASIO_9\RealtekASIO.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto ins6)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto ins6)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto ins6)
@if not %errorlevel%==0 goto ERR

:ins6
@echo [%time%]6.RealtekService_567  >> %L%
pnputil /add-driver "%~dp0Drivers\RealtekService_567\RealtekService.inf" /install >> %L%
@if %errorlevel%==0 (echo [%time%]%IP% >> %L% & goto resultpass)
@if %errorlevel%==259 (echo [%time%]%errorlevel% >> %L% & goto resultpass)
@if %errorlevel%==3010 (echo [%time%]%IPR% >> %L% & goto resultpass)
@if not %errorlevel%==0 goto ERR

:resultpass
@echo [%time%]=========Realtek Audio driver Install Complete========= >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
@set LL=C:\Windows\temp\Audio.log
@echo [%time%] >>%LL%
EXIT /B 0

:ERR
echo [%time%]%IF% >> %L%
ECHO ERRRORLEVEL=%ERRORLEVEL% >> %L%
EXIT /B 1