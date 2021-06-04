@echo off
@setlocal

@set "rev=0.0.1"
@set "lastupdt=2021-06-04"

if "%~1" == "" exit /b 1
if not exist "%~1" exit /b 2

call:Logo

@echo You are transferring
@echo     %~1
@echo;

if not defined scpit_host set /p "scpit_host=Remote host: "
if not defined scpit_user set /p "scpit_user=Remote username: "

if not defined scpit_host exit /b 3
if not defined scpit_user exit /b 4

scp "%~1" %scpit_user%@%scpit_host%:%scpit_dest%

if %errorlevel% NEQ 0 pause
exit /b

:Logo
@title SCP it v%rev%
@echo;
@echo                                  SCP it v%rev%
@echo                             Last Update: %lastupdt%
@echo                          https://github.com/lxvs/scpit
@echo;
@exit /b 0
