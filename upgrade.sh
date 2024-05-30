#!/usr/bin/env bash

function _dot_files_bush_upgrade {
    # Use colors, but only if connected to a terminal, and that terminal
    # supports them.
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
    if ! command git --git-dir="$HOME/.bash/.git" --work-tree="$HOME/.bash" pull --rebase --stat origin master; then
        # In case it enters the rebasing mode
        printf '%s\n' "Dot Files for Bash: running 'git rebase --abort'..."
        command git --git-dir="$OSH/.git" --work-tree="$OSH" rebase --abort
        printf "${RED}%s${NORMAL}\n" \
            'There was an error updating.' \
            "If you have uncommited changes in '$BOLD$OSH$NORMAL$RED', please commit, stash or discard them and retry updating." \
            "If you have your own local commits in '$BOLD$OSH$NORMAL$RED' that conflict with the upstream changes, please resolve conflicts and merge the upstream manually."
        return 1
    fi

    printf '%s' "$GREEN"
    # shellcheck disable=SC1003,SC2016
    if command -v pyfiglet 1>/dev/null 2>&1; then
        pyfiglet -f smslant -w 80 "Dot Files for Bash"
    fi
    printf "${BLUE}%s\n" "Hooray! Dot Files for Bash has been updated and/or is at the current version."
    printf "${BLUE}${BOLD}%s${NORMAL}\n" "To keep up on the latest news and updates, follow us on Git: https://bitbucket.ultracruise.gm.com/scm/~mzw7p2/bash"
    if [[ $- == *i* ]]; then
        # shellcheck disable=SC1090
        source ~/.bashrc
    fi
}
_dot_files_bush_upgrade
