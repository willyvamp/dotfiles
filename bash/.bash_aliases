# Change dirs
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Save copying
alias cp='cp -vi'
alias mv='mv -vi'

# Better copying
alias cpv='rsync -avh --info=progress2'

# More aliases
alias vim="nvim"
alias bashrc="nvim ~/.bashrc"
alias bash_aliases="nvim ~/.bash_aliases"
alias count="ls * | wc -l"
