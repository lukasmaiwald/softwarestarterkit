@echo off
setlocal enabledelayedexpansion

:: Verzeichnis für Downloads erstellen
set "download_dir=%USERPROFILE%\Downloads\Software"
if not exist "%download_dir%" (
    mkdir "%download_dir%"
)

:: Funktion zum Herunterladen von Dateien
set download_file=certutil -urlcache -split -f "%1" "%2"

:: Liste der Programme und URLs
set "urls[0]=VLC Media Player,https://get.videolan.org/vlc/last/win64/vlc-3.0.18-win64.exe"
set "urls[1]=Notepad++,https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.8/npp.8.4.8.Installer.x64.exe"
set "urls[2]=Visual Studio Code,https://update.code.visualstudio.com/latest/win32-x64-user/stable"
set "urls[3]=Firefox Browser,https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"
set "urls[4]=LibreOffice,https://download.documentfoundation.org/libreoffice/stable/7.4.3/win/x86_64/LibreOffice_7.4.3_Win_x64.msi"
set "urls[5]=Mozilla Thunderbird,https://download.mozilla.org/?product=thunderbird-latest&os=win64&lang=en-US"
set "urls[6]=7-Zip,https://www.7-zip.org/a/7z2301-x64.exe"
set "urls[7]=Bitwarden,https://vault.bitwarden.com/download/?app=desktop&platform=windows"
set "urls[8]=GParted,https://downloads.sourceforge.net/gparted/gparted-live-1.5.0-1-amd64.iso"

:: Array zum Speichern der erfolgreichen Downloads
set "success="

:: Dateien herunterladen
for /L %%i in (0, 1, 8) do (
    for /F "tokens=1,2 delims=," %%a in ("!urls[%%i]!") do (
        set "program=%%a"
        set "url=%%b"
        set "filename=%download_dir%\%%~nxb"
        echo Herunterladen von !program!...
        !download_file! "%%b" "%filename%"
        if not errorlevel 1 (
            echo !program! erfolgreich heruntergeladen.
            set "success=!success! !program!"
        ) else (
            echo Fehler beim Herunterladen von !program!.
        )
    )
)

:: Erfolgreich heruntergeladene Programme ausgeben
echo.
echo Folgende Programme wurden erfolgreich heruntergeladen:
for %%p in (!success!) do (
    echo %%p
)

pause
endlocal
