# Wine Linux Z Suite 🍷🐧

**Companion Tools for Wine on Linux • Made by Ium101**

🌍 **Choose your language / Escolha seu idioma:**
* [🇺🇸 Read in English](#-english-version)
* [🇧🇷 Ler em Português (PT-BR)](#-versão-em-português-pt-br)

---

## 🇺🇸 English Version

## 📝 Summary
The **Wine Linux Z Suite** is a pair of lightweight, intuitive Graphical User Interface (GUI) tools designed to fix the most common annoyances of running Windows `.exe` applications on Linux via Wine[cite: 1]. 

Built natively with Python and Tkinter, this suite allows you to easily create perfect, crash-free shortcuts for your Windows games/apps, and completely force-uninstall them when you are done, leaving no trace behind[cite: 1].

### The Suite Includes:
1. **Wine Linux Shortcut Maker Z** 🚀
2. **Wine Linux Uninstaller Z** 🗑️

## 💡 The Problem vs. The Solution

**The Problem:** Running Windows apps on Linux usually requires manually tweaking `.desktop` files[cite: 1]. If you do it wrong, the app loses its "Working Directory" and breaks[cite: 1]. Furthermore, modern Node.js/Electron apps (like Discord or Streamlabs) often crash on Wine with an **`EBADF` (Bad File Descriptor) error** because they try to write logs to a non-existent Windows terminal[cite: 1]. Finally, when you uninstall a Wine app, it often leaves "ghost" icons in your Start Menu and orphan folders on your hard drive[cite: 1].

**The Solution:** This suite automates everything[cite: 1]. The **Shortcut Maker** automatically sets working directories, extracts native `.ico` files, and routes execution through a secure shell that dumps background logs (fixing EBADF crashes)[cite: 1]. The **Uninstaller** uses advanced Regex to read any broken shortcut (or `.exe` file), finds the root Windows folder, deletes it safely, and scrubs your Desktop and Start Menu clean of leftover icons[cite: 1].

## ✨ Key Features

### 🚀 Wine Linux Shortcut Maker Z
* 🛡️ **Anti-Crash Engine (EBADF Fix):** Safely redirects background logs (`/dev/null 2>&1`), preventing JavaScript/Node.js apps from crashing[cite: 1].
* 🖼️ **Auto-Icon Extraction:** Automatically extracts the original `.ico` from the Windows `.exe` file using `wrestool`[cite: 1].
* 🧠 **Smart Path Memory:** Remembers the last HDD/SSD folder you opened (defaults to `/mnt`)[cite: 1].

### 🗑️ Wine Linux Uninstaller Z
* 🔍 **Smart Path Detection:** Can read native Linux `.desktop` files (even if the OS hides the extension) or direct `.exe` files to find the root installation folder[cite: 1].
* 🧹 **Deep Clean:** Deletes the application folder, removes the Desktop shortcut, and scrubs the Linux Start Menu of any matching ghost icons[cite: 1].
* 🔒 **Safety Locks:** Built-in safeguards prevent the accidental deletion of critical system directories (like `/`, `/home`, or `/mnt`)[cite: 1].

### 🌍 Universal Features (Both Apps)
* 🌗 **Modern Dark Mode:** A sleek, eye-friendly dark UI[cite: 1].
* 🌐 **Bilingual Support:** Instantly toggle between English and Brazilian Portuguese (PT-BR) with a single click[cite: 1].
* 📦 **One-Click Installers:** Smart `build.sh` scripts that compile the tools locally and place them neatly in your Start Menu under the "Wine" category[cite: 1].

---

## 🇧🇷 Versão em Português (PT-BR)

## 📝 Resumo
O **Wine Linux Z Suite** é um conjunto de ferramentas com interface gráfica (GUI) leve e intuitiva, projetado para resolver os problemas mais comuns ao executar aplicativos Windows (`.exe`) no Linux via Wine[cite: 1]. 
Construído nativamente com Python e Tkinter, esta suíte permite que você crie facilmente atalhos perfeitos e livres de falhas para seus jogos/aplicativos Windows, além de desinstalá-los completamente quando terminar, sem deixar rastros[cite: 1].

### A Suíte Inclui:
1. **Wine Linux Shortcut Maker Z** 🚀
2. **Wine Linux Uninstaller Z** 🗑️

## 💡 O Problema vs. A Solução

**O Problema:** Executar aplicativos Windows no Linux geralmente requer ajustes manuais em arquivos `.desktop`[cite: 1]. Se você fizer errado, o aplicativo perde seu "Diretório de Trabalho" e quebra[cite: 1]. Além disso, aplicativos modernos em Node.js/Electron (como Discord ou Streamlabs) frequentemente travam no Wine com um erro **`EBADF` (Bad File Descriptor)**, pois tentam escrever logs em um terminal Windows inexistente[cite: 1]. Finalmente, ao desinstalar um aplicativo Wine, ele frequentemente deixa ícones "fantasma" no seu Menu Iniciar e pastas órfãs no seu disco rígido[cite: 1].

**A Solução:** Esta suíte automatiza tudo[cite: 1]. O **Shortcut Maker** define automaticamente diretórios de trabalho, extrai arquivos `.ico` nativos e roteia a execução através de um shell seguro que descarta logs de segundo plano (corrigindo travamentos EBADF)[cite: 1]. O **Uninstaller** usa Regex avançado para ler qualquer atalho quebrado (ou arquivo `.exe`), encontra a pasta raiz do Windows, exclui-a com segurança e limpa sua Área de Trabalho e Menu Iniciar de ícones restantes[cite: 1].

## ✨ Principais Recursos

### 🚀 Wine Linux Shortcut Maker Z
* 🛡️ **Mecanismo Anti-Travamento (Correção EBADF):** Redireciona logs de segundo plano com segurança (`/dev/null 2>&1`), impedindo que aplicativos JavaScript/Node.js travem[cite: 1].
* 🖼️ **Extração Automática de Ícones:** Extrai automaticamente o `.ico` original do arquivo `.exe` do Windows usando `wrestool`[cite: 1].
* 🧠 **Memória de Caminho Inteligente:** Lembra da última pasta de HDD/SSD que você abriu (padrão em `/mnt`)[cite: 1].

### 🗑️ Wine Linux Uninstaller Z
* 🔍 **Detecção Inteligente de Caminho:** Pode ler arquivos `.desktop` nativos do Linux (mesmo que o SO oculte a extensão) ou arquivos `.exe` diretos para encontrar a pasta raiz da instalação[cite: 1].
* 🧹 **Limpeza Profunda:** Exclui a pasta do aplicativo, remove o atalho da Área de Trabalho e limpa o Menu Iniciar do Linux de quaisquer ícones fantasma correspondentes[cite: 1].
* 🔒 **Travas de Segurança:** Salvaguardas integradas impedem a exclusão acidental de diretórios críticos do sistema (como `/`, `/home` ou `/mnt`)[cite: 1].

### 🌍 Recursos Universais (Ambos os Aplicativos)
* 🌗 **Modo Escuro Moderno:** Uma interface escura elegante e agradável aos olhos[cite: 1].
* 🌐 **Suporte Bilíngue:** Alterne instantaneamente entre inglês e português brasileiro (PT-BR) com um único clique[cite: 1].
* 📦 **Instaladores de Um Clique:** Scripts `build.sh` inteligentes que compilam as ferramentas localmente e as colocam de forma organizada no seu Menu Iniciar sob a categoria "Wine"[cite: 1].

---

## 🛠️ Prerequisites

To ensure all features work perfectly (especially the automatic icon extraction), make sure you have the following packages installed on your system[cite: 1]:

**For BigLinux / Arch Linux / Manjaro:**
```bash
sudo pacman -S python python-tkinter icoutils