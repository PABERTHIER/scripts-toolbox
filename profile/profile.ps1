# Create a folder, called "WindowsPowerShell" in here: C:\Users\<username>\Documents\ and add the powershell scripts in it.

$basePath = "~\Documents\WindowsPowerShell"

Import-Module -Name "$basePath\shortcuts.psm1" -Force
