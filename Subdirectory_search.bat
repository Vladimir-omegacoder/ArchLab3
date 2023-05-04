@echo off
setlocal enabledelayedexpansion
goto :main


:main
setlocal

set directory=
set dirname=
set hidden=
set readonly=
set archiveready=

for %%I in (%*) do (

set assigned=0
set recognized=0

if [%%I] equ [/help] (
echo Determines whether the specified subdirectory is in the specified directory.
echo.
echo fif ^(directory path^) ^(directory name^) [/h] [/r] [/a]
echo.
echo    /h - to work only with hidden files
echo    /r - to work only with readonly files
echo    /a - to work only with files, which are ready to archive
echo    You can also pass "-" mark before these 3 attributes to invert their effect.
echo    /help - to display hint
EXIT /b 0
)

if !assigned! equ 0 (
if [!directory!] equ [] (
set directory=%%I
set assigned=1
set recognized=1
)
)

if !assigned! equ 0 (
if [!dirname!] equ [] (
set dirname=%%I
set assigned=1
set recognized=1
)
)

if [%%I] equ [/h] (
set hidden=h
set recognized=1
)

if [%%I] equ [/r] (
set readonly=r
set recognized=1
)

if [%%I] equ [/a] (
set archiveready=a
set recognized=1
)

if [%%I] equ [/-h] (
set hidden=-h
set recognized=1
)

if [%%I] equ [/-r] (
set readonly=-r
set recognized=1
)

if [%%I] equ [/-a] (
set archiveready=-a
set recognized=1
)

if !recognized! equ 0 (
echo Invalid switch - "%%I".
EXIT /b 1
)

)

if [!directory!] equ [] (
echo You have to pass the directory path.
EXIT /b 1
)
if [!dirname!] equ [] (
echo You have to pass the directory name.
EXIT /b 1
)

set params=dir !directory! /b /a:d!hidden!!readonly!!archiveready!

for /f %%A in ('!params!') do (
if %%A equ !dirname! (
echo "!dirname!" was found in the specified directory.
EXIT /b 0
)
)

echo "!dirname!" was not found in the specified directory.
EXIT /b 0

endlocal