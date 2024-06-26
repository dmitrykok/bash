#!/usr/bin/env bash

function _dot_files_bush_upgrade {
    # Use colors, but only if connected to a terminal, and that terminal
    # supports them.
    LOCK_FILE="$HOME/.dot_files_bush_upgrade.lock"
    if [[ -f "$LOCK_FILE" ]]; then
        return 0
    fi

    touch "$LOCK_FILE"

    # Fetch the latest changes from the remote repository
    git --git-dir="$HOME/.bash/.git" --work-tree="$HOME/.bash" fetch

    # Check if there are new commits in the remote repository
    LOCAL=$(git --git-dir="$HOME/.bash/.git" --work-tree="$HOME/.bash" rev-parse @)
    REMOTE=$(git --git-dir="$HOME/.bash/.git" --work-tree="$HOME/.bash" rev-parse @{u})

    if [ "$LOCAL" = "$REMOTE" ]; then
        rm -f "$LOCK_FILE"
        return 0
    fi

    local ncolors=
    if type -P tput &>/dev/null; then
        ncolors=$(tput colors)
    fi

    local RED GREEN BLUE BOLD NORMAL
    if [[ -t 1 && $ncolors && $ncolors -ge 8 ]]; then
        RED=$(tput setaf 1 2>/dev/null || tput AF 1 2>/dev/null)
        GREEN=$(tput setaf 2 2>/dev/null || tput AF 2 2>/dev/null)
        BLUE=$(tput setaf 4 2>/dev/null || tput AF 4 2>/dev/null)
        BOLD=$(tput bold 2>/dev/null || tput md 2>/dev/null)
        NORMAL=$(tput sgr0 2>/dev/null || tput me 2>/dev/null)
    else
        RED=""
        GREEN=""
        BLUE=""
        BOLD=""
        NORMAL=""
    fi

    printf '%s\n' "${BLUE}Updating Dot Files for Bash${NORMAL}"

    # Note: The git option "-C PATH" is only supported from git-1.8.5
    # (https://github.com/git/git/commit/44e1e4d6 2013-09).  On the other hand,
    # the synonym "--git-dir=PATH/.git --work-tree=PATH" is supported from
    # git-1.5.3 (https://github.com/git/git/commit/892c41b9 2007-06).
    if ! command git --git-dir="$HOME/.bash/.git" --work-tree="$HOME/.bash" pull --rebase --stat origin main; then
        # In case it enters the rebasing mode
        printf '%s\n' "Dot Files for Bash: running 'git rebase --abort'..."
        command git --git-dir="$HOME/.bash/.git" --work-tree="$HOME/.bash" rebase --abort
        printf "${RED}%s${NORMAL}\n" \
            'There was an error updating.' \
            "If you have uncommited changes in '$BOLD$HOME/.bash$NORMAL$RED', please commit, stash or discard them and retry updating." \
            "If you have your own local commits in '$BOLD$HOME/.bash$NORMAL$RED' that conflict with the upstream changes, please resolve conflicts and merge the upstream manually."
        rm -f "$LOCK_FILE"
        return 1
    fi

    printf '%s\n' "$NORMAL"
    # shellcheck disable=SC1003,SC2016
    if command -v pyfiglet 1>/dev/null 2>&1; then
        pyfiglet -f poison -w 80 -c GREEN "Dot Files for Bash"
    fi
    printf "${BLUE}%s\n" "Hooray! Dot Files for Bash has been updated and/or is at the current version."
    printf "${BLUE}${BOLD}%s${NORMAL}\n" "To keep up on the latest news and updates, follow us on Git: https://bitbucket.ultracruise.gm.com/scm/~mzw7p2/bash"
    rm -f "$LOCK_FILE"
    $HOME/.bash/setup.sh
    return 0
}
_dot_files_bush_upgrade
