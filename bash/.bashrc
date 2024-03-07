# git_ps1
if [ -f "$HOMEBREW_PREFIX/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="$HOMEBREW_PREFIX/opt/bash-git-prompt/share"
  source "$HOMEBREW_PREFIX/etc/bash_completion"
fi

# GIT_PS1 config
# export GIT_PS1_SHOWDIRTYSTATE=1
# export GIT_PS1_SHOWSTASHSTATE=1
# export GIT_PS1_SHOWUNTRACKEDFILES=1
# export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_DESCRIBE_STYLE="branch"

# Custom function to count added, modified, and untracked files
count_git_changes() {
    local added=$(git status -s | grep '^A' | wc -l | tr -d '[:space:]')
    local modified=$(git status -s | grep '^ M' | wc -l | tr -d '[:space:]')
    local untracked=$(git status -s | grep '^??' | wc -l| tr -d '[:space:]')
    local changes=""
    [[ $added -gt 0 ]] && changes+="\[\e[33m\]+$added "
    [[ $modified -gt 0 ]] && changes+="\[\e[33m\]!$modified "
    [[ $untracked -gt 0 ]] && changes+="\[\e[36m\]?$untracked"
    echo "$changes"
}

get_current_directory() {
  # if $PWD == /
  if [[ "$PWD" == "/" ]]; then
      echo "/"
      return
  fi
  # if $HOME in $PWD, replace $HOME with ~
  local current_dir="$PWD"
    if [[ "$current_dir" == "$HOME"* ]]; then
        current_dir="~${current_dir#$HOME}"
    fi
    echo "$current_dir"
}

# make the color of > green and red base on previous exit code
get_new_line() {
  if [ $? -eq 0 ]; then
      echo -e "\n\[\e[32m\]>\[\e[0m\] "
    else
        echo -e "\n\[\e[31m\]>\[\e[0m\] "
    fi
}

# Configure PS1 with Git information
# export PS1="\[\e[36m\]$(dirname "$PWD" | sed 's!'"$HOME"'!~!' )/\[\e[1m\]$(get_last_component)\[\e[0m\]\[\e[32m\]$(__git_ps1 " %s" | sed "s/[*%]//g")\[\e[0m\]$(count_git_changes)$(get_new_line)"

# Function to update PS1 prompt dynamically
update_prompt() {
    PS1="\[\e[36m\]$(get_current_directory)\[\e[0m\]\[\e[32m\]$(__git_ps1 " %s" | sed "s/[*%]//g")\[\e[0m\]$(count_git_changes)$(get_new_line)"
}

# Set PROMPT_COMMAND to update PS1 before displaying the prompt
PROMPT_COMMAND="update_prompt"

# Initial PS1 prompt setup
update_prompt

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/opt/homebrew/bin:$PATH"
export CMAKE_TOOLCHAIN_FILE="$HOME/vcpkg/scripts/buildsystems/vcpkg.cmake"
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include -I/opt/homebrew/Cellar/boost/1.83.0/include"
export DEVICE_KEY="7q4B1tXSwPc0BbMwDXUEdtTa1Qh4uCuhDDv+iRY/PPOv+yagv8TvEVMUP3UT6zzQdSr1fo1a218yahrmWEWhHRdZUdFOtLKh53juxoKybkEBDA4tSWaNpxz3eot+TSNmCppAGHETyHlsF4a47Uj8qZ8j5FwbDx1sGoky903K008="
export PGPASSWORD="spot"

# env
source ~/dconstruct/emsdk/emsdk_env.sh

# aliases

# vim
alias v="nvim"

# directories
alias cs3211="cd; cd OneDrive\ -\ National\ University\ of\ Singapore/NUS/Study/Y3S2/CS3211/code"
alias cs3223="cd; cd OneDrive\ -\ National\ University\ of\ Singapore/NUS/Study/Y3S2/CS3223/code"
alias dash_eye="cd; cd dconstruct/dash_eye"

# git
alias gs='git status'
alias ga='git add'
alias gpl='git pull'
alias gp='git push'
alias gc='git commit -m'
alias gb='git branch'
alias gco='git checkout'
alias glog='git log'

# ls
alias ls='ls -l'
alias la='ls -la'

PATH=~/.console-ninja/.bin:$PATH