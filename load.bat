@echo off
setlocal EnableDelayedExpansion
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"

FOR /L %%n in (1,1,10) DO (
    call :spinner
    ping localhost -n 2 > nul
)
cmd
exit /b

:spinner
set /a "spinner=(spinner + 1) %% 4"
set "spinChars=\|/-"
<nul set /p ".=Chargement... !spinChars:~%spinner%,1!!CR!"
exit /b
