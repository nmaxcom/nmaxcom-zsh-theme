#!/bin/zsh
# TODO: solve the apparent repetition of red color when exit code is diff than 1 until I run "echo $?"

# Components (basic and prompt-ready)
local cmdsym="Δ"
local coloredcmdsym="%(!.%{$fg_bold[red]%}${cmdsym}.%{$fg_bold[green]%}${cmdsym})%{$reset_color%}"
local rootsym="%{$fg_bold[red]%}#" # or ♔ ♕ ♚ ♛  ?
local usersym="%{$fg_bold[green]%}$"
local user="%{$fg_bold[white]%}%n%{$reset_color%}"
local whole_dir="%(?:%d%{$reset_color%}:%{$fg_bold[red]%}%d%{$reset_color%})" # shown in red if last command finished badly
local shellsym="%(!.${rootsym}.${usersym})"
local clock="%{$reset_color%}[%{$fg_bold[white]%}%D{%H:%M:%S}%{$reset_color%}]"

# I add XX to make it less probable for a false positive to appear (for example, a clean master branch that's name dirty...Would be flagged as dirty)
ZSH_THEME_GIT_PROMPT_DIRTY="XXdirtyXX"
ZSH_THEME_GIT_PROMPT_CLEAN="XXcleanXX"

# Checking if there's a git repo. If it is, green for an all clean and yellow/orange for dirty. If it isn't, show nothing. KISS
function gitresult() {
symbol="●"
nogit=""
if [[ -z $(git_prompt_info) ]]; then
	echo "%{$fg[black]%}${nogit}%{$reset_color%}" # grey
else
	if [[ $(git_prompt_info) == *"XXdirtyXX)" ]]; then
		echo "%{$FG[208]%}${symbol}%{$reset_color%}" # orange
	elif [[ $(git_prompt_info) == *"XXcleanXX)" ]]; then
		echo "%{$fg[green]%}${symbol}%{$reset_color%}" # green
	else
		echo "Couldn't parse git status -> $(git_prompt_info)"
	fi
fi
}

###############
# Left prompt
PROMPT='${coloredcmdsym} ${user} ${whole_dir} ${shellsym}%{$reset_color%}  '

ZLE_RPROMPT_INDENT=0

# Right prompt
RPROMPT='$(gitresult) ${clock}'
###############
