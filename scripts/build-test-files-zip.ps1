# Builds Document-Renewal-Extractor-Test-Files.zip for the docs repo.
# Usage: .\scripts\build-test-files-zip.ps1

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path $PSScriptRoot -Parent
$src = Join-Path (Split-Path $repoRoot -Parent) "deadline-renew-testFIles"
if (-not (Test-Path $src)) {
    $src = "C:\Users\Stevo\Documents\Cursor Dev Sandbox\deadline-renew-project\deadline-renew-testFIles"
}
if (-not (Test-Path $src)) {
    Write-Error "Test fixtures not found at $src"
}
$src = (Resolve-Path $src).Path

$outDir = Join-Path $repoRoot "test-files"
$guideTxt = Join-Path $outDir "TESTER-GUIDE.txt"
$guidePdf = Join-Path $outDir "TESTER-GUIDE.pdf"
$zipPath = Join-Path $outDir "Document-Renewal-Extractor-Test-Files.zip"
$staging = Join-Path $env:TEMP "dr-test-files-zip-staging"

if (Test-Path $staging) { Remove-Item $staging -Recurse -Force }
New-Item -ItemType Directory -Path $staging | Out-Null

$bundleRoot = Join-Path $staging "Document-Renewal-Extractor-Test-Files"
New-Item -ItemType Directory -Path $bundleRoot | Out-Null

Copy-Item $guideTxt (Join-Path $bundleRoot "TESTER-GUIDE.txt")
Copy-Item $guidePdf (Join-Path $bundleRoot "TESTER-GUIDE.pdf")

foreach ($folder in @("synthetic", "realworld", "documents")) {
    $from = Join-Path $src $folder
    if (Test-Path $from) {
        Copy-Item $from (Join-Path $bundleRoot $folder) -Recurse
    }
}

if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
Compress-Archive -Path $bundleRoot -DestinationPath $zipPath -CompressionLevel Optimal

Remove-Item $staging -Recurse -Force

$sizeMb = [math]::Round((Get-Item $zipPath).Length / 1MB, 1)
Write-Host "Created $zipPath ($sizeMb MB)"
