@echo off
setlocal

:: Verzeichnis für Downloads erstellen
set "download_dir=%USERPROFILE%\Downloads\Software"
if not exist "%download_dir%" (
    mkdir "%download_dir%"
)

:: Funktion zum Herunterladen von Dateien
set download_file=powershell -Command "Invoke-WebRequest -Uri '%1' -OutFile '%2'"

:: VLC Media Player herunterladen und installieren
echo Herunterladen und Installieren von VLC Media Player...
%download_file% "https://get.videolan.org/vlc/last/win64/vlc-3.0.18-win64.exe" "%download_dir%\vlc-3.0.18-win64.exe"
start /wait "" "%download_dir%\vlc-3.0.18-win64.exe" /S

:: Notepad++ herunterladen und installieren
echo Herunterladen und Installieren von Notepad++...
%download_file% "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.8/npp.8.4.8.Installer.x64.exe" "%download_dir%\npp.8.4.8.Installer.x64.exe"
start /wait "" "%download_dir%\npp.8.4.8.Installer.x64.exe" /S

:: Visual Studio Code herunterladen und installieren
echo Herunterladen und Installieren von Visual Studio Code...
%download_file% "https://update.code.visualstudio.com/latest/win32-x64-user/stable" "%download_dir%\VSCodeUserSetup-x64.exe"
start /wait "" "%download_dir%\VSCodeUserSetup-x64.exe" /silent /mergetasks=!runcode

:: Firefox Browser herunterladen und installieren
echo Herunterladen und Installieren von Firefox Browser...
%download_file% "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US" "%download_dir%\FirefoxSetup.exe"
start /wait "" "%download_dir%\FirefoxSetup.exe" -ms

:: LibreOffice herunterladen und installieren
echo Herunterladen und Installieren von LibreOffice...
%download_file% "https://download.documentfoundation.org/libreoffice/stable/7.4.3/win/x86_64/LibreOffice_7.4.3_Win_x64.msi" "%download_dir%\LibreOffice_7.4.3_Win_x64.msi"
start /wait msiexec /i "%download_dir%\LibreOffice_7.4.3_Win_x64.msi" /quiet

:: Mozilla Thunderbird herunterladen und installieren
echo Herunterladen und Installieren von Mozilla Thunderbird...
%download_file% "https://download.mozilla.org/?product=thunderbird-latest&os=win64&lang=en-US" "%download_dir%\ThunderbirdSetup.exe"
start /wait "" "%download_dir%\ThunderbirdSetup.exe" -ms

:: 7-Zip herunterladen und installieren
echo Herunterladen und Installieren von 7-Zip...
%download_file% "https://www.7-zip.org/a/7z2301-x64.exe" "%download_dir%\7z2301-x64.exe"
start /wait "" "%download_dir%\7z2301-x64.exe" /S

:: Bitwarden herunterladen und installieren
echo Herunterladen und Installieren von Bitwarden...
%download_file% "https://vault.bitwarden.com/download/?app=desktop&platform=windows" "%download_dir%\BitwardenInstaller.exe"
start /wait "" "%download_dir%\BitwardenInstaller.exe" /S

:: GParted ist ein ISO-Image und kann nicht direkt installiert werden
echo Hinweis: GParted ist ein ISO-Image und kann nicht direkt installiert werden.
%download_file% "https://downloads.sourceforge.net/gparted/gparted-live-1.5.0-1-amd64.iso" "%download_dir%\gparted-live-1.5.0-1-amd64.iso"

echo Alle Installationen sind abgeschlossen.
pause
endlocal
