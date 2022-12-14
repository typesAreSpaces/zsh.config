## Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

POWERLEVEL10K_DIR="$HOME/.config/zsh/themes/zsh-theme-powerlevel10k"

[[ -f "$POWERLEVEL10K_DIR/powerlevel10k.zsh-theme" ]] \
  && source "$POWERLEVEL10K_DIR/powerlevel10k.zsh-theme"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
P10K_DIR="$HOME/.config/zsh/scripts/.p10k.zsh"
[[ -f "$P10K_DIR" ]] && source "$P10K_DIR"

