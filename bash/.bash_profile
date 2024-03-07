# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/quyduc/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/quyduc/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/quyduc/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/quyduc/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Only run on macOS

if [[ "$OSTYPE" == "darwin"* ]]; then
  # needed for brew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export XDG_CONFIG_HOME="$HOME"/.config
export ANDROID_SDK=/Users/quyduc/Library/Android/sdk
export PATH=/Users/quyduc/Library/Android/sdk:$PATH
export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
