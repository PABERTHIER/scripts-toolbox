Import-Module oh-my-posh 
Import-Module posh-git

Import-Module Terminal-Icons

Set-PoshPrompt -Theme unicorn

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
