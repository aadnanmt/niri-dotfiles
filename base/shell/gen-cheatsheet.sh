#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
{
    echo "<!-- SHELL CHEATSHEET :: aliases & abbreviations -->"
    echo "<!-- AUTO-GENERATED :: skip edit manual -->"
    echo "<!-- Regenerate: ./gen-cheatsheet.sh -->"
    echo "<!-- Sections mirror each shell env; duplicat are intentional per-shell ports. -->"
    echo
    echo "## POSIX (bash/zsh) :: aliases.sh"
    echo
    echo '```sh'
    rg '^alias ' aliases.sh
    echo '```'
    echo
    echo "## Fish :: aliases.fish"
    echo
    echo '```fish'
    rg '^alias ' ../fish/conf.d/aliases.fish
    echo '```'
    echo
    echo "## Fish :: abbr.fish"
    echo
    echo '```fish'
    rg '^abbr ' ../fish/conf.d/abbr.fish
    echo '```'
} > CHEATSHEET.md
