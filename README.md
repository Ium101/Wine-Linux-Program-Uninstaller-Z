# Wine Linux Z Suite 🍷🐧

**Companion Tools for Wine on Linux • Made by Ium101**

🌍 **Choose your language / Escolha seu idioma:**
* [🇺🇸 Read in English](#-english-version)
* [🇧🇷 Ler em Português (PT-BR)](#-versão-em-português-pt-br)

---

## 🇺🇸 English Version

## 📝 Summary
The **Wine Linux Z Suite** is a pair of lightweight, intuitive Graphical User Interface (GUI) tools designed to fix the most common annoyances of running Windows `.exe` applications on Linux via Wine. 

Built natively with Python and Tkinter, this suite allows you to easily create perfect, crash-free shortcuts for your Windows games/apps, and completely force-uninstall them when you are done, leaving no trace behind.

### The Suite Includes:
1. **Wine Linux Shortcut Maker Z** 🚀
2. **Wine Linux Uninstaller Z** 🗑️

## 💡 The Problem vs. The Solution

**The Problem:** Running Windows apps on Linux usually requires manually tweaking `.desktop` files. If you do it wrong, the app loses its "Working Directory" and breaks. Furthermore, modern Node.js/Electron apps (like Discord or Streamlabs) often crash on Wine with an **`EBADF` (Bad File Descriptor) error** because they try to write logs to a non-existent Windows terminal. Finally, when you uninstall a Wine app, it often leaves "ghost" icons in your Start Menu and orphan folders on your hard drive.

**The Solution:** This suite automates everything. The **Shortcut Maker** automatically sets working directories, extracts native `.ico` files, and routes execution through a secure shell that dumps background logs (fixing EBADF crashes). The **Uninstaller** uses advanced Regex to read any broken shortcut (or `.exe` file), finds the root Windows folder, deletes it safely, and scrubs your Desktop and Start Menu clean of leftover icons.

## ✨ Key Features

### 🚀 Wine Linux Shortcut Maker Z
* 🛡️ **Anti-Crash Engine (EBADF Fix):** Safely redirects background logs (`/dev/null 2>&1`), preventing JavaScript/Node.js apps from crashing.
* 🖼️ **Auto-Icon Extraction:** Automatically extracts the original `.ico` from the Windows `.exe` file using `wrestool`.
* 🧠 **Smart Path Memory:** Remembers the last HDD/SSD folder you opened (defaults to `/mnt`).

### 🗑️ Wine Linux Uninstaller Z
* 🔍 **Smart Path Detection:** Can read native Linux `.desktop` files (even if the OS hides the extension) or direct `.exe` files to find the root installation folder.
* 🧹 **Deep Clean:** Deletes the application folder, removes the Desktop shortcut, and scrubs the Linux Start Menu of any matching ghost icons.
* 🔒 **Safety Locks:** Built-in safeguards prevent the accidental deletion of critical system directories (like `/`, `/home`, or `/mnt`).

### 🌍 Universal Features (Both Apps)
* 🌗 **Modern Dark Mode:** A sleek, eye-friendly dark UI.
* 🌐 **Bilingual Support:** Instantly toggle between English and Brazilian Portuguese (PT-BR) with a single click.
* 📦 **One-Click Installers:** Smart `build.sh` scripts that compile the tools locally and place them neatly in your Start Menu under the "Wine" category.

## 🛠️ Prerequisites

To ensure all features work perfectly (especially the automatic icon extraction), make sure you have the following packages installed on your system:

**For BigLinux / Arch Linux / Manjaro:**
```bash
sudo pacman -S python python-tkinter icoutils