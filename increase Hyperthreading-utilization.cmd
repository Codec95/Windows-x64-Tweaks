@echo off
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\KGroups" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\KGroups\00" /f

echo Select your CPU configuration:
echo 1. 2 cores, 4 threads
echo 2. 4 cores, 8 threads
echo 3. 6 cores, 12 threads
echo 4. 8 cores, 16 threads
echo 5. 10 cores, 20 threads
echo 6. 16 cores, 32 threads
set /p choice="Enter the number corresponding to your configuration: "

if %choice%==1 (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\KGroups\00" /v SmallProcessorMask /t REG_DWORD /d 0x0000000A /f
) else if %choice%==2 (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\KGroups\00" /v SmallProcessorMask /t REG_DWORD /d 0x000000AA /f
) else if %choice%==3 (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\KGroups\00" /v SmallProcessorMask /t REG_DWORD /d 0x00000AAA /f
) else if %choice%==4 (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\KGroups\00" /v SmallProcessorMask /t REG_DWORD /d 0x0000AAAA /f
) else if %choice%==5 (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\KGroups\00" /v SmallProcessorMask /t REG_DWORD /d 0x000AAAAA /f
) else if %choice%==6 (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\KGroups\00" /v SmallProcessorMask /t REG_DWORD /d 0xAAAAAAAA /f
) else (
    echo Invalid selection. No changes were made.
    exit /b
)

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DynamicHeteroCpuPolicyMask /t REG_DWORD /d 0x00000002 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DefaultDynamicHeteroCpuPolicy /t REG_DWORD /d 0x00000004 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DynamicHeteroCpuPolicyImportant /t REG_DWORD /d 0x00000007 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DynamicHeteroCpuPolicyImportantShort /t REG_DWORD /d 0x00000007 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v DynamicHeteroCpuPolicyImportantPriority /t REG_DWORD /d 0x0000000d /f

echo Configuration applied. Please restart your computer for the changes to take effect.
pause

