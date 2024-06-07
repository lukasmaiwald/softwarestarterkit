import os
import urllib.request

# Verzeichnis für Downloads erstellen, falls es nicht existiert
download_dir = os.path.join(os.path.expanduser('~'), 'Downloads', 'Software')
os.makedirs(download_dir, exist_ok=True)

# Liste der Programme und URLs
programs = [
    ("VLC Media Player", "https://get.videolan.org/vlc/3.0.20/win64/vlc-3.0.20-win64.exe"),
    ("Notepad++", "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.4.8/npp.8.4.8.Installer.x64.exe"),
    ("LibreOffice", "https://de.libreoffice.org/donate/dl/win-x86_64/7.6.7/de/LibreOffice_7.6.7_Win_x86-64.msi"),
    ("7-Zip", "https://www.7-zip.org/a/7z2301-x64.exe")
]


# Funktion zum Herunterladen von Dateien
def download_file(url, destination):
    try:
        urllib.request.urlretrieve(url, destination)
        return True
    except Exception as e:
        print(f"Fehler beim Herunterladen von {url}: {e}")
        return False

# Dateien herunterladen
successful_downloads = []
for program, url in programs:
    print(f"Herunterladen von {program}...")
    filename = os.path.join(download_dir, os.path.basename(url))
    if download_file(url, filename):
        print(f"{program} erfolgreich heruntergeladen.")
        successful_downloads.append(program)
    else:
        print(f"Fehler beim Herunterladen von {program}.")

# Erfolgreich heruntergeladene Programme ausgeben
print("\nFolgende Programme wurden erfolgreich heruntergeladen:")
for program in successful_downloads:
    print(program)
