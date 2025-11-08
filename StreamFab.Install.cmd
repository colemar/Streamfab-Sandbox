@echo off
setlocal

set "SCRIPT_PATH=%~dp0"
set "HOST_PATH=%SCRIPT_PATH:~0,-1%"

set "TEMP_WSB=%TEMP%\dynamic_sandbox.wsb"

echo Creating "%TEMP%\dynamic_sandbox.wsb"...
(
echo ^<Configuration^>
echo   ^<MappedFolders^>
echo     ^<MappedFolder^>
echo       ^<HostFolder^>%HOST_PATH%^</HostFolder^>
echo       ^<SandboxFolder^>C:\Users\WDAGUtilityAccount\Desktop\Host^</SandboxFolder^>
echo       ^<ReadOnly^>false^</ReadOnly^>
echo     ^</MappedFolder^>
echo   ^</MappedFolders^>
echo   ^<LogonCommand^>
echo     ^<Command^>C:\Users\WDAGUtilityAccount\Desktop\Host\StreamFab.Install.exe^</Command^>
echo   ^</LogonCommand^>
echo ^</Configuration^>
) > "%TEMP_WSB%"

echo Starting Sandbox...
start "" "%TEMP_WSB%"
