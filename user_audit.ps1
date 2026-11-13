# Go through every local user one by one: set preset password, delete, or skip.
# Run in an elevated (Administrator) PowerShell:
#   Set-ExecutionPolicy -Scope Process Bypass
#   .\user_audit.ps1

$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Run this from an elevated PowerShell (Run as administrator)." -ForegroundColor Red
    exit 1
}

# ---- Safeguard: record the current state and log every action ----
$stamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupDir = Join-Path $env:SystemDrive "user_audit_backup_$stamp"
try {
    New-Item -ItemType Directory -Path $backupDir -ErrorAction Stop | Out-Null
    Get-LocalUser | Select-Object * | Export-Csv (Join-Path $backupDir "users.csv") -NoTypeInformation
    $rows = foreach ($g in Get-LocalGroup) {
        foreach ($m in (Get-LocalGroupMember -Group $g.Name -ErrorAction SilentlyContinue)) {
            [pscustomobject]@{ Group = $g.Name; Member = $m.Name }
        }
    }
    $rows | Export-Csv (Join-Path $backupDir "group_members.csv") -NoTypeInformation
    $LogFile = Join-Path $backupDir "actions.log"
    "Audit started $(Get-Date)" | Out-File $LogFile
    Write-Host "Saved a record of all users and group memberships in $backupDir"
} catch {
    Write-Host "Could not write the backup record: $($_.Exception.Message). Exiting." -ForegroundColor Red
    exit 1
}

# Try to create a System Restore point (Windows allows one per 24h by default; failure is not fatal)
try {
    Enable-ComputerRestore -Drive "$env:SystemDrive\" -ErrorAction Stop
    Checkpoint-Computer -Description "Before user_audit $stamp" -RestorePointType MODIFY_SETTINGS -ErrorAction Stop
    Write-Host "System Restore point created."
} catch {
    Write-Host "Could not create a restore point (continuing): $($_.Exception.Message)" -ForegroundColor Yellow
}

# Ask for the preset password once (hidden input, not stored in the script)
$pw1 = Read-Host "Preset password to assign" -AsSecureString
$pw2 = Read-Host "Confirm preset password" -AsSecureString
$p1 = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pw1))
$p2 = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pw2))
if ([string]::IsNullOrEmpty($p1) -or $p1 -ne $p2) {
    Write-Host "Passwords empty or don't match. Exiting." -ForegroundColor Red
    exit 1
}

$currentUser = $env:USERNAME
$users = Get-LocalUser

Write-Host "Found $($users.Count) local user(s)."

foreach ($u in $users) {
    $isAdmin = $false
    try {
        $admins = Get-LocalGroupMember -Group "Administrators" -ErrorAction Stop |
                  ForEach-Object { $_.Name.Split('\')[-1] }
        $isAdmin = $admins -contains $u.Name
    } catch {}

    Write-Host ""
    Write-Host "=============================="
    Write-Host "User:    $($u.Name)"
    Write-Host "Enabled: $($u.Enabled)"
    Write-Host "Desc:    $($u.Description)"
    if ($isAdmin) { Write-Host "** This user is an ADMINISTRATOR **" -ForegroundColor Yellow }
    if ($u.Name -eq $currentUser) { Write-Host "** This is the account you are running this script from **" -ForegroundColor Yellow }

    $choice = Read-Host "[p]assword reset / [d]elete / [s]kip / [q]uit ?"
    if ($choice.ToLower() -eq "q") { Write-Host "Quitting."; break }

    if ($choice.ToLower() -eq "p") {
        try {
            Set-LocalUser -Name $u.Name -Password (ConvertTo-SecureString $p1 -AsPlainText -Force) -ErrorAction Stop
            Write-Host "Password set for $($u.Name)." -ForegroundColor Green
            "$(Get-Date -Format T) password reset: $($u.Name)" | Out-File $LogFile -Append
        } catch {
            Write-Host "Failed: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
    elseif ($choice.ToLower() -eq "d") {
        if ($u.Name -eq $currentUser) {
            Write-Host "Refusing to delete the account you're logged in as." -ForegroundColor Red
        }
        else {
            $confirm = Read-Host "Are you sure you want to DELETE '$($u.Name)'? (yes/no)"
            if ($confirm.ToLower() -eq "yes") {
                try {
                    # Grab the profile first so it can be removed too (do not name this $profile: that is a built-in variable)
                    $userProfile = Get-CimInstance Win32_UserProfile |
                        Where-Object { $_.SID -eq $u.SID.Value }
                    Remove-LocalUser -Name $u.Name -ErrorAction Stop
                    Write-Host "Deleted $($u.Name)." -ForegroundColor Green
                    "$(Get-Date -Format T) deleted: $($u.Name)" | Out-File $LogFile -Append
                    if ($userProfile) {
                        $rp = Read-Host "Also delete their profile folder ($($userProfile.LocalPath))? (yes/no)"
                        if ($rp.ToLower() -eq "yes") {
                            Remove-CimInstance -InputObject $userProfile
                            "$(Get-Date -Format T) deleted profile folder: $($userProfile.LocalPath)" | Out-File $LogFile -Append
                        }
                    }
                } catch {
                    Write-Host "Failed: $($_.Exception.Message)" -ForegroundColor Red
                }
            } else {
                Write-Host "Cancelled, $($u.Name) kept."
            }
        }
    }
    else {
        Write-Host "Skipped $($u.Name)."
    }
}

$p1 = $null; $p2 = $null
Write-Host ""
Write-Host "Done. Log: $LogFile"
