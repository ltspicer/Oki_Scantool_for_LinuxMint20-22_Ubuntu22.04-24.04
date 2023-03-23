# Oki-Scantool-on-Linux-Mint-20.x-21.1-Ubuntu-22.04-22.10
Howto use Oki Scantool (Python2)

Hier die Lösung! Mein System ist Linux Mint 21.1 mate (Ubuntu 22.04) 64bit.

Zuerst überprüfen, ob in /usr/share/sane/xsane das Verzeichnis doc ein echtes Verzeichnis ist oder nur ein Symlink.
Falls das ein Symlink ist, diesen umbenennen in doc.alt . Anschliessend hier ein Verzeichnis namens doc erstellen.
Wenn kein doc Verzeichnis bzw Symlink existiert, kannst Du bei "Jetzt geht's ans python2 installieren" weiterfahren.
Das braucht root Rechte! Dazu den Dateimanager (siehe unten) mit sudo ... öffnen (zbsp: sudo caja).
Hier die jeweiligen Dateimanager:

    Ubuntu/LM Cinnamon: nautilus
    Kubuntu: dolphin
    Xubuntu: thunar
    Lubuntu: pcman
    Ubuntu/LM Mate: caja
    Ubuntu Budgie: nemo

Jetzt geht's ans python2 installieren (Quelle: https://linux.how2shout.com/how-to-install-python-2-on-ubuntu-22-04-lts-jammy-linux/ ).
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

Here is the solution! My system is Linux Mint 21.1 mate (Ubuntu 22.04) 64bit.

First check if in /usr/share/sane/xsane the directory doc is a real directory or just a symlink.
If it is a symlink, rename it to doc.old . Then create a directory named doc here.
If there is no doc directory or symlink, you can continue at "Now it's time to install python2".
This needs root rights! Open the file manager (see below) with sudo ... (e.g.: sudo caja).
Here are the file managers:

    Ubuntu/LM Cinnamon: nautilus
    Kubuntu: dolphin
    Xubuntu: thunar
    Lubuntu: pcman
    Ubuntu/LM Mate: caja
    Ubuntu Budgie: nemo

Now it's time to install python2 (Source: https://linux.how2shout.com/how-to-install-python-2-on-ubuntu-22-04-lts-jammy-linux/ ).
sudo apt update
sudo apt install -y python2 libffi7 libgdk-pixbuf2.0-0

Now create a directory e.g. oki_driver, enter it and open the terminal there.
Download the attached deb packages and save them in this directory as well.
Now install:
sudo dpkg -i python-cairo_1.16.2-2ubuntu2_amd64.deb python-gobject-2_2.28.6-14ubuntu1_amd64.deb pygtk2.deb okimfpdriver.deb

enter okiscantool. Now our Oki scan tool should open.
Now reboot the system!
Now add a network scanner as usual with sudo okiscanadm.

Translated with www.DeepL.com/Translator (free version)
