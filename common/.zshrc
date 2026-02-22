ff() {
    local IMG_DIR="$HOME/Images/fastfetch_animes"
    # Ajout de l'extension gif dans la recherche
    local RANDOM_IMG=$(find "$IMG_DIR" -type f \( -iname \*.png -o -iname \*.jpg -o -iname \*.gif \) | shuf -n 1)
    
    fastfetch --logo "$RANDOM_IMG" --logo-type kitty --logo-width 35
}

ff

# Initialise zoxide sans alias cd
eval "$(zoxide init zsh)"
eval "$(ssh-agent -s)" > /dev/null
eval "$(starship init zsh)"

alias ipad='uxplay -n Arch -nh -avdec'
alias y='yazi'
alias fl='fscrypt lock'
alias fu='fscrypt unlock'
alias stow='stow --no-folding'

#Remplace zd par cd et affiche pwd
alias cd="zd"
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}

pdf() {
    file=$(find . -name "*.pdf" | fzf)
    [ -n "$file" ] && zathura "$file" & disown
}

# Invite de commande simple
# export PS1="%n@%m:%~$ "

# Historique
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Autocomplétion
zstyle :compinstall filename '/home/noah/.zshrc'
autoload -Uz compinit
compinit

export PATH="$HOME/.local/bin:$PATH"
export PATH="HOME/.cargo/bin:$PATH"
export EDITOR='nvim'

export PATH=$PATH:/home/noah/.spicetify

export QSYS_ROOTDIR="/home/noah/tmp_build/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/25.1/quartus/sopc_builder/bin"
export PATH=$PATH:/opt/intelFPGA/25.1/quartus/bin
export PATH=$PATH:~/tizen-studio/tools/ide/bin:~/tizen-studio/tools

# Charger zsh-autosuggestions
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Alias pour lsd
alias ls="lsd"
alias l="lsd -l"
alias la="lsd -a"
alias lla="lsd -la"
alias lt="lsd --tree"


export LS_COLORS="${LS_COLORS}:ow=01;34"

# Activer zsh-syntax-highlighting (doit être à la fin)
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
