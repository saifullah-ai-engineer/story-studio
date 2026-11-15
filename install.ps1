# Story Studio Installer (Windows PowerShell)
$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = New-Object System.Text.UTF8Encoding($false)

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " Story Studio One-Click Installer" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$userHome = [Environment]::GetFolderPath('UserProfile')
$targetCandidates = @(
    (Join-Path $userHome ".codex\skills"),
    (Join-Path $userHome ".claude\skills"),
    (Join-Path $userHome ".agents\skills")
)

$targetSkillsDir = $null
foreach ($dir in $targetCandidates) {
    $parentDir = Split-Path $dir
    if (Test-Path -LiteralPath $parentDir) {
        $targetSkillsDir = $dir
        break
    }
}

if (-not $targetSkillsDir) {
    $targetSkillsDir = Join-Path $userHome ".codex\skills"
}

if (-not (Test-Path -LiteralPath $targetSkillsDir)) {
    New-Item -ItemType Directory -Path $targetSkillsDir -Force | Out-Null
}

$destDir = Join-Path $targetSkillsDir "story-studio"
$srcDir = $PSScriptRoot

Write-Host "Detected Agent skills directory: $targetSkillsDir" -ForegroundColor Green
Write-Host "Target install path: $destDir"

if ($srcDir.TrimEnd('\') -ieq $destDir.TrimEnd('\')) {
    Write-Host "[OK] Already in the target skills directory, no need to copy again." -ForegroundColor Green
} else {
    Write-Host "Copying skill files to the target directory..." -ForegroundColor Yellow
    if (-not (Test-Path -LiteralPath $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }
    Copy-Item -Path "$srcDir\*" -Destination $destDir -Recurse -Force
    Write-Host "[OK] Skill files installed!" -ForegroundColor Green
}

$bootstrapScript = Join-Path $destDir "scripts\bootstrap.ps1"
if (Test-Path -LiteralPath $bootstrapScript) {
    Write-Host ""
    Write-Host "Running the environment dependency check..." -ForegroundColor Cyan
    try {
        & powershell.exe -ExecutionPolicy Bypass -File $bootstrapScript -Action check
    } catch {
        Write-Host "Environment check finished. Any missing parts can be configured automatically in the Agent." -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host "Now open your AI Agent and send this directly:" -ForegroundColor White
Write-Host "  Use `$story-studio to check and configure the full runtime environment for me." -ForegroundColor Yellow
Write-Host "==========================================" -ForegroundColor Green
