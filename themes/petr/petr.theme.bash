#!/usr/bin/env bash

SCM_THEME_PROMPT_DIRTY=" ${bold_white}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_white}✓"
SCM_THEME_PROMPT_PREFIX=" ${white}"
SCM_THEME_PROMPT_SUFFIX="${white}"

GIT_THEME_PROMPT_DIRTY=" ${bold_white}✗"
GIT_THEME_PROMPT_CLEAN=" ${bold_white}✓"
GIT_THEME_PROMPT_PREFIX=" ${white}"
GIT_THEME_PROMPT_SUFFIX="${white}"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"

__SEP="${blue}"$'\u25a0'

function prompt_command() {
	local code=$?
	test "${code}" -ne 0 && code="${red}${code}" || code="${green}${code}"

	PS1="\n${__SEP}${white} \u  ${__SEP}${white} \h  ${__SEP}${white} $(clock_prompt) \n${__SEP} ${bold_white}\w\n${__SEP} ${white}$(scm_prompt_char_info)  ${__SEP} ${white}(\\\$?= ${code}${white}) ${bold_white}\\$ ${white}"
}

THEME_SHOW_CLOCK_CHAR=${THEME_SHOW_CLOCK_CHAR:-"true"}
THEME_CLOCK_CHAR_COLOR=${THEME_CLOCK_CHAR_COLOR:-"$red"}
THEME_CLOCK_COLOR=${bold_white}
THEME_CLOCK_FORMAT="%Y-%m-%d %H:%M:%S %Z"

safe_append_prompt_command prompt_command
