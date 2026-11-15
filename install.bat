@echo off
chcp 65001 >nul
title Story Studio One-Click Installer
powershell -ExecutionPolicy Bypass -File "%~dp0install.ps1"
pause
