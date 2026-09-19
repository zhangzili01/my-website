# import-assets.ps1
# Copies photos/video from the Desktop "media" folder into the website folders,
# renaming them to the exact file names the site expects.
# No confirmation prompt: it only COPIES (your originals in media are never changed).

param([switch]$DryRun, [string]$From)

$ErrorActionPreference = 'Stop'

$repo = Split-Path -Parent $PSScriptRoot
if ([string]::IsNullOrEmpty($From)) {
    $src = Join-Path ([Environment]::GetFolderPath('Desktop')) 'media'
} else {
    $src = $From
}

$slots = @(
  'images\hero-product.jpg',
  'images\products\drive-shaft.jpg',
  'images\products\cv-axle.jpg',
  'images\products\steering-shaft.jpg',
  'images\products\universal-joint.jpg',
  'images\products\spline-shaft.jpg',
  'images\products\oem-parts.jpg',
  'images\factory\workshop.jpg',
  'images\factory\cnc.jpg',
  'images\factory\inspection.jpg'
)
$videoSlot = 'videos\factory-tour.mp4'

$imgExt = @('.jpg', '.jpeg', '.png', '.webp')
$vidExt = @('.mp4', '.m4v', '.mov')

Write-Host ""
Write-Host "===== WEBSITE ASSET IMPORT ====="
Write-Host "source folder : $src"
Write-Host "website folder: $repo"
Write-Host ""

if (-not (Test-Path -LiteralPath $src)) {
    Write-Host "[X] The folder does not exist:  $src" -ForegroundColor Red
    Write-Host "    Put your photos into that folder first, then run this again."
    exit 1
}

$all  = @(Get-ChildItem -LiteralPath $src -File | Where-Object { $_.Name -notlike '.*' })
$nat  = @{ Expression = { if ($_.BaseName -match '^(\d+)') { [int]$Matches[1] } else { 999999 } } }, @{ Expression = { $_.Name } }
$imgs = @($all | Where-Object { $imgExt -contains $_.Extension.ToLower() } | Sort-Object $nat)
$vids = @($all | Where-Object { $vidExt -contains $_.Extension.ToLower() } | Sort-Object $nat)

Write-Host ("found : {0} image(s), {1} video(s)" -f $imgs.Count, $vids.Count)
Write-Host ""

if ($imgs.Count -eq 0 -and $vids.Count -eq 0) {
    Write-Host "[X] No jpg / jpeg / png / webp / mp4 files in that folder." -ForegroundColor Red
    exit 1
}

$plan = @()
for ($i = 0; $i -lt [Math]::Min($imgs.Count, $slots.Count); $i++) {
    $plan += [pscustomobject]@{ From = $imgs[$i].FullName; To = (Join-Path $repo $slots[$i]) }
}
if ($vids.Count -gt 0) {
    $plan += [pscustomobject]@{ From = $vids[0].FullName; To = (Join-Path $repo $videoSlot) }
}

if ($DryRun) {
    Write-Host "(dry run mode: listed only, nothing was copied)"
    exit 0
}

$ok = 0
$fail = 0
foreach ($p in $plan) {
    $rel = $p.To.Replace($repo + '\', '')
    $dir = Split-Path -Parent $p.To
    try {
        if (-not (Test-Path -LiteralPath $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
        Copy-Item -LiteralPath $p.From -Destination $p.To -Force
        Write-Host ("  [OK]   {0}" -f (Split-Path -Leaf $p.From)) -ForegroundColor Green
        Write-Host ("         -> {0}" -f $rel)
        $ok++
    } catch {
        Write-Host ("  [FAIL] {0}  ->  {1}" -f (Split-Path -Leaf $p.From), $rel) -ForegroundColor Red
        Write-Host ("         reason: {0}" -f $_.Exception.Message)
        $fail++
    }
}

if ($DryRun) {
    Write-Host ""
    Write-Host "(dry run mode: listed only, nothing was copied)"
    exit 0
}

Write-Host ""
Write-Host ("RESULT: {0} copied, {1} failed." -f $ok, $fail) -ForegroundColor Yellow
if ($ok -gt 0) {
    Write-Host ""
    Write-Host "Now do this:  GitHub Desktop  ->  Commit to main  ->  Push origin"
    Write-Host "Then refresh:  https://zhangzili01.github.io/my-website/"
}
if ($imgs.Count -lt $slots.Count) {
    Write-Host ""
    Write-Host ("note: {0} image slot(s) still empty - the page shows dashed placeholders there." -f ($slots.Count - $imgs.Count))
}
Write-Host ""
