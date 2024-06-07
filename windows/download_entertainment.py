import os
import urllib.request

# Verzeichnis für Downloads erstellen, falls es nicht existiert
download_dir = os.path.join(os.path.expanduser('~'), 'Downloads', 'Entertainment')
os.makedirs(download_dir, exist_ok=True)

# Liste der Programme und URLs
programs = [
    ("Steam", "https://cdn.akamai.steamstatic.com/client/installer/SteamSetup.exe"),
    ("MusicBee", "https://www.majorgeeks.com/mg/getmirror/musicbee,1.html"), 
    ("GoG Launcher", "https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe?payload=-8bP6Kdpiu9_OL-a8XzTrcJ3MazhPDmByCvguC_sREzdzkZAb-r5xK-illUo5txGGcXOJAhjrZvcQsD9POhZcHHe_sRKqftwEgzGZXPX1LEJzOCDLA.."), 
    ("")
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
