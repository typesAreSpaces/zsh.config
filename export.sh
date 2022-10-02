#zmodload zsh/zprof
# ZSHRC config
#export TERM=xterm-256color

export XDG_CONFIG_HOME="$HOME/.config"
export GPG_TTY="$TTY"
export PNPM_HOME="/home/jose/.local/share/pnpm"
export HISTIGNORE='*sudo -S*'
export ZSH="$HOME/.oh-my-zsh"
export ZSH_PLUGINS='/usr/share/zsh/plugins'
export DISABLE_AUTO_UPDATE=true
export GTK_PATH='/usr/lib/gtk-2.0'
export _JAVA_AWT_WM_NONREPARENTING=1
export LD_PRELOAD=/lib/libfreetype.so
export LD_LIBRARY_PATH=/usr/local/lib
export POWERLEVEL9K_INSTANT_PROMPT=quiet

export APPS_DIR="$HOME/Documents/Apps"
export EMACS_DIR="$HOME/.config/jose-emacs"
export EMACS_PROFILE="jose"
export MATLAB_DIR="$APPS_DIR/MATLAB/R2022a/bin"
export MSAT_DIR="$APPS_DIR/mathsat-5.6.5-linux-x86_64"
export GITHUB_ACCOUNT_URL="git@github.com:typesAreSpaces"
export GITHUB_PROJECTS_DIR="$HOME/Documents/GithubProjects"
export WEBSITE_DIR="$GITHUB_PROJECTS_DIR/starter-hugo-academic"
export BOSQUE_DIR="$GITHUB_PROJECTS_DIR/BosqueLanguage"
export MASTER_THESIS_DIR="$GITHUB_PROJECTS_DIR/master-thesis"
export PHD_THESIS_DIR="$GITHUB_PROJECTS_DIR/phd-thesis"
export PHD_SOFTWARE_DIR="$PHD_THESIS_DIR/Software"
export OUTPUT_DIR="$PHD_SOFTWARE_DIR/Output"
export PHD_DOCUMENTS="$PHD_THESIS_DIR/Documents"
export MY_PRESENTATIONS="$PHD_DOCUMENTS/Presentations/Personal"
export CURRENT_TA_DIR="$PHD_DOCUMENTS/Semesters/Fall/2022/TA-CS-241"
export TODOLIST_DIR="$PHD_DOCUMENTS/Org-Files"
export WRITE_UPS_DIR="$PHD_DOCUMENTS/Write-Ups"
export REPORTS_DIR="$WRITE_UPS_DIR/weekly_reports/Spring/2022"
export SEMINAR="$PHD_DOCUMENTS/Seminars/BeihangUniversity-Fall2021"
export SEMINAR_REPORTS="$SEMINAR/Reports"
#export CURRENT_REPORT='5_cabral_dimension_two'
export CURRENT_REPORT='finding_certificates_qm_univariate'
export MATHEMATICA_PKG_DIR="$PHD_SOFTWARE_DIR/Mathematica/Packages"
export MAPLE_PKG_DIR="$PHD_SOFTWARE_DIR/Maple/Packages"
export LATEX_MACROS_DIR="$HOME/texmf/tex/latex/local"
# Important to use ~ instead of $HOME. This has something
# to do with how sed works on other files using WALLPAPERS_DIR
export WALLPAPERS_DIR="~/Pictures/Wallpapers"
export SCRIPT_DIR="$HOME/.local/scripts"
export SCRIPT_DIR="$SCRIPT_DIR:$HOME/.local/scripts/UnseenMail"
export ZSH_SCRIPT_DIR="$HOME/.config/zsh/scripts"

export PATH="/usr/bin:$PATH"
export PATH="$SCRIPT_DIR:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.opam/system/bin:$PATH"
export PATH="$HOME/.opam/4.07.0/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH" 
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"
export PATH="$APPS_DIR:$PATH"
export PATH="$APPS_DIR/Maple/maple2019/bin:$PATH"
export PATH="$APPS_DIR/LADR-2009-11A/bin:$PATH"
export PATH="$APPS_DIR/cweb:$PATH"
export PATH="$APPS_DIR/csdp6.2.0linuxx86_64/bin:$PATH"
export PATH="$APPS_DIR/spass:$PATH"
export PATH="$MATLAB_DIR:$PATH"
export PATH="$GITHUB_PROJECTS_DIR/M2/M2:$PATH"
export PATH="$GITHUB_PROJECTS_DIR/Singular4/bin:$PATH"
export PATH="$GITHUB_PROJECTS_DIR/sdpa-gmp:$PATH"
export PATH="$GITHUB_PROJECTS_DIR/bspswallow:$PATH"
export PATH="$PNPM_HOME:$PATH"
