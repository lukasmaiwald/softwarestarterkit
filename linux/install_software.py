import subprocess

def install_packages(package_list):
    for package in package_list:
        subprocess.run(["sudo", "apt", "install", package])

def main():
    print("Welche Softwarepakete möchtest du installieren?")
    print("1 - VLC, Notepad++, Firefox, 7-Zip, LibreOffice")
    print("2 - Steam, Clementine")
    print("3 - Wireshark, Memtest86, Prime95, HardwareMonitor")
    choice = input("Bitte wähle eine Option (1, 2, 3): ")

    if choice == "1":
        packages = ["vlc", "notepad-plus-plus", "firefox", "p7zip-full", "libreoffice"]
        install_packages(packages)
    elif choice == "2":
        packages = ["steam", "clementine"]
        install_packages(packages)
    elif choice == "3":
        packages = ["wireshark", "memtest86", "prime95", "openhardwaremonitor"]
        install_packages(packages)
    else:
        print("Ungültige Auswahl.")

if __name__ == "__main__":
    main()
