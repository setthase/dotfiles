# Include Antigen (install with brew first)
source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the oh-my-zsh.
antigen bundle colored-man
antigen bundle docker
antigen bundle gitfast
antigen bundle osx
antigen bundle wd

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Add nvm support.
antigen bundle lukechilds/zsh-nvm

# Load the theme.
antigen theme nicoulaj

# Tell antigen that you're done.
antigen apply

# Export paths.
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.dotfiles/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export XDG_CONFIG_HOME="$HOME/.config"

# Set default editor.
export EDITOR='nvim'

# Hide brew icon after install script.
export HOMEBREW_NO_EMOJI=1

# Fix Gruvbox palette.
source $XDG_CONFIG_HOME/nvim/bundle/gruvbox/gruvbox_256palette_osx.sh

# Use chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh

# Set language environment.
export LANG=en_US.UTF-8

# Upgrade ll to show all files
alias ll='ls -lah'

# Change vim to nvim
alias vi='nvim'
alias vim='nvim'
