#!/bin/bash

EXEC_NAME="wine-linux-shortcut-maker-z"
LOCAL_OUTPUT_NAME="Wine Linux Shortcut Maker Z"
BIN_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons"
DESKTOP_DIR=$(xdg-user-dir DESKTOP 2>/dev/null || echo "$HOME/Desktop")
DESKTOP_FILE_NAME="wine-linux-shortcut-maker-z.desktop"

echo "⚙️ Iniciando a construção..."

if [ -f "Wine_Linux_Shortcut_Maker_Z.py" ]; then
    SCRIPT_NAME="Wine_Linux_Shortcut_Maker_Z.py"
elif [ -f "wine_linux_shortcut_maker_z.py" ]; then
    SCRIPT_NAME="wine_linux_shortcut_maker_z.py"
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
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 110 148" width="256" height="256">
  <!-- back rectangle -->
  <rect x="24" y="24" width="82" height="116" rx="10" fill="none" stroke="#E53935" stroke-width="8"/>
  <!-- front rectangle -->
  <rect x="4" y="4" width="82" height="116" rx="10" fill="none" stroke="#E53935" stroke-width="8"/>
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
Name=Wine Linux Shortcut Maker Z
Comment=Gera atalhos configurados
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

echo "✅ Concluído!"
