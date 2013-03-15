ZSH=$HOME/.oh-my-zsh
# Path to your oh-my-zsh configuration.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails textmate ruby lighthouse)
plugins=(gem osx) # zsh-syntax-highlighting)

# Customize to your need  s...
#export PATH=/Users/Chris/.rvm/gems/ruby-1.9.3-head/bin:/sbin:/usr/local/bin:$PATH

EDITOR=/bin/vim
alias ls='ls -lah'
alias cp='gcp'

# alias rake='noglob rake'

setopt append_history

export PATH=.bin:/usr/local/bin:/usr/local/sbin:$PATH #:$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

source $ZSH/oh-my-zsh.sh
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
