Set-PSReadLineOption -PredictionViewStyle ListView -PredictionSource History -HistoryNoDuplicates -MaximumHistoryCount 10000

oh-my-posh init pwsh --config C:\Users\barto\Documents\PowerShell/jandedobbeleer.omp.json | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

if ($env:TERM_PROGRAM -eq "kiro") { . "$(kiro --locate-shell-integration-path pwsh)" }

Clear-Host
Clear-Host

# winfetch

# Shortcuts: quick navigation helpers
function github {
  param(
    [string]$SubPath
  )

  $base = 'C:\_GITHUB_'
  if ($SubPath) { $target = Join-Path -Path $base -ChildPath $SubPath } else { $target = $base }

  if (-not (Test-Path -Path $target)) {
    Write-Warning "Target path '$target' does not exist."
    return
  }

  Set-Location -LiteralPath $target
}

function temp {
  param(
    [string]$SubPath
  )

  $base = 'C:\_TEMP_'
  if ($SubPath) { $target = Join-Path -Path $base -ChildPath $SubPath } else { $target = $base }

  if (-not (Test-Path -Path $target)) {
    Write-Warning "Target path '$target' does not exist."
    return
  }

  Set-Location -LiteralPath $target
}

function onedrive {
  param(
    [string]$SubPath
  )

  $base = "$env:USERPROFILE\OneDrive"
  if ($SubPath) { $target = Join-Path -Path $base -ChildPath $SubPath } else { $target = $base }

  if (-not (Test-Path -Path $target)) {
    Write-Warning "Target path '$target' does not exist."
    return
  }

  Set-Location -LiteralPath $target
}
