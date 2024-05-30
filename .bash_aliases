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

alias bashconfig='source $HOME/.bashrc'
alias bashupdate='$HOME/.bash/upgrade.sh && source $HOME/.bashrc'
alias ohmybash='source $HOME/.oh-my-bash'
alias osrelease='hostnamectl'
alias ohupdate='upgrade_oh_my_bash && source $HOME/.bashrc'
alias binupdate='$HOME/.local/sbin/upgrade.sh && source $HOME/.bashrc'

if [[ -z $__UPGRADED_SCRIPTS__ ]]; then
    export __UPGRADED_SCRIPTS__=1
    echo "Upgrading Dot Files"
    source $HOME/.bash/upgrade.sh
    echo "Upgrading CCU Tools"
    source $HOME/.local/sbin/upgrade.sh
fi

if command -v vim 1>/dev/null 2>&1; then
    alias vi='vim'
else
    echo "vim not installed"
    echo "sudo -EH apt -y install biosyntax-vim cream dh-vim-addon geany-plugin-vimode libghc-yi-keymap-vim-dev libghc-yi-keymap-vim-doc libghc-yi-keymap-vim-prof neovim neovim-qt neovim-runtime notmuch-vim pacvim supercollider-vim vim vim-addon-manager vim-addon-mw-utils vim-airline vim-airline-themes vim-athena vim-autopep8 vim-bitbake vim-command-t vim-common vim-ctrlp vim-doc vim-fugitive vim-gtk3 vim-gui-common vim-haproxy vim-icinga2 vim-julia vim-khuno vim-lastplace vim-latexsuite vim-ledger vim-migemo vim-nox vim-pathogen vim-puppet vim-python-jedi vim-rails vim-runtime vim-scripts vim-snipmate vim-snippets vim-syntastic vim-syntax-gtk vim-tabular vim-textobj-user vim-tiny vim-tjp vim-tlib vim-vimerl vim-vimerl-syntax vim-voom vim-youcompleteme"
    echo ""
fi

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
    echo "sudo -EH apt -y install ruby-rubygems ruby-dev"
    echo "sudo -EH gem install colorls"
    echo ""
fi

GRC_ALIASES=true
if [[ -s "/etc/grc.zsh" ]]; then
    if [[ ! -s $HOME/.bash/grc.sh ]]; then
        convert_zsh_to_bash /etc/grc.zsh $HOME/.bash/grc.sh
        chmod +x $HOME/.bash/grc.sh
    fi
    source $HOME/.bash/grc.sh
else
    echo "grc not installed"
    echo "sudo -EH apt -y install grc"
    echo ""
fi
