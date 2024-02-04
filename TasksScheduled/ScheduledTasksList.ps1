Get-ScheduledTask | Select-Object TaskName, NextRunTime, State, Date | ConvertTo-Json | Out-File tasks.json
