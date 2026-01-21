#!/bin/bash
# mdias-oled Theme Suite Installer
# Installs theme for OpenCode, Ghostty, tmux, and eza

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GREEN='\033[0;32m'
CYAN='\033[0;36m'
PINK='\033[0;35m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  mdias-oled Theme Suite Installer${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# OpenCode
echo -e "${PINK}[1/4]${NC} Installing OpenCode theme..."
mkdir -p ~/.config/opencode/themes
cp "$SCRIPT_DIR/opencode/mdias_oled.json" ~/.config/opencode/themes/
echo '  → Add to ~/.config/opencode/opencode.jsonc:'
echo '    "theme": "mdias_oled"'
echo ""

# Ghostty
echo -e "${PINK}[2/4]${NC} Installing Ghostty theme..."
mkdir -p ~/.config/ghostty/themes
cp "$SCRIPT_DIR/ghostty/mdias-oled" ~/.config/ghostty/themes/
echo '  → Add to ~/.config/ghostty/config:'
echo '    theme = mdias-oled'
echo ""

# tmux
echo -e "${PINK}[3/4]${NC} Installing tmux theme..."
mkdir -p ~/.config
cp "$SCRIPT_DIR/tmux/mdias-oled.conf" ~/.config/tmux-mdias-oled.conf
echo '  → Add to ~/.tmux.conf:'
echo '    source-file ~/.config/tmux-mdias-oled.conf'
echo ""

# eza
echo -e "${PINK}[4/4]${NC} Setting up eza (colored ls)..."
if command -v eza &>/dev/null; then
  echo -e "  ${GREEN}✓${NC} eza is already installed"
else
  echo -e "  ${YELLOW}eza not found${NC}"
  if command -v brew &>/dev/null; then
    read -p "  Install eza via Homebrew? [Y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
      echo "  Installing eza..."
      brew install eza
      echo -e "  ${GREEN}✓${NC} eza installed"
    fi
  elif command -v apt &>/dev/null; then
    read -p "  Install eza via apt? [Y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
      echo "  Installing eza..."
      sudo apt install -y eza
      echo -e "  ${GREEN}✓${NC} eza installed"
    fi
  elif command -v pacman &>/dev/null; then
    read -p "  Install eza via pacman? [Y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]] || [[ -z $REPLY ]]; then
      echo "  Installing eza..."
      sudo pacman -S eza
      echo -e "  ${GREEN}✓${NC} eza installed"
    fi
  else
    echo "  Please install eza manually: https://github.com/eza-community/eza"
  fi
fi

# Install eza theme
mkdir -p ~/.config/eza
cp "$SCRIPT_DIR/eza/theme.yml" ~/.config/eza/theme.yml
echo '  → eza theme installed to ~/.config/eza/theme.yml'
echo ""

# zsh aliases
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  Installation complete!${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "To enable eza aliases, add this to your ~/.zshrc or ~/.bashrc:"
echo ""
echo -e "  ${CYAN}# mdias-oled eza aliases${NC}"
echo '  alias ls="eza --color=always --icons=auto"'
echo '  alias ll="eza -l --color=always --icons=auto"'
echo '  alias la="eza -la --color=always --icons=auto"'
echo '  alias lt="eza -T --color=always --icons=auto"'
echo ""
echo "Or source the full zsh snippet:"
echo "  echo 'source $SCRIPT_DIR/zsh/mdias-oled.zsh' >> ~/.zshrc"
echo ""
echo "Restart your terminal to see the changes!"
