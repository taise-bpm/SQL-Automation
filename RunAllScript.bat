@echo off
setlocal

REM === Prompt for server name ===
:SERVERLOOP
set /p SERVER=Enter SQL Server name (e.g., LAPTOP-FTE91IQE): 
echo You entered "%SERVER%"
set /p CONFIRM=Is this correct? (Y/N): 
if /I "%CONFIRM%" neq "Y" goto SERVERLOOP

REM === Prompt for database name ===
:DBLOOP
set /p DBNAME=Enter database name: 
echo You entered "%DBNAME%"
set /p CONFIRM=Is this correct? (Y/N): 
if /I "%CONFIRM%" neq "Y" goto DBLOOP

REM === Logs ===
set "LOG=run_report.txt"
echo Script run report - %date% %time% > "%LOG%"

REM === Run all .sql scripts in directory ===
for %%G in (*.sql) do (
    echo Running %%G... >> "%LOG%"
    sqlcmd /S "%SERVER%" /d "%DBNAME%" -E -i"%%G" >nul 2>&1
    if errorlevel 1 (
        echo [FAILED ] %%G >> "%LOG%"
    ) else (
        echo [SUCCESS] %%G >> "%LOG%"
    )
)
echo.
echo Batch processing complete. See "%LOG%" for details.
pause
