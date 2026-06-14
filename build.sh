#!/bin/bash

EXEC_NAME="wine-linux-uninstaller-z"
LOCAL_OUTPUT_NAME="Wine Linux Uninstaller Z"
BIN_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons"
DESKTOP_DIR=$(xdg-user-dir DESKTOP 2>/dev/null || echo "$HOME/Desktop")

echo "⚙️ Iniciando a construção..."

# FIXED: Now correctly detects the hyphenated filename
if [ -f "wine-linux-uninstaller-z.py" ]; then
    SCRIPT_NAME="wine-linux-uninstaller-z.py"
elif [ -f "Wine_Linux_Uninstaller_Z.py" ]; then
    SCRIPT_NAME="Wine_Linux_Uninstaller_Z.py"
elif [ -f "wine_linux_uninstaller_z.py" ]; then
    SCRIPT_NAME="wine_linux_uninstaller_z.py"
else
    echo "❌ Erro: O arquivo do script Python não foi encontrado."
    echo "Certifique-se de que o arquivo se chama 'wine-linux-uninstaller-z.py'."
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
ICON_SETTING="$ICON_DIR/$EXEC_NAME.svg"
# ─────────────────────────────────────────────────────────────────────────────

echo "📦 Gerando executável..."
echo '#!/usr/bin/env python3' > "./$LOCAL_OUTPUT_NAME"
cat "$SCRIPT_NAME" >> "./$LOCAL_OUTPUT_NAME"
chmod +x "./$LOCAL_OUTPUT_NAME"
cp "./$LOCAL_OUTPUT_NAME" "$BIN_DIR/$EXEC_NAME"

echo "🖥️ Adicionando ao Menu do Sistema..."
DESKTOP_ENTRY_CONTENT="[Desktop Entry]
Name=Wine Linux Program Uninstaller Z
Comment=Remove Windows programs from Linux via shortcut or .exe
Exec=$BIN_DIR/$EXEC_NAME
Icon=$ICON_SETTING
Terminal=false
Type=Application
Categories=Utility;Wine;
"

echo "$DESKTOP_ENTRY_CONTENT" > "$APP_DIR/$EXEC_NAME.desktop"
chmod +x "$APP_DIR/$EXEC_NAME.desktop"

echo "🏠 Criando atalho na Área de Trabalho..."
DESKTOP_FILE_PATH="$DESKTOP_DIR/$EXEC_NAME.desktop"
echo "$DESKTOP_ENTRY_CONTENT" > "$DESKTOP_FILE_PATH"
chmod 755 "$DESKTOP_FILE_PATH"

if command -v gio &> /dev/null; then
    gio set "$DESKTOP_FILE_PATH" metadata::trusted true 2>/dev/null
fi

if command -v update-desktop-database &> /dev/null; then
    update-desktop-database "$APP_DIR" &> /dev/null
fi

# FORCES THE BIG LINUX SIDEBAR TO REFRESH IMMEDIATELY
echo "🔄 Atualizando cache do menu do sistema..."
if command -v kbuildsycoca6 &> /dev/null; then
    kbuildsycoca6 &> /dev/null
elif command -v kbuildsycoca5 &> /dev/null; then
    kbuildsycoca5 &> /dev/null
fi

echo "✅ Concluído!"
