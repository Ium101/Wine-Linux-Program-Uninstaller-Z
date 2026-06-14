# Wine Linux Uninstaller Z 🗑️🐧

**The Ultimate Cleaning Tool for Wine on Linux • Made by Ium101**

🌍 **Choose your language / Escolha seu idioma:**
* [🇺🇸 Read in English](#-english-version)
* [🇧🇷 Ler em Português (PT-BR)](#-versão-em-português-pt-br)

---

## 🇺🇸 English Version

## 📝 Summary
The **Wine Linux Uninstaller Z** is a lightweight, intuitive Graphical User Interface (GUI) tool designed to solve the common issue of residual files left behind by Windows applications on Linux via Wine[cite: 1].

Built natively with Python and Tkinter, this tool allows you to completely force-uninstall Windows apps when you are done, ensuring no trace is left behind on your system[cite: 1].

## 💡 The Problem vs. The Solution

**The Problem:** When you uninstall a Windows app on Linux, it often leaves "ghost" icons in your Start Menu and orphan folders on your hard drive, cluttering your system[cite: 1].

**The Solution:** The **Uninstaller** automates the cleanup process. It uses advanced Regex to read any broken shortcut (or `.exe` file), finds the root Windows folder, deletes it safely, and scrubs your Desktop and Start Menu clean of leftover icons[cite: 1].

## ✨ Key Features

* 🔍 **Smart Path Detection:** Can read native Linux `.desktop` files (even if the OS hides the extension) or direct `.exe` files to find the root installation folder[cite: 1].
* 🧹 **Deep Clean:** Deletes the application folder, removes the Desktop shortcut, and scrubs the Linux Start Menu of any matching ghost icons[cite: 1].
* 🔒 **Safety Locks:** Built-in safeguards prevent the accidental deletion of critical system directories (like `/`, `/home`, or `/mnt`)[cite: 1].
* 🌗 **Modern Dark Mode:** A sleek, eye-friendly dark UI[cite: 1].
* 📦 **One-Click Installer:** Smart `build.sh` script that compiles the tool locally and places it neatly in your Start Menu under the "Wine" category[cite: 1].

---

## 🇧🇷 Versão em Português (PT-BR)

## 📝 Resumo
O **Wine Linux Uninstaller Z** é uma ferramenta de interface gráfica (GUI) leve e intuitiva, projetada para resolver o problema comum de arquivos residuais deixados por aplicativos Windows no Linux via Wine[cite: 1].

Construído nativamente com Python e Tkinter, esta ferramenta permite que você desinstale completamente aplicativos Windows quando terminar, garantindo que nenhum rastro seja deixado no seu sistema[cite: 1].

## 💡 O Problema vs. A Solução

**O Problema:** Ao desinstalar um aplicativo Windows no Linux, ele frequentemente deixa ícones "fantasma" no seu Menu Iniciar e pastas órfãs no seu disco rígido, poluindo o sistema[cite: 1].

**A Solução:** O **Uninstaller** automatiza o processo de limpeza. Ele usa Regex avançado para ler qualquer atalho quebrado (ou arquivo `.exe`), encontra a pasta raiz do Windows, exclui-a com segurança e limpa sua Área de Trabalho e Menu Iniciar de quaisquer ícones restantes[cite: 1].

## ✨ Principais Recursos

* 🔍 **Detecção Inteligente de Caminho:** Pode ler arquivos `.desktop` nativos do Linux (mesmo que o SO oculte a extensão) ou arquivos `.exe` diretos para encontrar a pasta raiz da instalação[cite: 1].
* 🧹 **Limpeza Profunda:** Exclui a pasta do aplicativo, remove o atalho da Área de Trabalho e limpa o Menu Iniciar do Linux de quaisquer ícones fantasma correspondentes[cite: 1].
* 🔒 **Travas de Segurança:** Salvaguardas integradas impedem a exclusão acidental de diretórios críticos do sistema (como `/`, `/home` ou `/mnt`)[cite: 1].
* 🌗 **Modo Escuro Moderno:** Uma interface escura elegante e agradável aos olhos[cite: 1].
* 📦 **Instalador de Um Clique:** Script `build.sh` inteligente que compila a ferramenta localmente e a coloca de forma organizada no seu Menu Iniciar sob a categoria "Wine"[cite: 1].

---

## 🛠️ Prerequisites

To ensure all features work perfectly, make sure you have the following packages installed on your system[cite: 1]:

**For BigLinux / Arch Linux / Manjaro:**
```bash
sudo pacman -S python python-tkinter icoutils