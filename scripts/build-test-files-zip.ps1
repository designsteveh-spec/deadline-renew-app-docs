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
$manifest = Join-Path $outDir "included-files.txt"
$guideTxt = Join-Path $outDir "TESTER-GUIDE.txt"
$guidePdf = Join-Path $outDir "TESTER-GUIDE.pdf"
$zipPath = Join-Path $outDir "Document-Renewal-Extractor-Test-Files.zip"
$staging = Join-Path $env:TEMP "dr-test-files-zip-staging"

if (-not (Test-Path $manifest)) {
    Write-Error "Missing manifest: $manifest"
}

$relativePaths = Get-Content $manifest |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ -and -not $_.StartsWith("#") }

if ($relativePaths.Count -eq 0) {
    Write-Error "No files listed in $manifest"
}

if (Test-Path $staging) { Remove-Item $staging -Recurse -Force }
New-Item -ItemType Directory -Path $staging | Out-Null

$bundleRoot = Join-Path $staging "Document-Renewal-Extractor-Test-Files"
New-Item -ItemType Directory -Path $bundleRoot | Out-Null

Copy-Item $guideTxt (Join-Path $bundleRoot "TESTER-GUIDE.txt")
Copy-Item $guidePdf (Join-Path $bundleRoot "TESTER-GUIDE.pdf")

$totalBytes = 0L
foreach ($relative in $relativePaths) {
    $sourceFile = Join-Path $src ($relative -replace '/', '\')
    if (-not (Test-Path $sourceFile)) {
        Write-Error "Fixture not found: $sourceFile"
    }
    $destFile = Join-Path $bundleRoot ($relative -replace '/', '\')
    $destDir = Split-Path $destFile -Parent
    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }
    Copy-Item $sourceFile $destFile
    $totalBytes += (Get-Item $sourceFile).Length
}

if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
Compress-Archive -Path $bundleRoot -DestinationPath $zipPath -CompressionLevel Optimal

Remove-Item $staging -Recurse -Force

$zipMb = [math]::Round((Get-Item $zipPath).Length / 1MB, 1)
$dataMb = [math]::Round($totalBytes / 1MB, 1)
Write-Host "Created $zipPath ($zipMb MB zip, $dataMb MB uncompressed data, $($relativePaths.Count) files)"
