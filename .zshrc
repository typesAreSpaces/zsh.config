#zmodload zsh/zprof 

source $HOME/.config/zsh/prompt.sh
source $HOME/.config/zsh/export.sh
source $HOME/.config/zsh/aliases.sh
source $HOME/.config/zsh/init.sh

#zprof

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
