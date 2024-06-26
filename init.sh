eval "$(zoxide init zsh)"
eval $(thefuck --alias tf)

TO_SOURCE=(\
  "$ZSH/oh-my-zsh.sh" \
  "$HOME/.fzf.zsh" \
  "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
  "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh" \
  "$ZSH_CUSTOM_PLUGINS/fzf-tab/fzf-tab.plugin.zsh" \
)
declare -A ACTIVE_PROJECTS
ACTIVE_PROJECTS=( )
ACTIVE_PROJECTS+=( ["$LATEX_MACROS_DIR"]="$GITHUB_ACCOUNT_URL/PersonalLatexMacros" )
ACTIVE_PROJECTS+=( ["$GITHUB_PROJECTS_DIR/QuickTex"]="$GITHUB_ACCOUNT_URL/QuickTex" )
ACTIVE_PROJECTS+=( ["$GITHUB_PROJECTS_DIR/website"]="$GITHUB_ACCOUNT_URL/website" )
ACTIVE_PROJECTS+=( ["$PHD_THESIS_DIR"]="$GITHUB_ACCOUNT_URL/phd-thesis" )
ACTIVE_PROJECTS+=( ["$PHD_THESIS_DIR/Documents/Side-Projects/MaxDiff"]="$GITHUB_ACCOUNT_URL/caxd-T-_project" )
ACTIVE_PROJECTS+=( ["$GITHUB_PROJECTS_DIR/AXDInterpolator/original"]="$GITHUB_ACCOUNT_URL/AXDInterpolator" )
ACTIVE_PROJECTS+=( ["$GITHUB_PROJECTS_DIR/AXDInterpolator/extension"]="$GITHUB_ACCOUNT_URL/AXDInterpolator" )
ACTIVE_PROJECTS+=( ["$GITHUB_PROJECTS_DIR/RealCertify"]="$GITHUB_ACCOUNT_URL/RealCertify" )

LOCAL_ZSH_SCRIPTS=(\
  "$ZSH_SCRIPT_DIR/system.sh" \
  "$ZSH_SCRIPT_DIR/util.sh" \
  "$ZSH_SCRIPT_DIR/backup-scripts.sh" \
  "$ZSH_SCRIPT_DIR/git.sh" \
  "$ZSH_SCRIPT_DIR/install-z3.sh" \
  "$ZSH_SCRIPT_DIR/bosque.sh" \
  "$ZSH_SCRIPT_DIR/ultimate_automizer.sh" \
  "$ZSH_SCRIPT_DIR/theme_changer.sh" \
)

for SCRIPT in ${TO_SOURCE[@]}; do 
  [ -f $SCRIPT ] && source $SCRIPT
done

for SCRIPT in ${LOCAL_ZSH_SCRIPTS[@]}; do 
  [ -f $SCRIPT ] && source $SCRIPT
done

# opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

zstyle ':fzf-tab:*' fzf-bindings 'tab:accept'
