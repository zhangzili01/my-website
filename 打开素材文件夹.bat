@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "$d=Join-Path ([Environment]::GetFolderPath('Desktop')) 'media'; if(-not(Test-Path -LiteralPath $d)){New-Item -ItemType Directory -Force -Path $d | Out-Null}; Start-Process $d"
