PROMPT='$(check_last_exit_code)%(!.%{$fg[red]%}.%{$fg[green]%})%~ %{$fg_bold[blue]%}$(git_prompt_info)%{$reset_color%} $(vi_mode_prompt_info)
'

function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=''
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    echo "$EXIT_CODE_PROMPT "
  fi
}

function vi_mode_prompt_info() {
  if [[ -z "$NORMAL_MODE_INDICATOR" ]]; then
    NORMAL_MODE_INDICATOR="%{$FX[bold]$FG[001]%}NORMAL%{$FX[reset]%}"
  fi
  if [[ -z "$INSERT_MODE_INDICATOR" ]]; then
    INSERT_MODE_INDICATOR="%{$FX[bold]$FG[008]%}INSERT%{$FX[reset]%}"
  fi
  if [[ -z "$VISUAL_MODE_INDICATOR" ]]; then
    VISUAL_MODE_INDICATOR="%{$FX[bold]$FG[214]%}VISUAL%{$FX[reset]%}"
  fi
  case $KEYMAP in
    vivis|vivli|visual|viopp) echo -n "$VISUAL_MODE_INDICATOR";;
    vicmd) echo -n "$NORMAL_MODE_INDICATOR";;
    main|viins) echo -n "$INSERT_MODE_INDICATOR";;
  esac
}

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
