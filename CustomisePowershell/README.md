# Custom Powershell

## Install chocolatey

To install Chocolatey on Windows 10 using Command Prompt (CMD), follow these steps:

1. Open Command Prompt as an administrator:
   - Press `Win + X`.
   - Select "Command Prompt (Admin)" or "Windows PowerShell (Admin)".

2. Copy and paste the following command into the Command Prompt window:
First, we need to run the Get-ExecutionPolicy. If it returns Restricted, then we need to run one of the two commands below.

```bash
Set-ExecutionPolicy AllSigned
```

Then run this command:

```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) 
```

---

## Installing windows terminal

`choco install microsoft-windows-terminal --version 1.13.11431.0`

Importing modules into powershell

`Install-Module posh-git -Scope CurrentUser`

`Install-Module oh-my-posh -Scope CurrentUser`

`Install-Module Terminal-Icons`

Type the line below in the console to open your profile

`notepad++.exe $PROFILE`

The profile file will be created in your path: C:\Users\{user}\Documents\windowspowershell

- Microsoft.PowerShell_profile.ps1

In the file *Microsoft.PowerShell_profile.ps1*

```bash
Import-Module posh-git # Importing the git module
Import-Module Terminal-Icons # Importing the icons module

oh-my-posh init pwsh --config Path\To\jandedobbeleer2.omp.json | Invoke-Expression
```

---

## Custom theme

Go to see this file: **jandedobbeleer2.omp.json**

To get the list of themes:

`Get-PoshThemes`

Location of wt.exe: C:\Users\{user}\AppData\Local\Microsoft\WindowsApps

To split or have multiple tabs in your terminal at startup:
Ctrl+, in your terminal, go to the JSON file

Add the line after schema

split-pane => allows you to have several consoles in a window
new-tab => opens a new tab

**Ex:**
`"startupActions": "new-tab -d C://Workspace//RepoA --title RepoA ; split-pane -d C://Workspace//RepoB --title RepoB ; split-pane -d C://Workspace//RepoC --title RepoC ; new-tab -d C://Workspace//RepoD --title RepoD",`

---

## My selected theme

unicorn.omp.json

```json
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "final_space": true,
  "console_title": true,
  "console_title_style": "template",
  "console_title_template": "{{.User}}@{{.Host}} in {{ .Path }}",
  "blocks": [
    {
      "type": "prompt",
      "alignment": "left",
      "vertical_offset": 1,
      "segments": [
        {
          "type": "os",
          "style": "powerline",
          "powerline_symbol": "\uE0B0",
          "foreground": "#fff",
          "background": "#003543",
          "properties": {
            "prefix": " ",
            "windows": "\uE62A ",
            "postfix": ""
          }
        },
        {
          "type": "path",
          "style": "powerline",
          "powerline_symbol": "\uE0B0",
          "foreground": "#fff",
          "background": "#01568b",
          "properties": {
            "prefix": " \uE5FF ",
            "style": "full",
            "folder_separator_icon": "/"
          }
        },
        {
          "type": "git",
          "style": "powerline",
          "powerline_symbol": "",
          "foreground": "#fff",
          "background": "#929412",
          "properties": {
            "display_stash_count": true,
            "display_upstream_icon": true,
            "status_colors_enabled": true,
            "display_status": true,
            "local_changes_color": "#5600cf",
            "ahead_and_behind_color": "#f26d50",
            "behind_color": "#f17c37",
            "ahead_color": "#89d1dc",
            "stash_count_icon": "\uF692 "
          }
        },
        {
          "type": "time",
          "style": "powerline",
          "powerline_symbol": "\uE0B0",
          "foreground": "#fff",
          "background": "#003543",
          "properties": {
            "prefix": "<#fff> \uf64f </>"
          }
        },
        {
          "type": "executiontime",
          "style": "diamond",
          "foreground": "#ffffff",
          "background": "#cf0000",
          "leading_diamond": "",
          "trailing_diamond": "",
          "properties": {
            "always_enabled": true,
            "prefix": " \ufa1e ",
            "postfix": "\u2800"
          }
        }
      ]
    },
    {
      "type": "prompt",
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "type": "root",
          "style": "plain",
          "foreground": "#ecf009",
          "properties": {
            "root_icon": "⚡"
          }
        },
        {
          "type": "text",
          "style": "plain",
          "foreground": "#f1184c",
          "properties": {
            "prefix": "",
            "text": "🍻"
          }
        }
      ]
    }
  ]
}
```
