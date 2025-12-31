@echo off
setlocal

rem --- Preparar ESC para colores ANSI ---
for /f "delims=" %%A in ('echo prompt $E^| cmd') do set "ESC=%%A"

rem Colores por tipo de mensaje
set "C_INFO=%ESC%[36m"
set "C_OK=%ESC%[32m"
set "C_WARN=%ESC%[33m"
set "C_ERR=%ESC%[31m"
set "C_YT=%ESC%[91m"
set "C_ORANGE=%ESC%[93m"
set "C_RESET=%ESC%[0m"

color 0B
title Alecstry BRD Tool - Instalar / Actualizar / Desinstalar

echo ============================================
echo         Alecstry - BRD Tool v1
echo   (https://www.youtube.com/@alecstry)
echo ============================================
echo.

rem -------------------------------------------------
rem 1) INTENTAR DETECTAR RUTA AUTOMATICAMENTE
rem -------------------------------------------------
set "MCBEDROCK="

echo %C_INFO%[INFO]%C_RESET% Buscando instalacion en XboxGames...
echo.

if exist "C:\XboxGames\Minecraft for Windows\Content\Minecraft.Windows.exe" set "MCBEDROCK=C:\XboxGames\Minecraft for Windows\Content"
if exist "D:\XboxGames\Minecraft for Windows\Content\Minecraft.Windows.exe" set "MCBEDROCK=D:\XboxGames\Minecraft for Windows\Content"
if exist "E:\XboxGames\Minecraft for Windows\Content\Minecraft.Windows.exe" set "MCBEDROCK=E:\XboxGames\Minecraft for Windows\Content"

if "%MCBEDROCK%"=="" goto ASK_PATH

echo %C_OK%[OK]%C_RESET% Minecraft detectado en:
echo      %MCBEDROCK%
echo.
goto HAVE_PATH

:ASK_PATH
echo %C_WARN%[WARN]%C_RESET% No se encontro Minecraft en C:, D: o E: en la ruta XboxGames.
echo.
echo Si tienes el juego en otra carpeta, pega aqui la ruta donde esta instalado
echo "Minecraft.Windows.exe" (SOLO la carpeta, sin el .exe).
echo Ejemplo: D:\Juegos\Minecraft for Windows\Content
echo.
set "MCBEDROCK="
set /p MCBEDROCK=Ruta de la carpeta del juego: 

if "%MCBEDROCK%"=="" (
    echo.
    echo %C_ERR%[ERROR]%C_RESET% No escribiste ninguna ruta. Intentalo otra vez.
    echo.
    goto ASK_PATH
)

if not exist "%MCBEDROCK%\Minecraft.Windows.exe" (
    echo.
    echo %C_ERR%[ERROR]%C_RESET% No se encontro "Minecraft.Windows.exe" en:
    echo        %MCBEDROCK%
    echo.
    echo Asegurate de pegar la carpeta correcta.
    echo.
    goto ASK_PATH
)

:HAVE_PATH
echo %C_INFO%[INFO]%C_RESET% Carpeta del juego:
echo        %MCBEDROCK%
echo.

if not exist "%MCBEDROCK%\Minecraft.Windows.exe" goto NOEXE

echo %C_OK%[OK]%C_RESET% Minecraft.Windows.exe encontrado.
echo.

rem =================================================
rem 2) MENU PRINCIPAL
rem =================================================
:MENU
echo.
echo %C_ORANGE%============================================%C_RESET%
echo %C_ORANGE%  MENU PRINCIPAL - ALECSTRY BRD TOOL%C_RESET%
echo %C_ORANGE%============================================%C_RESET%
echo %C_INFO%[INFO]%C_RESET% Ruta actual del juego:
echo        %MCBEDROCK%
echo.
echo   1) Instalacion base (winhttp + cmods)
echo   2) Actualizar BRD (releases + cmods)
echo   3) Desinstalar (eliminar winhttp y BRD)
echo   %C_YT%4) Abrir canal de YouTube (Alecstry)%C_RESET%
echo   5) Salir
echo.
set "CHOICE="
set /p CHOICE=Elige una opcion [1-5]: 

if "%CHOICE%"=="1" goto INSTALL
if "%CHOICE%"=="2" goto UPDATE
if "%CHOICE%"=="3" goto UNINSTALL
if "%CHOICE%"=="4" goto OPEN_YT
if "%CHOICE%"=="5" goto END

echo.
echo %C_ERR%[ERROR]%C_RESET% Opcion no valida. Intenta de nuevo.
goto MENU

rem =================================================
rem 3) OPCION 1 - INSTALACION BASE
rem =================================================
:INSTALL
echo.
echo %C_INFO%[INFO]%C_RESET% Iniciando INSTALACION BASE...
echo.

echo %C_INFO%[INFO]%C_RESET% Probando permisos de escritura...
echo test > "%MCBEDROCK%\BRDtest.txt" 2>nul
if not exist "%MCBEDROCK%\BRDtest.txt" goto NOPERM
del "%MCBEDROCK%\BRDtest.txt" >nul 2>&1
echo %C_OK%[OK]%C_RESET% Permisos de escritura verificados.
echo.

echo %C_INFO%[INFO]%C_RESET% Descargando winhttp.dll (ModLoader by QYCottage)...
set "TEMP_WINHTTP=%TEMP%\winhttp_modloader.dll"
powershell -Command "Invoke-WebRequest -Uri https://github.com/QYCottage/ModLoader/releases/latest/download/WINHTTP.dll -OutFile '%TEMP_WINHTTP%'" 
if not exist "%TEMP_WINHTTP%" goto NODOWN
echo %C_OK%[OK]%C_RESET% Descarga completada.
echo.

echo %C_INFO%[INFO]%C_RESET% Instalando winhttp.dll en la carpeta del juego...
copy /Y "%TEMP_WINHTTP%" "%MCBEDROCK%\winhttp.dll" >nul
if not exist "%MCBEDROCK%\winhttp.dll" (
    echo %C_ERR%[ERROR]%C_RESET% No se pudo copiar winhttp.dll al directorio del juego.
    pause
    goto MENU
)
echo %C_OK%[OK]%C_RESET% winhttp.dll instalado correctamente.
echo.

if not exist "%MCBEDROCK%\mods" mkdir "%MCBEDROCK%\mods"
echo %C_OK%[OK]%C_RESET% Carpeta mods lista:
echo        %MCBEDROCK%\mods
echo.

echo %C_OK%============================================%C_RESET%
echo %C_OK%INSTALACION BASE COMPLETADA%C_RESET%
echo %C_OK%============================================%C_RESET%
echo.
echo Si quieres ver el tutorial visual:
echo   %C_YT%https://www.youtube.com/@alecstry%C_RESET%
echo O usa la opcion %C_YT%4) Abrir canal de YouTube%C_RESET% en el menu.
echo.
start "" "microsoft-edge:https://github.com/QYCottage/BetterRenderDragon/releases"
start "" "%MCBEDROCK%\mods"
echo.
pause
goto MENU

rem =================================================
rem 4) OPCION 2 - ACTUALIZAR BRD
rem =================================================
:UPDATE
echo.
echo %C_INFO%[INFO]%C_RESET% Modo ACTUALIZAR BRD.
echo.

if not exist "%MCBEDROCK%\mods" mkdir "%MCBEDROCK%\mods"

start "" "microsoft-edge:https://github.com/QYCottage/BetterRenderDragon/releases"
start "" "%MCBEDROCK%\mods"

echo.
echo Descarga la DLL compatible y colócala en la carpeta 'mods'.
echo.
pause
goto MENU

rem =================================================
rem 5) OPCION 3 - DESINSTALAR
rem =================================================
:UNINSTALL
echo.
echo %C_INFO%[INFO]%C_RESET% Iniciando DESINSTALACION de BRD...
echo.

echo test > "%MCBEDROCK%\BRDtest.txt" 2>nul
if not exist "%MCBEDROCK%\BRDtest.txt" goto NOPERM
del "%MCBEDROCK%\BRDtest.txt" >nul 2>&1

if exist "%MCBEDROCK%\winhttp.dll" del /F /Q "%MCBEDROCK%\winhttp.dll"
if exist "%MCBEDROCK%\mods\BetterRenderDragon.dll" del /F /Q "%MCBEDROCK%\mods\BetterRenderDragon.dll"
if exist "%MCBEDROCK%\mods\BetterRenderDragon-no-imgui.dll" del /F /Q "%MCBEDROCK%\mods\BetterRenderDragon-no-imgui.dll"

echo %C_OK%[OK]%C_RESET% Desinstalacion completada.
echo.
pause
goto MENU

rem =================================================
rem 6) OPCION 4 - ABRIR YOUTUBE
rem =================================================
:OPEN_YT
echo.
echo %C_INFO%[INFO]%C_RESET% Abriendo canal de YouTube de %C_YT%Alecstry%C_RESET%...
start "" "https://www.youtube.com/@alecstry"
echo.
pause
goto MENU

:NOEXE
echo %C_ERR%[ERROR]%C_RESET% No se encontro Minecraft.Windows.exe
pause
goto END

:NOPERM
echo %C_ERR%[ERROR]%C_RESET% No se puede escribir en la carpeta del juego.
echo Ejecuta este .bat como ADMINISTRADOR.
pause
goto MENU

:NODOWN
echo %C_ERR%[ERROR]%C_RESET% No se pudo descargar winhttp.dll
pause
goto MENU

:END
endlocal
exit /b
