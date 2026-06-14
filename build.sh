#!/bin/bash

# Novo nome do executável (agora com espaços, exatamente como você pediu)
EXEC_NAME="Wine Linux Program Uninstaller Z"
BIN_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"
DESKTOP_DIR=$(xdg-user-dir DESKTOP 2>/dev/null || echo "$HOME/Desktop")

echo "⚙️ Iniciando a construção do Wine Linux Program Uninstaller Z..."

# 1. Busca adaptada para o SEU nome de arquivo exato (sem precisar renomear)
if [ -f "wine-linux-uninstaller-z.py" ]; then
    SCRIPT_NAME="wine-linux-uninstaller-z.py"
elif [ -f "Wine_Linux_Uninstaller_Z.py" ]; then
    SCRIPT_NAME="Wine_Linux_Uninstaller_Z.py"
else
    echo "❌ Erro: O arquivo do script Python não foi encontrado."
    exit 1
fi

mkdir -p "$BIN_DIR"
mkdir -p "$APP_DIR"

# 2. Gera o executável localmente (com os espaços no nome)
echo "📦 Gerando o executável na pasta atual..."
echo '#!/usr/bin/env python3' > "./$EXEC_NAME"
cat "$SCRIPT_NAME" >> "./$EXEC_NAME"
chmod +x "./$EXEC_NAME"

# 3. Copia para o sistema (usando aspas duplas para proteger os espaços no nome)
echo "🚀 Instalando uma cópia no sistema..."
cp "./$EXEC_NAME" "$BIN_DIR/$EXEC_NAME"

# 4. Conteúdo do atalho (O Exec= usa aspas escapadas para lidar com os espaços no caminho)
DESKTOP_ENTRY_CONTENT="[Desktop Entry]
Name=Wine Linux Program Uninstaller Z
Comment=Force-remove Wine programs completely via their shortcuts
Exec=\"$BIN_DIR/$EXEC_NAME\"
Icon=edit-delete
Terminal=false
Type=Application
Categories=Wine;Utility;System;
"

# 5. Adiciona ao Menu Iniciar
# Nota: O nome do arquivo .desktop não deve ter espaços para evitar bugs no KDE, mas o nome de exibição no menu terá!
DESKTOP_FILE_NAME="wine-linux-uninstaller-z.desktop"

echo "🖥️ Adicionando ao Menu do Sistema..."
echo "$DESKTOP_ENTRY_CONTENT" > "$APP_DIR/$DESKTOP_FILE_NAME"
chmod +x "$APP_DIR/$DESKTOP_FILE_NAME"

if command -v update-desktop-database &> /dev/null; then
    update-desktop-database "$APP_DIR" &> /dev/null
fi

echo "✅ Processo concluído! O executável foi gerado e instalado."