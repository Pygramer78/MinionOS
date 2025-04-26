@echo off
rem Bienvenido a MiniKo, la nueva interfaz de MS-DOS.
rem Configuración; cambia las configuraciones.
rem Cuidado con las que enciendes aquí, el programa se puede poner pesado.
setlocal

set /a pesado=false
set /a ventanas=10
set /a programa=false
set directorio=C:\pranky_files\MiniKo\MiniKo.bat

goto :inicio

:inicio
cls
echo Bienvenido a MiniKo
choice abc "Eliga entre a.menu b.eliminar c.salir"

if errorlevel 3 (
    echo Has elegido salir. ¡Vuelve pronto!
    goto :salir
)
if errorlevel 2 (
    echo Has elegido ir a eliminar
    goto :eliminar
)
if errorlevel 1 (
    echo Has elegido ir al menu principal
    goto :menu
)

:menu
cls
echo -- menu --
echo [a] buscar archivo...
echo [b] entrar en el explorador de archivos
echo [c] sobre nosotros
echo [d] limpiar
echo [e] salir
echo [f] crear archivos
choice abcdef "Elige entre las opciones de arriba"

if errorlevel 6 goto :crear
if errorlevel 5 goto :salir
if errorlevel 4 goto :limpiar
if errorlevel 3 goto :sobre_nosotros
if errorlevel 2 goto :explorador
if errorlevel 1 goto :buscar

:buscar
cls
echo -- busqueda --
set /p argument="Ruta para el archivo o carpeta: "
if exist "%argument%" (
    echo "%argument%" si existe
) else (
    echo "%argument%" no existe
)
echo Saliendo al menu...
pause
goto :menu

:explorador
cls
echo -- explorador --
set /p ruta="Escribe una ruta: "
if /i "%ruta%"=="close" goto :menu
if "%ruta%"=="" (
    echo Uso: ruta [si quieres salir, escribe "close"]
    pause
    goto :explorador
)
if exist "%ruta%" (
    cd /d "%ruta%"
) else (
    echo Ruta no encontrada.
    pause
)
echo Contenido del directorio actual:
dir
pause
goto :explorador

:limpiar
cls
goto :menu

:salir
cls
choice sn "Cerrar programa [S/N]" 
if errorlevel 2 (
    echo Volviendo al inicio...
    goto :inicio
)
if errorlevel 1 (
    exit /b
)

:sobre_nosotros
cls
echo Equipo Codeadventure 2012 - 2025 copyright
pause
goto :menu

:troyano_muy_pesado
set /a contador=0
:loop_ventanas
if %contador% GEQ %ventanas% goto :menu
start cmd.exe /k echo JAJAJAJA TENGO TODO EL CONTROL, ES BROMA XD
set /a contador+=1
goto :loop_ventanas

:eliminar
cls
echo -- eliminar --
echo Vas a eliminar esta aplicacion o un archivo/directorio?
choice abcd "[a] aplicacion [b] archivo [c] directorio [d] salir"

if errorlevel 4 (
    echo Volviendo a inicio...
    goto :inicio
)
if errorlevel 3 (
    set /p direc="Escribe la ruta del directorio: "
    if exist "%direc%" (
        rmdir /s /q "%direc%"
        echo Directorio eliminado.
    ) else (
        echo Directorio no encontrado.
    )
    pause
    goto :menu
)
if errorlevel 2 (
    set /p arc="Escribe la ruta del archivo: "
    if exist "%arc%" (
        del "%arc%"
        echo Archivo eliminado.
    ) else (
        echo Archivo no encontrado.
    )
    pause
    goto :menu
)
if errorlevel 1 (
    echo Eliminando MiniKo...
    del "%directorio%"
    exit /b
)

:crear
cls
echo -- crear --
echo Ruta actual: %cd%
dir
choice sn "¿Cambiar de directorio? [S/N]"
if errorlevel 2 goto :crear_archivo
if errorlevel 1 (
    set /p dre="Escribe la nueva ruta: "
    if exist "%dre%" (
        cd /d "%dre%"
    ) else (
        echo Ruta no encontrada.
        pause
    )
)
:crear_archivo
cls
echo Ruta actual: %cd%
choice ad "¿Crear archivo o directorio? [A/D]"
if errorlevel 2 (
    set /p nombre_dir="Nombre del directorio: "
    md "%nombre_dir%" || echo Error al crear el directorio.
    echo Directorio creado exitosamente.
    pause
    goto :menu
)
if errorlevel 1 (
    set /p nombre_arch="Nombre del archivo (con extension): "
    type nul > "%nombre_arch%" || echo Error al crear el archivo.
    echo Archivo creado exitosamente.
    pause
    goto :menu
)

rem FIN DEL PROGRAMA
