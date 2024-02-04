@echo off
echo Listing all scheduled tasks:
schtasks /query /fo LIST /v | .[1:] | map(split(" ")) | map({(.[0]): .[1:]}) | add' > tasks.json
echo Saved output to tasks.json
pause
