# Initialise zoxide sans alias cd
eval "$(zoxide init zsh)"
eval "$(ssh-agent -s)" > /dev/null

alias ipad='uxplay -n Arch -nh -avdec'
alias y='yazi'

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

# Invite de commande simple
export PS1="%n@%m:%~$ "

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
