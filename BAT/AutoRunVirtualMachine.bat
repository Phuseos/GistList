@ECHO OFF
:: Navigate to the default VirtualBox install directory 
C:
cd C:\Program Files\Oracle\VirtualBox
:: Run the VM Headless
start /wait VBoxManage.exe startvm "YourVMName"

:: The loop, find the task, keep looping until a not found error is thrown
:LOOP
tasklist | find /i "VirtualBox" >nul 2>&1
IF ERRORLEVEL 1 (
  :: VirtualBox process not found, exit loop
  GOTO EXIT
) ELSE (
  :: Virtual Machine Is still running
  Timeout /T 5 /Nobreak
  GOTO LOOP
)

:: Task is no longer found, keep the console open for feedback
:EXIT
PAUSE