@echo off
setlocal EnableDelayedExpansion

REM ——————————————————————————————
REM 1) PROMPTS
REM ——————————————————————————————
set /P TargetDir=Directory to analyze (full or relative path): 
set /P EXTS=Extensions to include (comma-separated, no dots, e.g. ts,js,vue or cs,xaml): 

REM wrap commas so we can do simple substring checks later
set "EXTS=,%EXTS%,"

REM initialize total
set total=0

REM ——————————————————————————————
REM 2) GATHER & FILTER FILE LIST
REM ——————————————————————————————
for /F "delims=" %%F in ('
    dir "%TargetDir%" /B /S /A:-D 2^>nul
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
    ^| findstr /I /V "\\.git$"
    ^| findstr /I /V "yarn.lock$"
') do (
  REM get extension without dot
  set "ext=%%~xF"
  set "ext=!ext:~1!"

  REM only proceed if ext is in our comma-wrapped list
  echo !EXTS! | findstr /I /C:",!ext!," >nul
  if not errorlevel 1 (
    REM count lines and add to total
    for /F %%L in ('find /V /C "" ^< "%%F"') do (
      set /A total+=%%L
    )
  )
)

REM ——————————————————————————————
REM 3) REPORT
REM ——————————————————————————————
set "list=!EXTS:~1,-1!"
echo.
echo Total lines in %TargetDir% (!list!): !total!

endlocal
