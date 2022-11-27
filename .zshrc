# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#zmodload zsh/zprof 

source $HOME/.config/zsh/prompt.sh
source $HOME/.config/zsh/export.sh
source $HOME/.config/zsh/aliases.sh
source $HOME/.config/zsh/init.sh

#zprof

# pnpm
export PNPM_HOME="/home/jose/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/scripts/.p10k.zsh.
[[ ! -f ~/.config/zsh/scripts/.p10k.zsh ]] || source ~/.config/zsh/scripts/.p10k.zsh
