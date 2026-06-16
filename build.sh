#!/bin/bash

EXEC_NAME="wine-linux-program-uninstaller-z"
LOCAL_OUTPUT_NAME="Wine Linux Program Uninstaller Z"
BIN_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons"
DESKTOP_DIR=$(xdg-user-dir DESKTOP 2>/dev/null || echo "$HOME/Desktop")
DESKTOP_FILE_NAME="wine-linux-program-uninstaller-z.desktop"

echo "⚙️ Iniciando a construção do Wine Linux Program Uninstaller Z..."

# FIXED: detect file AND assign the correct name
if [ -f "wine-linux-program-uninstaller-z.py" ]; then
    SCRIPT_NAME="wine-linux-program-uninstaller-z.py"
elif [ -f "Wine_Linux_Program_Uninstaller_Z.py" ]; then
    SCRIPT_NAME="Wine_Linux_Program_Uninstaller_Z.py"
elif [ -f "wine_linux_program_uninstaller_z.py" ]; then
    SCRIPT_NAME="wine_linux_program_uninstaller_z.py"
else
    echo "❌ Erro: O arquivo do script Python não foi encontrado."
    exit 1
fi

mkdir -p "$BIN_DIR"
mkdir -p "$APP_DIR"
mkdir -p "$DESKTOP_DIR"
mkdir -p "$ICON_DIR"

# ── EMBED ICON ────────────────────────────────────────────────────────────────
echo "🖼️ Instalando ícone..."
cat > "$ICON_DIR/$EXEC_NAME.svg" << 'SVGEOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 120" width="256" height="256">
  <rect x="38" y="3" width="24" height="11" rx="5" fill="none" stroke="#E53935" stroke-width="6"/>
  <rect x="8" y="15" width="84" height="13" rx="6" fill="#E53935"/>
  <rect x="16" y="32" width="68" height="80" rx="8" fill="none" stroke="#E53935" stroke-width="6"/>
  <line x1="37" y1="48" x2="37" y2="96" stroke="#E53935" stroke-width="6" stroke-linecap="round"/>
  <line x1="50" y1="48" x2="50" y2="96" stroke="#E53935" stroke-width="6" stroke-linecap="round"/>
  <line x1="63" y1="48" x2="63" y2="96" stroke="#E53935" stroke-width="6" stroke-linecap="round"/>
</svg>
SVGEOF
# ─────────────────────────────────────────────────────────────────────────────

echo "📦 Gerando executável..."
echo '#!/usr/bin/env python3' > "./$LOCAL_OUTPUT_NAME"
cat "$SCRIPT_NAME" >> "./$LOCAL_OUTPUT_NAME"
chmod +x "./$LOCAL_OUTPUT_NAME"
cp "./$LOCAL_OUTPUT_NAME" "$BIN_DIR/$EXEC_NAME"

echo "🖥️ Adicionando ao Menu do Sistema..."
cat > "$APP_DIR/$DESKTOP_FILE_NAME" << DESKTOPEOF
[Desktop Entry]
Name=Wine Linux Program Uninstaller Z
Comment=Force-remove Wine programs completely via their shortcuts
Exec=$BIN_DIR/$EXEC_NAME
Icon=$ICON_DIR/$EXEC_NAME.svg
Terminal=false
Type=Application
Categories=Utility;Wine;System;
DESKTOPEOF
chmod +x "$APP_DIR/$DESKTOP_FILE_NAME"

echo "🏠 Criando atalho na Área de Trabalho..."
cp "$APP_DIR/$DESKTOP_FILE_NAME" "$DESKTOP_DIR/$DESKTOP_FILE_NAME"
chmod 755 "$DESKTOP_DIR/$DESKTOP_FILE_NAME"

if command -v gio &> /dev/null; then
    gio set "$DESKTOP_DIR/$DESKTOP_FILE_NAME" metadata::trusted true 2>/dev/null
fi

if command -v update-desktop-database &> /dev/null; then
    update-desktop-database "$APP_DIR" &> /dev/null
fi

echo "🔄 Atualizando cache do menu do sistema..."
if command -v kbuildsycoca6 &> /dev/null; then
    kbuildsycoca6 &> /dev/null
elif command -v kbuildsycoca5 &> /dev/null; then
    kbuildsycoca5 &> /dev/null
fi

echo "✅ Concluído!"
