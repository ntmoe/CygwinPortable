@echo off

rem This script is meant to be run by a vbs script in the
rem CygwinPortable root directory. If this is not the case,
rem uncomment the cd command below.
rem Change to the root of the CygwinPortable directory
rem cd ..\..

rem Find the USB stick's drive letter and the path for the Cygwin directory
rem CYGROOT will be something like E:\PortableApps\CygwinPortable\
rem USBDRV will be something like E:
SET CYGROOT=%cd%\
SET USBDRV=%~d0

REM Set some general environment variables
set PATHORIG=%PATH%
set PATH=%CYGROOT%bin;%PATH%
set ALLUSERSPROFILE=%USBDRV%\ProgramData
set ProgramData=%USBDRV%\ProgramData
set CYGWIN=nodosfilewarning

rem This specifies the login to use.
set USERNAME=ntmoe
set HOME=%USBDRV%

rem Make sure /etc/passwd and /etc/group are set up for us
%CYGROOT%bin\bash /Other/user_setup.sh

rem Start XWin
start /b %CYGROOT%bin/run.exe /usr/bin/bash.exe -l -c "/usr/bin/startxwin.exe -- -nolock -unixkill"
