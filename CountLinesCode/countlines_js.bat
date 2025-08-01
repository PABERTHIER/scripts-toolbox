@echo off
setlocal EnableDelayedExpansion
set total=0

REM 1) List only files (/A:-D), recurse (/S), bare paths (/B)
REM 2) Suppress any dir errors (2>nul)
REM 3) Exclude unwanted folders
REM 4) Exclude yarn.lock
REM 5) Include only .ts, .js or .vue files
for /F "delims=" %%F in ('
    dir . /B /S /A:-D 2^>nul
    ^| findstr /I /V "\\node_modules\\"
    ^| findstr /I /V "\\.nuxt\\"
    ^| findstr /I /V "\\.next\\"
    ^| findstr /I /V "\\.dist\\"
    ^| findstr /I /V "\\dist\\"
    ^| findstr /I /V "\\.build\\"
    ^| findstr /I /V "\\build\\"
    ^| findstr /I /V "\\.yarn\\"
    ^| findstr /I /V "\\coverage\\"
    ^| findstr /I /V "\\tests_output\\"
    ^| findstr /I /V "\\yarn.lock$"
    ^| findstr /I /V "\\.git$"
    ^| findstr /R /I /C:"\.ts$" /C:"\.js$" /C:"\.vue$"
') do (
    for /F %%L in ('find /V /C "" ^< "%%F"') do (
        set /A total+=%%L
    )
)

echo.
echo Total lines in .ts/.js/.vue: !total!
endlocal
