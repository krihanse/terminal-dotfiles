### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### auto complete
autoload -Uz compinit
compinit

### Plugin manager


### Other settings

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

### Shell integrations

# Devbox
#DEVBOX_NO_PROMPT=true
#eval "$(devbox global shellenv --init-hook)"

# Git
LANG=en_US.UTF-8

# Completions
#source <(devbox completion zsh)
source <(docker completion zsh)
source <(kubectl completion zsh)
source <(flux completion zsh)
source <(helm completion zsh)

# Starship
#eval "$(starship init zsh)"

# use custom clean ohmyposh shell setup
#eval "$(oh-my-posh init zsh --config ~/.config/zen.toml)"
eval "$(oh-my-posh init zsh --config ~/.config/powerlevel10k_lean.omp.json)"
#eval "$(oh-my-posh init zsh)"

# The Fuck
#eval $(thefuck --alias)

# Zoxide
#eval "$(zoxide init --cmd cd zsh)"

# Fzf
eval "$(fzf --zsh)"

### Zsh plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-syntax-highlighting
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
zstyle ':completion:*' menu yes select

# Add in zsh plugins
zinit light zsh-users/zsh-completions
#zinit light Aloxaf/fzf-tab
zinit light MohamedElashri/exa-zsh

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found
zinit snippet OMZP::ssh-agent

#zinit ice depth=1; zinit light romkatv/powerlevel10k

# Load completions
zinit cdreplay -q

# Aliases
alias ls=eza
#alias ls='eza --long --all --no-permissions --no-filesize --no-user --no-time --git'
alias lst='eza --long --all --no-permissions --no-filesize --no-user --git --sort modified'
alias fzfp='fzf --preview \"bat --style numbers --color always {}\"'
alias cat='bat --paging never --theme DarkNeon --style plain'
alias k=kubectl
alias vim=nvim
alias kcc="kubie ctx"
alias ns="kubie ns"

# Set paths 
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export XDG_DATA_DIRS="/home/zytox/.local/share:$XDG_DATA_DIRS"
