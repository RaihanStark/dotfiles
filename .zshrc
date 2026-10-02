# ─── history ───────────────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS
setopt SHARE_HISTORY INC_APPEND_HISTORY EXTENDED_HISTORY

# ─── navigation / behaviour ────────────────────────────────
setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT
setopt INTERACTIVE_COMMENTS GLOB_DOTS NO_BEEP
setopt CORRECT

# ─── completion ────────────────────────────────────────────
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*:descriptions' format '%F{#7f849c}%d%f'
zstyle ':completion:*:warnings'     format '%F{#f38ba8}no matches%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcompcache

# ─── palette (matches waybar / wofi / kitty) ───────────────
# accent #89b4fa · muted #7f849c · red #f38ba8 · green #a6e3a1
export LS_COLORS="di=1;38;2;137;180;250:ln=38;2;148;226;213:ex=38;2;166;227;161:*.tar=38;2;243;139;168:*.zip=38;2;243;139;168"

# ─── plugins ───────────────────────────────────────────────
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#585b70'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

typeset -gA ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[function]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#a6e3a1,italic'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f38ba8,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#89b4fa,underline'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#7f849c,italic'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#cba6f7'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#cba6f7'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#94e2d5'

# ─── keybindings ───────────────────────────────────────────
bindkey -e
bindkey '^[[A'  history-search-backward
bindkey '^[[B'  history-search-forward
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[3~' delete-char
bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line

# ─── tools ─────────────────────────────────────────────────
export EDITOR=nvim
export BAT_THEME="Catppuccin Mocha"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fzf, themed to the shared palette
export FZF_DEFAULT_OPTS="
  --height 45% --layout=reverse --border=rounded --info=inline
  --color=bg+:#313244,bg:-1,spinner:#94e2d5,hl:#f38ba8
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#89b4fa
  --color=marker:#a6e3a1,fg+:#cdd6f4,prompt:#89b4fa,hl+:#f38ba8
  --color=border:#45475a
  --prompt='  ' --pointer='▌' --marker='✓'"
source <(fzf --zsh)

eval "$(zoxide init zsh)"

# ─── aliases ───────────────────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias ll='eza -l  --icons --group-directories-first --git'
alias la='eza -la --icons --group-directories-first --git'
alias lt='eza --tree --level=2 --icons'
alias cat='bat --style=plain'
alias catn='bat --style=numbers'
alias grep='grep --color=auto'
alias cd='z'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status -sb'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate -20'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ─── prompt ────────────────────────────────────────────────
eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"


# Added by Antigravity CLI installer
export PATH="/home/han/.local/bin:$PATH"

