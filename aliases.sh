# General aliases
alias sshLocalUbuntuVM="ssh -p 2222 jose@127.0.0.1"
alias sshJose='ssh -X jose@10.88.167.53'
alias dict='sdcv'

# Directory aliases
alias second_home="cd /media"
alias website="cd $WEBSITE_DIR"
alias dev="cd $DEV_DIR"
alias wu="cd $WRITE_UPS_DIR"

# Program aliases
alias python=/usr/bin/python3
alias ocaml="rlwrap ocaml"
alias wolfram="rlwrap wolfram"
alias m2="M2 --script"
alias v="vim"
alias nv="nvim"
alias nvs="nvim --listen localhost:12346 -S session"
alias ej="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | tr \"\n\" \"\0\" | xargs -0 emacsclient -c -s jose -a emacs"
alias nvf="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | tr \"\n\" \"\0\" | xargs -0 nvim"
alias nvchad="NVIM_APPNAME=NvChad nvim"
alias nvlazy="NVIM_APPNAME=LazyVim nvim"
alias c="clear"
alias updatetodos="$HOME/.local/scripts/updateTodoLists.sh"
alias smtinterpol="java -jar $APPS_DIR/smtinterpol-2.5-663-gf15aa217.jar"
alias qcu="quickConfigUpdate"
alias tksr="tmux kill-server"
alias singular="Singular"
alias mozilla="firefox"
alias printd="quick_attachment.py 249wdmk85qktm@hpeprint.com "
alias s="sxiv"
alias sftp="with-readline sftp"
alias tlmgr="/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode"
alias lg="lazygit"
alias makec="make clean"
alias gm="gitmove"
alias gn="gitedit nvim"
alias ge="gitedit ecj"
alias adobe="open -a /Applications/Adobe\ Acrobat\ DC/Adobe\ Acrobat.app/Contents/MacOS/AdobeAcrobat"
alias skim="open -a /Applications/Skim.app/Contents/MacOS/Skim"

# Theme changer aliases
alias bspwmGruvbox="changeTheme bspwm gruvbox"
alias bspwmNord="changeTheme bspwm nord"
alias bspwmTokyo="changeTheme bspwm tokyo"
