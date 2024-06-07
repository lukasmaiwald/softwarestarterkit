import os
import urllib.request

# Verzeichnis für Downloads erstellen, falls es nicht existiert
download_dir = os.path.join(os.path.expanduser('~'), 'Downloads', 'Entertainment')
os.makedirs(download_dir, exist_ok=True)

# Liste der Programme und URLs
programs = [
    ("Wireshark", "https://2.na.dl.wireshark.org/win64/Wireshark-4.2.5-x64.exe"),
    ("Memtest86", "https://www.memtest86.com/downloads/memtest86-usb.zip"), 
    ("HardwareMonitor", "https://download.cpuid.com/hwmonitor/hwmonitor_1.53.exe"), 
    ("Prime95 CPU Benchmark", "https://www.mersenne.org/download/software/v30/30.19/p95v3019b20.win64.zip")
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
