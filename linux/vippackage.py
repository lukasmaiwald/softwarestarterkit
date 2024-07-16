import os

def install_packages(distro, packages):
    if distro in ["ubuntu", "debian", "mint"]:
        os.system(f"sudo apt update && sudo apt install -y {' '.join(packages)}")
    elif distro == "fedora":
        os.system(f"sudo dnf install -y {' '.join(packages)}")
    elif distro == "arch":
        os.system(f"sudo pacman -Sy {' '.join(packages)}")
    elif distro == "opensuse":
        os.system(f"sudo zypper install -y {' '.join(packages)}")
    else:
        print(f"Unsupported distribution: {distro}")

def main():
    distros = ["ubuntu", "debian", "mint", "fedora", "arch", "opensuse"]
    packages = ["package1", "package2", "package3"]  # Ersetze diese durch die gewünschten Pakete

    print("Wähle deine Linux-Distribution aus:")
    for i, distro in enumerate(distros, 1):
        print(f"{i}. {distro}")

    choice = int(input("Gib die Nummer der Distribution ein: ")) - 1

    if 0 <= choice < len(distros):
        selected_distro = distros[choice]
        print(f"Installing packages for {selected_distro}...")
        install_packages(selected_distro, packages)
        print("Installation abgeschlossen!")
    else:
        print("Ungültige Auswahl.")

if __name__ == "__main__":
    main()
