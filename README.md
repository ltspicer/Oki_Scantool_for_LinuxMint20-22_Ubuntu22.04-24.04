# Oki Scantool on Ubuntu, Lubuntu, Kubuntu 24.04/25.xx & Linux Mint 22.x


Many thanks to BassHero
https://github.com/BassHero/okimfpsdrv
This script is an extension that also installs the Oki scan tool.


### 1. Open a terminal window (Ctrl + Alt + T) and type the commands bellow


        cd ~/Downloads


### 2. Copy the command bellow


        wget https://raw.github.com/ltspicer/Oki_Scantool_for_LinuxMint20-22_Ubuntu22.04-24.04/main/oki_scantool_02.2026.sh


### 3. Give the script permission to run

        chmod a+x oki_scantool*.sh


### 4. Run the script

        ./oki_scantool_02.2026.sh


-----------------------------------------------------



# Oki Scantool on Linux Mint 20.x/21.1, Ubuntu 22.04/22.10
Anleitung, wie das Oki Scantool (Python2) zum laufen zu bringen

Mein System ist Linux Mint 21.1 mate (Ubuntu 22.04) 64bit.

Zuerst überprüfen, ob in /usr/share/sane/xsane das Verzeichnis doc ein echtes Verzeichnis ist oder nur ein Symlink.
Falls das ein Symlink ist, diesen umbenennen in doc.alt . Anschliessend hier ein Verzeichnis namens doc erstellen.
Wenn kein doc Verzeichnis bzw Symlink existiert, kannst Du bei "**Jetzt geht's ans python2 installieren**" weiterfahren.
Das Erstellen von einem Verzeichnis an dieser Stelle braucht einen Dateimanager mit root Rechten!
Siehe hier: https://wiki.ubuntuusers.de/mit_Root-Rechten_arbeiten/#M8-GUI-Werkzeuge


**Jetzt geht's ans python2 installieren** (Quelle: https://linux.how2shout.com/how-to-install-python-2-on-ubuntu-22-04-lts-jammy-linux/ ).

sudo apt update

sudo apt install -y python2 libffi7 libgdk-pixbuf2.0-0

Erstelle nun ein Verzeichnis zBsp oki_treiber, betrete dieses und öffne das Terminal da.
Lade die angehängten deb Pakete runter und speichere diese ebenfalls in diesem Verzeichnis.

Jetzt installieren:

sudo dpkg -i python-cairo_1.16.2-2ubuntu2_amd64.deb python-gobject-2_2.28.6-14ubuntu1_amd64.deb pygtk2.deb okimfpdriver.deb

okiscantool eingeben. Nun sollte unser Oki Scantool öffnen.

Jetzt System rebooten!

Nun wie gewohnt mit sudo okiscanadm einen Netzwerk Scanner hinzufügen.

---------------------

Howto use Oki Scantool (Python2)

My system is Linux Mint 21.1 mate (Ubuntu 22.04) 64bit.

First check if in /usr/share/sane/xsane the directory doc is a real directory or just a symlink.
If it is a symlink, rename it to doc.old . Then create a directory named doc here.
If there is no doc directory or symlink, you can continue at "**Now it's time to install python2**".
Creating a directory at this point requires a file manager with root rights!
See here: https://wiki.ubuntuusers.de/mit_Root-Rechten_arbeiten/#M8-GUI-Werkzeuge


**Now it's time to install python2** (Source: https://linux.how2shout.com/how-to-install-python-2-on-ubuntu-22-04-lts-jammy-linux/ ).

sudo apt update

sudo apt install -y python2 libffi7 libgdk-pixbuf2.0-0

Now create a directory e.g. oki_driver, enter it and open the terminal there.
Download the attached deb packages and save them in this directory as well.

Now install:

sudo dpkg -i python-cairo_1.16.2-2ubuntu2_amd64.deb python-gobject-2_2.28.6-14ubuntu1_amd64.deb pygtk2.deb okimfpdriver.deb

enter okiscantool. Now our Oki scan tool should open.

Now reboot the system!

Now add a network scanner as usual with sudo okiscanadm.
