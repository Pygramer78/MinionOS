@echo off
rem Welcome to MinionOS
rem This is a prank program that simulates a fake operating system.
rem Configurations; 
rem Be careful, this is a prank program.
rem We are not responsible for any damage caused by this program.
rem This program is a joke and should not be taken seriously.

set /a annoying=false
set /a windows=10
set /a program=false
set directory=C:\pranky_files\MiniKo\MiniKo.bat

goto :start

:start
cls
echo Welcome to MiniKo
choice abc "Choose between a.menu b.delete c.exit"

if errorlevel 3 (
    echo You chose to exit. Come back soon!
    goto :exit
)
if errorlevel 2 (
    echo You chose to go to delete
    goto :delete
)
if errorlevel 1 (
    echo You chose to go to the main menu
    goto :menu
)

:menu
cls
echo -- menu --
echo [a] search for a file...
echo [b] enter the file explorer
echo [c] about us
echo [d] clean
echo [e] exit
echo [f] create files
choice abcdef "Choose from the options above"

if errorlevel 6 goto :create
if errorlevel 5 goto :exit
if errorlevel 4 goto :clean
if errorlevel 3 goto :about_us
if errorlevel 2 goto :explorer
if errorlevel 1 goto :search

:search
cls
echo -- search --
set /p argument="Path to the file or folder: "
if exist %argument% (
    echo %argument% exists
) else (
    echo %argument% does not exist
)
echo Returning to the menu...
pause
goto :menu

:explorer
cls
echo -- explorer --
set /p path="Write the path to the directory: "
if /i %path% == close goto :menu
if [%path%] == [] (
    echo Use: path [if you want to go to the menu type "close"]
    pause
    goto :explorer
)

echo Current directory contents:
dir
pause
goto :explorer

:clean
cls
goto :menu

:exit
cls
choice yn "Close program [Y/N]" 
if errorlevel 2 (
    echo Returning to start...
    goto :start
)
if errorlevel 1 (
    exit /b
)

:about_us
cls
echo Team Codeadventure 2012 - 2025 copyright
pause
goto :menu

:heavy_prank
set /a counter=0
:loop_windows
if %counter% GEQ %windows% goto :menu
start cmd.exe /k echo HAHAHA I HAVE FULL CONTROL, JUST KIDDING XD
set /a counter+=1
goto :loop_windows

:delete
cls
echo -- delete --
echo Are you going to delete this application or a file/directory?
choice abcd "[a] application [b] file [c] directory [d] exit"

if errorlevel 4 (
    echo Returning to start...
    goto :start
)
if errorlevel 3 (
    set /p dir="Write the path to the directory: "
    if exist "%dir%" (
        rmdir /s /q "%dir%"
        echo Directory deleted.
    ) else (
        echo Directory not found.
    )
    pause
    goto :menu
)
if errorlevel 2 (
    set /p file="Write the path to the file: "
    if exist "%file%" (
        del "%file%"
        echo File deleted.
    ) else (
        echo File not found.
    )
    pause
    goto :menu
)
if errorlevel 1 (
    echo Deleting MiniKo...
    del "%directory%"
    exit /b
)

:create
cls
echo -- create --
echo Current path: %cd%
dir
choice sn "Change directory? [Y/N]"
if errorlevel 2 goto :create_file
if errorlevel 1 (
    set /p new_path="Write the new path: "
    if exist %new_path% (
        dir %new_path%
    ) else (
        echo Path not found.
        pause
    )
)
:create_file
cls
echo Current path: %cd%
choice ad "Create file or directory? [F/D]"
if errorlevel 2 (
    set /p dir_name="Directory name and path: "
    md "%dir_name%" || echo Error creating the directory.
    if exist %dir_name% echo Directory created successfully.
    pause
    goto :menu
)
if errorlevel 1 (
    set /p file_name="File name and path (with extension): "
    type nul > "%file_name%" || echo Error creating the file.
    if exist %file_name% echo File created successfully.
    pause
    goto :menu
)

rem END OF PROGRAM