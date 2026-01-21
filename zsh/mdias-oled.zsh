# mdias-oled zsh theme snippet
# Add this to your .zshrc for matching prompt colors

# EZA (modern ls with colors) - install with: brew install eza
if command -v eza &>/dev/null; then
  alias ls="eza --color=always --icons=auto"
  alias ll="eza -l --color=always --icons=auto"
  alias la="eza -la --color=always --icons=auto"
  alias lt="eza -T --color=always --icons=auto"
fi

# Prompt colors matching mdias-oled theme
# Marine green arrow, cyan directory
export PROMPT='%(?:%{$fg_bold[cyan]%}➜ :%{$fg_bold[red]%}➜ )%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# Git prompt with marine green/pink accents
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}git:(%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
