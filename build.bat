@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
    echo Usage: build.bat filename
    exit /b 1
)


set filename=%1
set outputname=%dist/filename:.c=%

gcc !filename! src/icu.c -o !outputname!
