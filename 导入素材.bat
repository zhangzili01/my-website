@echo off
title Import website assets
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0tools\import-assets.ps1"
echo.
pause
