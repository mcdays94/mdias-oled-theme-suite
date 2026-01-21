#!/bin/bash
# mdias-oled Theme Suite Installer
# Installs theme for OpenCode, Ghostty, and tmux

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GREEN='\033[0;32m'
CYAN='\033[0;36m'
PINK='\033[0;35m'
NC='\033[0m' # No Color

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  mdias-oled Theme Suite Installer${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# OpenCode
echo -e "${PINK}[1/3]${NC} Installing OpenCode theme..."
mkdir -p ~/.config/opencode/themes
cp "$SCRIPT_DIR/opencode/mdias_oled.json" ~/.config/opencode/themes/
echo '  → Add to ~/.config/opencode/opencode.jsonc:'
echo '    "theme": "mdias_oled"'
echo ""

# Ghostty
echo -e "${PINK}[2/3]${NC} Installing Ghostty theme..."
mkdir -p ~/.config/ghostty/themes
cp "$SCRIPT_DIR/ghostty/mdias-oled" ~/.config/ghostty/themes/
echo '  → Add to ~/.config/ghostty/config:'
echo '    theme = mdias-oled'
echo ""

# tmux
echo -e "${PINK}[3/3]${NC} Installing tmux theme..."
cp "$SCRIPT_DIR/tmux/mdias-oled.conf" ~/.config/tmux-mdias-oled.conf 2>/dev/null || cp "$SCRIPT_DIR/tmux/mdias-oled.conf" ~/tmux-mdias-oled.conf
echo '  → Add to ~/.tmux.conf:'
echo '    source-file ~/.config/tmux-mdias-oled.conf'
echo '  Or copy the contents directly into your .tmux.conf'
echo ""

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Installation complete!${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "Optional: Install eza for colored file listings"
echo "  brew install eza"
echo ""
echo "Then source the zsh snippet for ls aliases:"
echo "  source $SCRIPT_DIR/zsh/mdias-oled.zsh"
echo ""
echo "Restart your terminal to see the changes!"
