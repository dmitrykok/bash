# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
esac

# Path to your oh-my-bash installation.
export OSH="$HOME/.oh-my-bash"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="mairan"

# If you set OSH_THEME to "random", you can ignore themes you don't like.
# OMB_THEME_RANDOM_IGNORED=("powerbash10k" "wanelo")

# Uncomment the following line to use case-sensitive completion.
OMB_CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# OMB_HYPHEN_SENSITIVE="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you don't want the repository to be considered dirty
# if there are untracked files.
# SCM_GIT_DISABLE_UNTRACKED_DIRTY="true"

# Uncomment the following line if you want to completely ignore the presence
# of untracked files in the repository.
# SCM_GIT_IGNORE_UNTRACKED="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.  One of the following values can
# be used to specify the timestamp format.
# * 'mm/dd/yyyy'     # mm/dd/yyyy + time
# * 'dd.mm.yyyy'     # dd.mm.yyyy + time
# * 'yyyy-mm-dd'     # yyyy-mm-dd + time
# * '[mm/dd/yyyy]'   # [mm/dd/yyyy] + [time] with colors
# * '[dd.mm.yyyy]'   # [dd.mm.yyyy] + [time] with colors
# * '[yyyy-mm-dd]'   # [yyyy-mm-dd] + [time] with colors
# If not set, the default value is 'yyyy-mm-dd'.
# HIST_STAMPS='yyyy-mm-dd'

# Uncomment the following line if you do not want OMB to overwrite the existing
# aliases by the default OMB aliases defined in lib/*.sh
OMB_DEFAULT_ALIASES="check"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# To disable the uses of "sudo" by oh-my-bash, please set "false" to
# this variable.  The default behavior for the empty value is "true".
OMB_USE_SUDO=true

# To enable/disable display of Python virtualenv and condaenv
OMB_PROMPT_SHOW_PYTHON_VENV=true # enable
# OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

# Which completions would you like to load? (completions can be found in $HOME/.oh-my-bash/completions/*)
# Custom completions may be added to $HOME/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
  crc
  defaults
  dirs
  docker
  gem
  makefile
  nvm
  pip3
  pip
  system
  tmux
)

# Which aliases would you like to load? (aliases can be found in $HOME/.oh-my-bash/aliases/*)
# Custom aliases may be added to $HOME/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
  chmod
  docker
  ls
  misc
)

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-bash/plugins/*)
# Custom plugins may be added to $HOME/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
  bash-preexec
  npm
  nvm
  progress
  pyenv
  sudo
  xterm
)

# Which plugins would you like to conditionally load? (plugins can be found in $HOME/.oh-my-bash/plugins/*)
# Custom plugins may be added to $HOME/.oh-my-bash/custom/plugins/
# Example format:
#  if [ "$DISPLAY" ] || [ "$SSH" ]; then
#      plugins+=(tmux-autoattach)
#  fi

source "$OSH"/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANGUAGE=en_US
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# colorize man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export LESSHISTFILE=-

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch $(uname -m)"

# ssh
# Check if the SSH key file exists and generate it if it does not
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"
if [ ! -f "$SSH_KEY_PATH" ]; then
    mkdir -p "$HOME/.ssh"
    ssh-keygen -t rsa -b 4096 -f "$SSH_KEY_PATH" -N "" -q
fi

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate $HOME/.bashrc"
# alias ohmybash="mate $HOME/.oh-my-bash"
# Example aliases
alias bashconfig='source $HOME/.bashrc'
alias bashupdate='git -C $HOME/.bash/ pull && source $HOME/.bashrc'
alias ohmybash='source $HOME/.oh-my-bash'
alias osrelease='hostnamectl'
alias ohupdate='upgrade_oh_my_bash && source $HOME/.bashrc'
alias binupdate='git -C $HOME/.local/sbin/ pull'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
# shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000

setterm -linewrap on

shopt -s globstar
shopt -s histappend
shopt -s checkwinsize

# HISTCONTROL=ignoreboth
# HISTSIZE=5000
# HISTFILESIZE=5000
# HISTFILE="$HOME/.cache/.bash_history/.bash_history"

# some more ls aliases
# alias ll='ls -alFh'
# alias la='ls -A'
# alias l='ls -CF'

if [ -f $HOME/.bash_aliases ]; then
  source $HOME/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  fi
fi

convert_zsh_to_bash() {
    local input_file=$1
    local output_file=$2

    # Read the input file line by line
    while IFS= read -r line || [[ -n "$line" ]]; do
        # Replace Zsh-specific constructs with Bash equivalents
        line=$(echo "$line" | sed -E 's/\(\((.*)\)\)/\[\[\1\]\]/g')  # Replace (( ... )) with [[ ... ]]
        line=$(echo "$line" | sed -E 's/\$+commands\[(.*)\]/command -v \1 \&> \/dev\/null/g') # Replace $+commands[cmd] with command -v cmd &> /dev/null
        line=$(echo "$line" | sed 's/whence /command -v /g')      # Replace whence with command -v
        line=$(echo "$line" | sed -E 's/for cmd in \$(cmds) ; do/for cmd in "\${cmds[@]}"; do/g') # Replace for cmd in $cmds ; do with for cmd in "${cmds[@]}"; do
        line=$(echo "$line" | sed -E 's/\[\[ \$\+commands\[(.*)\] \]\]/command -v \1 \&> \/dev\/null/g') # Replace [[ $+commands[cmd] ]] with command -v cmd &> /dev/null
        echo "$line" >> "$output_file"
    done < "$input_file"
}

GRC_ALIASES=true
if [[ -s "/etc/grc.zsh" ]]; then
  if [[ ! -s $HOME/.bash/grc.sh ]]; then
    convert_zsh_to_bash /etc/grc.zsh $HOME/.bash/grc.sh
    chmod +x $HOME/.bash/grc.sh
  fi
  source $HOME/.bash/grc.sh
else
  echo "grc not installed"
  echo "sudo apt -y install grc"
  echo ""
fi

lazygit() {
  USAGE="
lazygit [OPTION]... <msg>
    GIT but lazy
    Options:
        --fixup <commit>        runs 'git commit --fixup <commit> [...]'
        --amend                 runs 'git commit --amend --no-edit [...]'
        -f, --force             runs 'git push --force-with-lease [...]'
        -h, --help              show this help text
"
  COMMIT=''
  MESSAGE=''
  AMEND=0
  FORCE=0
  while [ $# -gt 0 ]; do
    key="$1"

    case $key in
    --fixup)
      COMMIT="$2"
      shift # past argument
      shift # past value
      ;;
    --amend)
      AMEND=1
      shift # past argument
      ;;
    -f | --force)
      FORCE=1
      shift # past argument
      ;;
    -h | --help)
      echo "$USAGE"
      return 0
      ;;
    *)
      MESSAGE="$1"
      shift # past argument
      ;;
    esac
  done
  git status .
  git add .
  if [ $AMEND -eq 1 ]; then
    git commit --amend --no-edit
  elif [ "$COMMIT" != '' ]; then
    git commit --fixup "$COMMIT"
    GIT_SEQUENCE_EDITOR=: git rebase -i --autosquash "$COMMIT^"
  else
    git commit -m "$MESSAGE"
  fi
  git push origin HEAD $([ "$FORCE" -eq 1 ] && echo '--force-with-lease')
}

function find() {
  if [ $# = 1 ]; then
    command find . -iname "*$@*"
  else
    command find "$@"
  fi
}

# Simple colorize for bash by means of sed
#
# Copyright 2008-2015 by Andreas Schamanek <andreas@schamanek.net>
#
# 2017 - Modified from mycolorize into a shell function
#     by Ignacio Nunez Hernanz <nacho _a_t_ ownyourbits _d_o_t_ com>
#
# GPL licensed (see end of file) * Use at your own risk!
#
# Usage examples:
#   tail -f somemaillog | xcolorize white '^From: .*' bell
#   tail -f somemaillog | xcolorize white '^From: \/.*' green 'Folder: .*'
#   tail -f somemaillog | xcolorize --unbuffered white '^From: .*'
#
# Notes:
#   Regular expressions need to be suitable for _sed --regexp-extended_
#   Slashes / need no escaping (we use ^A as delimiter).
#   \/ splits the coloring (similar to procmailrc. Matches behind get color.
#   Even "white '(for|to) \/(her|him).*$'" works :) Surprisingly ;)
#   To color the string '\/' use the regular expression '\\()/'.
#   If the 1st argument is -u or --unbuffered, _sed_ will be run so.

# For the colors see tput(1) and terminfo(5), or e.g.
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt
# and http://stackoverflow.com/a/20983251/196133

function xcolorize() {
  local bold=$(tput bold) # make colors bold/bright
  local normal=$'\e[0m'   # (works better sometimes)

  local red="$bold$(tput setaf 1)" # bright red text
  local green=$(tput setaf 2)      # dim green text
  local fawn=$(tput setaf 3)
  beige="$fawn"                  # dark yellow text
  local yellow="$bold$fawn"      # bright yellow text
  local darkblue=$(tput setaf 4) # dim blue text
  local blue="$bold$darkblue"    # bright blue text
  local purple=$(tput setaf 5)
  magenta="$purple"                     # magenta text
  local pink="$bold$purple"             # bright magenta text
  local darkcyan=$(tput setaf 6)        # dim cyan text
  local cyan="$bold$darkcyan"           # bright cyan text
  local gray=$(tput setaf 7)            # dim white text
  local darkgray="$bold"$(tput setaf 0) # bold black = dark gray text
  local white="$bold$gray"              # bright white text

  local bell=$(tput bel) # bell/beep
  local y=0

  # Make output unbuffered? (Pass argument -u|--unbuffered to _sed_.)
  if [ "/$1/" = '/-u/' -o "/$1/" = '/--unbuffered/' ]; then
    local UNBUFFERED='-u'
    shift
  else
    local UNBUFFERED=""
  fi

  # produce separator character ^A (for _sed_)
  local A=$(echo | tr '\012' '\001')

  # compile all rules given at command line to 1 set of rules for SED
  while [ "/$1/" != '//' ]; do
    local c1=''
    local re=''
    local beep=''
    c1=$1
    re="$2"
    shift 2 || break
    # if a beep is requested in the optional 3rd parameter set $beep
    [ "/$1/" != '//' ] && [[ ("$1" = 'bell' || "$1" = 'beep') ]] &&
      beep=$bell && shift
    # if the regular expression includes \/ we split the substitution
    if [ "/${re/*\\\/*/}/" = '//' ]; then
      # we need to count "("s before the \/ (=$left)
      local left="${re%\\/*}"
      local leftlength=${#left}
      # first we count "\("
      local dummy=${left//\\(/}
      escdgroups=$(((leftlength - ${#dummy}) / 2))
      # now "(" (and we add 2 for the groups used for ($re) in $sedrules)
      local dummy=${left//(/}
      groupcnt=$((leftlength - ${#dummy} - escdgroups + 2))
      # replace \/ with )( so below we get (left-re)(right-re)
      re="${re/\\\//)(}"
      local sedrules="$sedrules;s$A($re)$A\1${!c1}\\$groupcnt$beep$normal${A}g"
      sedrules="${sedrules}I" # add case insensitive
    else
      local sedrules="$sedrules;s$A($re)$A${!c1}\1$beep$normal${A}g"
      sedrules="${sedrules}I" # add case insensitive
    fi
    # limit parsing of arguments
    ((y++ && y > 888)) && {
      echo "$0: too many arguments" >&2
      return 1
    }
  done

  # call sed to do the main job
  sed $UNBUFFERED --regexp-extended -e "$sedrules"

  return
}

# Colorize your standard output using xcolorize with a grep-like usage
#
# Copyleft 2017 by Ignacio Nunez Hernanz <nacho _a_t_ ownyourbits _d_o_t_ com>
# GPL licensed (see end of file) * Use at your own risk!
#
# Usage piping from stdin:
#   mount | xcol mnt "sda." "sdb." cgroup tmpfs proc
#
# Usage reading from a file:
#   xcol pae fpu vme mhz sse2 cache cores /proc/cpuinfo
#
# Notes:
#   It supports sed compatible regular expressions
function xcol() {
  local bold=$(tput bold)          # make colors bold/bright
  local red="$bold$(tput setaf 1)" # bright red text
  local green=$(tput setaf 2)      # dim green text
  local fawn=$(tput setaf 3)
  beige="$fawn"                  # dark yellow text
  local yellow="$bold$fawn"      # bright yellow text
  local darkblue=$(tput setaf 4) # dim blue text
  local blue="$bold$darkblue"    # bright blue text
  local purple=$(tput setaf 5)
  magenta="$purple"                     # magenta text
  local pink="$bold$purple"             # bright magenta text
  local darkcyan=$(tput setaf 6)        # dim cyan text
  local cyan="$bold$darkcyan"           # bright cyan text
  local gray=$(tput setaf 7)            # dim white text
  local darkgray="$bold"$(tput setaf 0) # bold black = dark gray text
  local white="$bold$gray"              # bright white text

  local COLS=(white yellow red cyan gray purple pink fawn)

  [ -t 0 ] && local STDIN=0 || local STDIN=1

  if [[ $STDIN == 0 ]]; then
    local ARGVS=${@:1:$#-1} # all arguments except last one
    local FILE=${@: -1}     # last argument is the file name
  else
    local ARGVS=$@
  fi

  local IDX=1 # rotate colors in a cycle
  for arg in ${ARGVS[@]}; do
    local ARGS=(${ARGS[@]} ${COLS[$IDX]} $arg)
    IDX=$((IDX + 1))
    [[ $IDX == ${#COLS[@]} ]] && IDX=1
  done
  [[ $STDIN == 1 ]] && {
    xcolorize --unbuffered ${ARGS[@]}
  } || {
    cat $FILE | xcolorize --unbuffered ${ARGS[@]}
  }
}

test -f $HOME/.local/share/lscolors.sh && . "$HOME/.local/share/lscolors.sh"

# Add this line to use code-insiders instead of code
command -v code-insiders >/dev/null && export VSCODE=code-insiders
command -v code >/dev/null && export VSCODE=code
command -v vim >/dev/null && alias vi='vim'

# Configure color-scheme
COLOR_SCHEME=dark # dark/light

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias ll='ls -laFh'
alias la='ls -A'
alias l='ls -CF'

if command -v colorls 1>/dev/null 2>&1; then
  # Get colorls version
  COLORLS_VERSION=$(colorls --version)

  # Check if the version is 1.5.0
  if [ "$COLORLS_VERSION" = "1.5.0" ]; then
    alias ll='colorls -laA --sd --gs --df --report=long'
    alias la='colorls -laA --sd --gs --df --report=long -1'
    alias ls='colorls -aA --sd --df'
    alias l='colorls --sd --df'
  else
    alias ll='colorls -laA --sd --gs --report=long'
    alias la='colorls -laA --sd --gs --report=long -1'
    alias ls='colorls -aA --sd'
    alias l='colorls --sd'
  fi

  source $(dirname $(gem which colorls))/tab_complete.sh
else
  echo "colorls not installed, falling back to ls -laFh"
  echo "sudo apt -y install ruby-rubygems ruby-dev"
  echo "sudo gem install colorls"
  echo ""
fi

export HTTP_PROXY=$http_proxy
export HTTPS_PROXY=$http_proxy
export NO_PROXY=$no_proxy

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if ! command -v snap 1>/dev/null 2>&1; then
  echo "Snap not installed"
  echo "sudo apt install snapd"
  echo ""
fi

if ! command -v node 1>/dev/null 2>&1; then
  echo "nodejs not installed"
  echo "sudo apt install nodejs"
  echo ""
fi

if command -v bat 1>/dev/null 2>&1; then
  alias bat='bat --theme=TwoDark'
else
  echo "batcat not installed"
  echo "sudo apt install bat"
  echo ""
fi

if [[ -d "$HOME/.rvm" ]]; then
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source $HOME/.rvm/scripts/rvm
  export PATH="$PATH:$HOME/.rvm/bin"
elif [[ -s "/etc/profile.d/rvm.sh" ]]; then
  source /etc/profile.d/rvm.sh
else
  echo "RVM not installed"
  echo "sudo apt install software-properties-common"
  echo "sudo apt-add-repository -y ppa:rael-gc/rvm"
  echo "sudo apt update"
  echo "sudo apt install rvm"
  echo "sudo usermod -aG rvm $USER"
  echo "newgrp rvm"
  echo "for older linux distros, see https://rvm.io/rvm/install"
  echo "curl -sSL https://get.rvm.io | bash"
  echo ""
fi

if [[ -d "$HOME/.rbenv" ]]; then
  export RBENV_ROOT="$HOME/.rbenv"
  export PATH="$RBENV_ROOT/bin:$PATH"
  eval "$(rbenv init - bash)"
else
  echo "rbenv not installed"
  echo "sudo apt -y install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev"
  echo "curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash"
  echo ""
fi

if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi
else
  echo "pyenv not installed"
  echo "sudo apt -y install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git"
  echo "curl https://pyenv.run | bash"
  echo ""
fi

if [[ -d "$HOME/go/bin" ]]; then
  export PATH="$HOME/go/bin:$PATH"
elif [[ -d "/usr/local/go/bin" ]]; then
  export PATH="$PATH:/usr/local/go/bin"
else
  echo "go not installed"
  echo "go to: https://go.dev/doc/install"
  echo "wget https://go.dev/dl/go1.22.3.linux-amd64.tar.gz"
  echo "sudo tar -C /usr/local -xvf go1.22.3.linux-amd64.tar.gz"
  echo "rm -f go1.22.3.linux-amd64.tar.gz"
  echo ""
fi

if [[ -d "$HOME/.local/sbin" ]]; then
  export PATH="$HOME/.local/sbin:$PATH"
else
  echo "local sbin not installed"
  echo ""
fi

if [[ -s "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
else
  echo "cargo not installed"
  echo "sudo apt install curl"
  echo "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
  echo "rustup update"
  echo "rustc --version"
  echo ""
fi

if [[ -d "$HOME/.dotnet" ]]; then
  export DOTNET_ROOT="$HOME/.dotnet"
else
  echo "dotnet not installed"
  echo "sudo apt install -y dotnet-sdk-8.0"
  echo "sudo apt install -y aspnetcore-runtime-8.0"
  echo "sudo apt install -y dotnet-runtime-8.0"
  echo "dotnet --version"
  echo "for older linux distros, see https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu"
  echo "wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb"
  echo "sudo dpkg -i packages-microsoft-prod.deb"
  echo "rm -f packages-microsoft-prod.deb"
  echo ""
fi

if [[ -d "$HOME/.nvm" ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
  echo "nvm not found"
  echo "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash"
  echo "nvm install 22"
  echo "node -v"
  echo "npm -v"
  echo ""
fi

# prompt_symbol=''
# PS3="└"
# PS1=${PS1//"└─▪"/"└"}

# source /home/mzw7p2/.config/broot/launcher/bash/br

export TMOUT=

shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=5000
__current_dir="$(pwd -P)"
mkdir -p "$HOME/.cache/.bash_history/"
HISTFILE="$HOME/.cache/.bash_history/.${__current_dir//[\/]/_}.bash_history"
_cust_hist_stock_histfile=$HISTFILE
_cust_hist_opwd="$(pwd -P)"
# This code snippet defines a function called local_history in Bash.
# It saves the current directory, updates the recorded directory,
# appends the current session's history to a history file,
# clears the session's history,
# and sets the history file to a custom location based on the current directory,
# and then reloads the history from the new history file.
function local_history() {
  # Get the current directory and store it in current_dir
  local current_dir="$(pwd -P)"

  # If the current directory is the same as the last recorded directory, return without doing anything
  [[ "$current_dir" == "$_cust_hist_opwd" ]] && return

  # Update the recorded directory to the current directory
  _cust_hist_opwd="$current_dir"

  # Append the current session's history to the history file
  history -a

  # Clear the current session's history
  history -c

  # Set the history file to a custom location based on the current directory
  HISTFILE="$HOME/.cache/.bash_history/.${current_dir//[\/]/_}.bash_history"

  # Reload the history from the new history file
  history -r
}

# This code snippet defines a bash function auto_activate_venv that
# automatically activates a virtual environment
# if it finds a .venv directory in the current or parent directories.
# It also deactivates any existing virtual environment if necessary.
function auto_activate_venv() {
    # Get the absolute path of the current directory
    local current_dir="$(pwd -P)"
    local venv_dir=""

    # Search for the .venv directory in the current or parent directories
    while [[ "$current_dir" != "/" ]]; do
        if [[ -d "$current_dir/.venv" ]]; then
            venv_dir="$current_dir/.venv"
            # echo "venv_dir: $venv_dir"
            break
        fi
        current_dir="$(dirname "$current_dir")"
    done

    # If a virtual environment directory is found
    if [[ -n "$venv_dir" ]]; then
        # Activate the virtual environment if no virtual environment is currently active or if a different one is active
        if [[ -z "$__VIRTUAL_ENV" || "$VIRTUAL_ENV" != "$venv_dir" ]]; then
            # Deactivate the old virtual environment if a different one is currently active
            if [[ -n "$VIRTUAL_ENV" && "$VIRTUAL_ENV" != "$venv_dir" ]]; then
              export __VIRTUAL_ENV=
              echo "Deactivating old virtual environment: $VIRTUAL_ENV"
              deactivate
            fi
            # Activate the new virtual environment
            export __VIRTUAL_ENV="$venv_dir"
            echo "Activating new virtual environment: $venv_dir"
            source "$venv_dir/bin/activate"
            python -V
        fi
    # If no virtual environment directory is found and a virtual environment is currently active
    elif [[ -n "$VIRTUAL_ENV" && -n "$__VIRTUAL_ENV" ]]; then
        # Deactivate the current virtual environment
        export __VIRTUAL_ENV=
        echo "Deactivating virtual environment: $VIRTUAL_ENV"
        deactivate
    fi
}

if [[ -z "$__PROMPT_COMMAND_ADDED" ]]; then
  export __PROMPT_COMMAND_ADDED=1
  export PROMPT_COMMAND="auto_activate_venv; local_history; $PROMPT_COMMAND"
fi

set_prompt_char() {
    local os_info=$(hostnamectl | grep "Operating System" | awk -F ': ' '{print $2}' | awk '{print $1}')
    local chassis_info=$(hostnamectl | grep "Chassis" | awk -F ': ' '{print $2}')
    local virtualization_info=$(hostnamectl | grep "Virtualization" | awk -F ': ' '{print $2}')

    # Set the chassis-specific icon
    case "$chassis_info" in
        "laptop" | "notebook" | "portable" | "desktop")
            __CHASSIS_CHAR="󰹑"
            ;;
        *)
            case "$virtualization_info" in
                "wsl") __CHASSIS_CHAR="󰖳" ;;
                "vmware") __CHASSIS_CHAR="" ;;
                "microsoft") __CHASSIS_CHAR="󰠅" ;;
                *) __CHASSIS_CHAR="" ;;
            esac
            ;;
    esac

    # Set the distribution-specific icon
    case "$os_info" in
        "Ubuntu") __PROMPT_CHAR="" ;;
        "Debian") __PROMPT_CHAR="" ;;
        "Fedora") __PROMPT_CHAR="" ;;
        "CentOS") __PROMPT_CHAR="" ;;
        "Arch") __PROMPT_CHAR="" ;;  # Note: "Arch" as hostnamectl returns "Arch"
        "Gentoo") __PROMPT_CHAR="" ;;
        "Red") __PROMPT_CHAR="󱄛" ;;    # Note: "Red" for "Red Hat"
        "ManjaroLinux") __PROMPT_CHAR="" ;;
        *) __PROMPT_CHAR="" ;;
    esac

    export __PROMPT_CHAR
    export __CHASSIS_CHAR
}

function _omb_theme_PROMPT_COMMAND {
    my_ps_host="$BOLD$ORANGE\h${_omb_prompt_normal}";
    # yes, these are the the same for now ...
    my_ps_host_root="$ORANGE\h${_omb_prompt_normal}";

    my_ps_user="$BOLD$GREEN\u${_omb_prompt_normal}"
    my_ps_root="${_omb_prompt_bold_brown}\u${_omb_prompt_normal}";

    if [ -n "$VIRTUAL_ENV" ]
    then
        ve=`basename $VIRTUAL_ENV`;
    fi

    # nice prompt
    case "`id -u`" in
        0) PS1="\n${TITLEBAR}${BRACKET_COLOR}┌$__CHASSIS_CHAR󰍴${_omb_prompt_normal}$(my_ve)$(chroot)[$my_ps_root][$my_ps_host_root]$(modern_scm_prompt)$(__my_rvm_ruby_version)[${_omb_prompt_green}\w${_omb_prompt_normal}]$(is_vim_shell)${BRACKET_COLOR}
└$__PROMPT_CHAR${prompt_symbol} ${_omb_prompt_normal}"
        ;;
        *) PS1="\n${TITLEBAR}${BRACKET_COLOR}┌$__CHASSIS_CHAR󰍴${_omb_prompt_normal}$(my_ve)$(chroot)[$my_ps_user][$my_ps_host]$(modern_scm_prompt)${_omb_prompt_normal}$(__my_rvm_ruby_version)[${_omb_prompt_green}\w${_omb_prompt_normal}]$(is_vim_shell)${BRACKET_COLOR}
└$__PROMPT_CHAR${prompt_symbol} ${_omb_prompt_normal}"
        ;;
    esac

    PS2="└$__PROMPT_CHAR"
}

set_prompt_char

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND

if [ -t 1 ] && [ -z "$CT_STARTED" ]; then
    if command -v ct &> /dev/null; then
        export CT_STARTED=1
        exec ct bash
    else
      exho "chromaterm not installed"
      echo "apt search python | grep "python.*-full" 2>/dev/null"
      echo "sudo apt -y install python3 python3-full python3-pip"
      echo "sudo -EH python3 -m pip install -U chromaterm"
      echo ""
    fi
fi
