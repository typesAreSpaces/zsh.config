TO_SOURCE=(\
  "$ZSH/oh-my-zsh.sh" \
  "$HOME/.fzf.zsh" \
  "$ZSH_PLUGINS/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \
  "$ZSH_PLUGINS/zsh-autosuggestions/0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh" \
)
declare -A ACTIVE_PROJECTS
ACTIVE_PROJECTS=( )
ACTIVE_PROJECTS+=( ["$PHD_THESIS_DIR"]="$GITHUB_ACCOUNT_URL/phd-thesis" )
ACTIVE_PROJECTS+=( ["$LATEX_MACROS_DIR"]="$GITHUB_ACCOUNT_URL/PersonalLatexMacros" )
ACTIVE_PROJECTS+=( ["$GITHUB_PROJECTS_DIR/QuickTex"]="$GITHUB_ACCOUNT_URL/QuickTex" )
ACTIVE_PROJECTS+=( ["$GITHUB_PROJECTS_DIR/starter-hugo-academic"]="$GITHUB_ACCOUNT_URL/starter-hugo-academic" )
ACTIVE_PROJECTS+=( ["$GITHUB_PROJECTS_DIR/cv"]="$GITHUB_ACCOUNT_URL/cv" )
ACTIVE_PROJECTS+=( ["$GITHUB_PROJECTS_DIR/cs-357-grading"]="$GITHUB_ACCOUNT_URL/cs-357-grading" )
ACTIVE_PROJECTS+=( ["$PHD_THESIS_DIR/Documents/Side-Projects/MaxDiff/Software/AXDInterpolator"]="$GITHUB_ACCOUNT_URL/AXDInterpolator" )
ACTIVE_PROJECTS+=( ["$PHD_THESIS_DIR/Documents/Side-Projects/MaxDiff"]="$GITHUB_ACCOUNT_URL/caxd-T-_project" )
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

#eval "$(/opt/homebrew/bin/brew shellenv)"

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
~/.config/base16-shell/scripts/base16-gruvbox-dark-hard.sh
