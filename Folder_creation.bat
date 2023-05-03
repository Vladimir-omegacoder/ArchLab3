@echo off
setlocal enabledelayedexpansion
goto :main


:main
setlocal

xcopy C:\Users\KillMe\Labs\Group\Full_name\Command_prompt C:\Users\KillMe\Labs\Group\Full_name\batch /e /i /h

pause

endlocal
goto :eof