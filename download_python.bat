@echo off
setlocal

:: Setze den Installationspfad für Python
set "install_dir=%USERPROFILE%\Downloads\Python"

:: URL für die neueste Python-Version (Windows 64-bit)
set "python_url=https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe"

:: Name der heruntergeladenen Datei
set "filename=python-3.10.4-amd64.exe"

:: Verzeichnis für den Download erstellen
if not exist "%install_dir%" mkdir "%install_dir%"

:: Python herunterladen
echo Herunterladen von Python...
powershell -Command "Invoke-WebRequest -Uri '%python_url%' -OutFile '%install_dir%\%filename%'"

:: Überprüfen, ob der Download erfolgreich war
if exist "%install_dir%\%filename%" (
    echo Python erfolgreich heruntergeladen.
) else (
    echo Fehler beim Herunterladen von Python.
)

pause
