export ZPLUG_HOME="~/gits/github/zplug"

if [[ ! -f "$ZPLUG_HOME/init.zsh" ]]; then
    git clone --depth=1 https://github.com/zplug/zplug "$ZPLUG_HOME"
fi

source "$ZPLUG_HOME/init.zsh"

# zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "caarlos0/zsh-mkc"

zplug "MichaelAquilina/zsh-you-should-use"
zplug "plugins/command-not-found", from:oh-my-zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"

zplug "skywind3000/z.lua"

zplug "ianthehenry/zsh-autoquoter"

zplug "plugins/golang", from:oh-my-zsh

zplug "mafredri/zsh-async", from:github, defer:0

# defer means to load this plugin after all the other plugins
zplug "zdharma/fast-syntax-highlighting", defer:2

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# zplug "b4b4r07/enhancd", at:v2

# Load theme file
# zplug 'dracula/zsh', as:theme
zplug "themes/robbyrussell", from:oh-my-zsh, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# User configuration
alias ls="ls --color"
alias ll="ls -lth"
alias la="ll -a"
