@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Usage: build.bat filename
    exit /b 1
)

set filename=%1
set outputname=%filename:.c=%

gcc !filename! icu26.c -o !outputname!
