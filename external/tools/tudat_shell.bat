::   Copyright (c) 2010-2017, Delft University of Technology
::   All rigths reserved
::
::   This file is part of the Tudat. Redistribution and use in source and
::   binary forms, with or without modification, are permitted exclusively
::   under the terms of the Modified BSD license. You should have received
::   a copy of the license with this file. If not, please or visit:
::   http://tudat.tudelft.nl/LICENSE.

@echo off

:: Check if CMake is in path, otherwise add it
echo %PATH% | findstr /C:"CMake" >nul 2>&1
if errorlevel 1 for /f "tokens=2*" %%a in ('reg query HKLM\Software\Kitware\CMake /v InstallDir') do set "PATH=%PATH%;%%%b\bin"

:: Set Qt Path
for /f "tokens=2*" %%a in ('REG QUERY HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall /s /v InstallLocation ^| FINDSTR "Qt"') do set QTDIR=%%%b
if "%QTDIR%"=="" set /p QTDIR=Qt directory not found, please enter manually: 

:: Check if mingw is in path
echo %PATH% | findstr /C:"mingw" >nul 2>&1
if errorlevel 1 for /f "tokens=1" %%A in ('dir %QTDIR%\Tools /ad /b ^| findstr "\<mingw.*"') do set PATH=%PATH%;%QTDIR%\Tools\%%A\bin

:: Set SmartGit Path
for /f "tokens=2*" %%a in ('REG QUERY HKLM\Software\Microsoft\Windows\CurrentVersion\Uninstall /s /v InstallLocation ^| FINDSTR "SmartGit"') do set SMARTGITDIR=%%%b
if "%SMARTGITDIR%"=="" for /f "tokens=2*" %%a in ('REG QUERY HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall /s /v InstallLocation ^| FINDSTR "SmartGit"') do set SMARTGITDIR=%%%b
if "%SMARTGITDIR%"=="" set /p SMARTGITDIR=SmartGit directory not found, please enter manually: 

:: Check if git is in path
echo %PATH% | findstr /C:"git\cmd" >nul 2>&1
if errorlevel 1 set PATH=%PATH%;%SMARTGITDIR%\git\cmd

:: Alias make and cmake
doskey make=mingw32-make $*
doskey cmake=cmake -G "MinGW Makefiles" $*
doskey ls=dir $*
doskey rm=del $*
doskey mv=move $*

:: Enter the matrix
color 02
echo Welcome to Tudat dev shell, you now have GCC, make and git at your fingertips.
echo.
cmd
