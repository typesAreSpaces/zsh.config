# General aliases
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias sshLocalUbuntuVM="ssh -p 2222 jose@127.0.0.1"
alias sshJose='ssh -X jose@10.88.198.99'
alias dict='sdcv'

# Directory aliases
alias second_home="cd /media"
alias phd="cd $PHD_THESIS_DIR"
alias papers_for_thesis="cd $PHD_THESIS_DIR/Documents/Papers"
alias extra="cd $PHD_THESIS_DIR/Documents/Side-Projects/kapur-talks/mpi21"
#alias report="cd $REPORTS_DIR/$CURRENT_REPORT"
alias report="cd $SEMINAR_REPORTS/$CURRENT_REPORT"
alias thesis="cd $WRITE_UPS_DIR/thesis"
alias personal_notes="cd $WRITE_UPS_DIR/personal_notes"
alias seminar="cd $PHD_DOCUMENTS/Seminars/BeihangUniversity-Fall2021"
alias scc="cd $PHD_THESIS_DIR/Documents/Side-Projects/kapur-nsf-proposal"

# Program aliases
alias ocaml="rlwrap ocaml"
alias wolfram="rlwrap wolfram"
alias m2="M2 --script"
alias v="vim"
alias nv="nvim --listen localhost:12345"
alias nvs="nvim --listen localhost:12345 -S session"
alias e="emacs -nw"
alias ec="emacsclient -nw -c"
alias todo="emacs -nw $PHD_THESIS_DIR/Documents/Org-Files/research_tasks.org"
alias updatetodos="$SCRIPT_DIR/updateTodoLists.sh"
alias addref="nvim $PHD_THESIS_DIR/Documents/Write-Ups/references.bib"
alias smtinterpol="java -jar $APPS_DIR/smtinterpol-2.5-663-gf15aa217.jar"
alias ccwr="changeCurrentWeeklyReport"
alias qcu="quickConfigUpdate"
alias bsptall1="bspLayout tall 1"
alias tksr="tmux kill-server"
alias agenda="tmux rename-session agenda;\
  tmux rename-window -t agenda:1 org-agenda; \
  tmux send-keys -t agenda:1 \
  emacsclient\ -nw\ $TODOLIST_DIR/main.org\ \
  C-m;"
alias spass="SPASS"
alias singular="Singular"
alias mozilla="firefox"

# Docker aliases
alias seahorn="systemctl start docker && sudo docker run -v $(pwd):/host -it seahorn/seahorn-llvm5"

# Theme changer aliases
alias bspwmGruvbox="changeTheme bspwm gruvbox"
alias bspwmNord="changeTheme bspwm nord"
alias bspwmTokyo="changeTheme bspwm tokyo"
