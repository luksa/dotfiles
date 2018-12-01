local hash_or_dollar="%(!.#.$)"
local ret_status="%(?:%{$reset_color%}${hash_or_dollar} :%{$fg_bold[red]%}${hash_or_dollar} )%{$reset_color%}"
PROMPT='[%{$fg_bold[blue]%}%n@%m %{$fg_bold[yellow]%}%1~%{$reset_color%}$(git_prompt_info)]${ret_status}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}✗%{$fg[green]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
