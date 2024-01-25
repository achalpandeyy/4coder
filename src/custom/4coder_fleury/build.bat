@echo off
call ..\buildsuper_x64-win.bat .\4coder_fleury.cpp release

pushd ..\..\..\build

if not exist 4coder_fleury mkdir 4coder_fleury

copy ..\src\custom\4coder_fleury\custom_4coder.dll 4coder_fleury\custom_4coder.dll
copy ..\src\custom\4coder_fleury\custom_4coder.pdb 4coder_fleury\custom_4coder.pdb
copy ..\src\custom\4coder_fleury\bindings.4coder 4coder_fleury\bindings.4coder
copy ..\src\custom\4coder_fleury\config.4coder 4coder_fleury\config.4coder

popd