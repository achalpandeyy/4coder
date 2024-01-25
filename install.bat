@echo off

set INSTALL_LOCATION=E:\tools\4coder

if not exist %INSTALL_LOCATION% mkdir %INSTALL_LOCATION%

::
:: NOTE(achal): Copy over the main 4coder files
::
copy build\4ed.exe %INSTALL_LOCATION%\4ed.exe >nul
copy build\4ed_app.dll %INSTALL_LOCATION%\4ed_app.dll >nul
copy build\custom_4coder.dll %INSTALL_LOCATION%\custom_4coder.dll >nul

if not exist %INSTALL_LOCATION%\bindings.4coder (
	echo Overwriting bindings.4coder..
	copy build\bindings.4coder %INSTALL_LOCATION%\bindings.4coder
)

if not exist %INSTALL_LOCATION%\config.4coder (
	echo Overwriting config.4coder..
	copy build\config.4coder %INSTALL_LOCATION%\config.4coder
)

::
:: NOTE(achal): Copy over fonts and themes
::

if not exist %INSTALL_LOCATION%\fonts (
	echo Overwriting fonts..
	xcopy build\fonts %INSTALL_LOCATION%\fonts\ /Y >nul
)

if not exist %INSTALL_LOCATION%\themes (
	echo Overwriting themes..
	xcopy build\themes %INSTALL_LOCATION%\themes\ /Y >nul
)

::
:: NOTE(achal): Copy over Ryan's layer
::

if not exist %INSTALL_LOCATION%\4coder_fleury mkdir %INSTALL_LOCATION%\4coder_fleury

copy build\4coder_fleury\custom_4coder.dll %INSTALL_LOCATION%\4coder_fleury\custom_4coder.dll >nul
:: copy build\4coder_fleury\custom_4coder.pdb %INSTALL_LOCATION%\4coder_fleury\custom_4coder.pdb >nul

if not exist %INSTALL_LOCATION%\4coder_fleury\bindings.4coder (
	echo Overwriting 4coder_fleury\bindings.4coder..
	copy build\4coder_fleury\bindings.4coder %INSTALL_LOCATION%\4coder_fleury\bindings.4coder
)

if not exist %INSTALL_LOCATION%\4coder_fleury\config.4coder (
	echo Overwriting 4coder_fleury\config.4coder..
	copy build\4coder_fleury\config.4coder %INSTALL_LOCATION%\4coder_fleury\config.4coder
)