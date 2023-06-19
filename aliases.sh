# General aliases
alias sshLocalUbuntuVM="ssh -p 2222 jose@127.0.0.1"
alias sshJose='ssh -X jose@10.88.167.53'
alias dict='sdcv'

# Directory aliases
alias second_home="cd /media"
alias phd="cd $PHD_THESIS_DIR"
alias papers_for_thesis="cd $PHD_THESIS_DIR/Documents/Papers"
alias extra="cd $PHD_THESIS_DIR/Documents/Side-Projects/kapur-talks/mpi21"
#alias report="cd $REPORTS_DIR/$CURRENT_REPORT"
alias report="cd $SEMINAR_REPORTS/$CURRENT_REPORT"
alias ta="cd $CURRENT_TA_DIR"
alias grading="cd $PHD_THESIS_DIR/Documents/Semesters/2023/Spring/TA-CS-357/Grading"
alias thesis="cd $WRITE_UPS_DIR/thesis"
alias personal_notes="cd $WRITE_UPS_DIR/personal_notes"
alias seminar="cd $SEMINAR"
alias website="cd $WEBSITE_DIR"
alias scc="cd $PHD_THESIS_DIR/Documents/Side-Projects/kapur-nsf-proposal"
alias maxdiff="cd $PHD_THESIS_DIR/Documents/Side-Projects/MaxDiff"
alias axdint="cd $GITHUB_PROJECTS_DIR/AXDInterpolator/original"
alias caxdint="cd $GITHUB_PROJECTS_DIR/AXDInterpolator/extension"

# Program aliases
alias python=/usr/bin/python3
alias ocaml="rlwrap ocaml"
alias wolfram="rlwrap wolfram"
alias m2="M2 --script"
alias v="vim"
alias nv="nvim --listen localhost:12345"
alias nvs="nvim --listen localhost:12345 -S session"
alias ej="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | tr \"\n\" \"\0\" | xargs -0 emacsclient -c -s jose -a emacs"
alias e357="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | tr \"\n\" \"\0\" | xargs -0 emacsclient -c -s cs357 -a emacs"
alias nvf="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | tr \"\n\" \"\0\" | xargs -0 nvim"
alias nvchad="NVIM_APPNAME=NvChad nvim"
alias nvlazy="NVIM_APPNAME=LazyVim nvim"
alias c="clear"
alias updatetodos="$HOME/.local/scripts/updateTodoLists.sh"
alias addref="nvim $PHD_THESIS_DIR/Documents/Write-Ups/references.bib"
alias smtinterpol="java -jar $APPS_DIR/smtinterpol-2.5-663-gf15aa217.jar"
alias ccwr="changeCurrentWeeklyReport"
alias qcu="quickConfigUpdate"
alias tksr="tmux kill-server"
alias spass="SPASS"
alias singular="Singular"
alias mozilla="firefox"
alias printd="quick_attachment.py 249wdmk85qktm@hpeprint.com "
alias s="sxiv"
#alias tlmgr="/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"

# Docker aliases
alias seahorn="systemctl start docker && sudo docker run -v $(pwd):/host -it seahorn/seahorn-llvm5"

# Theme changer aliases
alias bspwmGruvbox="changeTheme bspwm gruvbox"
alias bspwmNord="changeTheme bspwm nord"
alias bspwmTokyo="changeTheme bspwm tokyo"
