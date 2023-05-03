@echo off
setlocal enabledelayedexpansion
goto :main


:main
setlocal

echo Start...

if 1==1 (
echo If worked...
)

echo %~1

echo End...

pause

endlocal
goto :eof