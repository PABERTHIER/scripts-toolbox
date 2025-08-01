@echo off
setlocal EnableDelayedExpansion
set total=0

REM 1) List only files (/A:-D), recurse (/S), bare paths (/B)
REM 2) Suppress any dir errors (2>nul)
REM 3) Exclude unwanted folders
REM 4) Include only .cs or .xaml files
for /F "delims=" %%F in ('
    dir . /B /S /A:-D 2^>nul
    ^| findstr /I /V "\\.git$"
    ^| findstr /R /I /C:"\.cs$" /C:"\.xaml$"
') do (
    for /F %%L in ('find /V /C "" ^< "%%F"') do (
        set /A total+=%%L
    )
)

echo.
echo Total lines in .cs/.xaml: !total!
endlocal
