updateActiveProjects(){
  for project url in ${(kv)ACTIVE_PROJECTS}; do
    echo ">>> Updating project: $project"
    [ ! -d $project ] && git clone $url $project
    pushd $project
    git pull
    popd
  done
}
update(){
  echo ">>> Update local projects"
  updateActiveProjects
  echo ">>> Update software"
  brew update && brew upgrade
  echo ">>> Update emacs packages"
  #todo
  echo ">>> Update neovim packages"
  nvim --headless +TSUpdateSync +qa
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  echo ">>> Update Latex macros"
  [ -d $LATEX_MACROS_DIR ] && make -C $LATEX_MACROS_DIR
}

se(){ 
  du -a $(pwd) | awk '{ gsub (" ", "\\ ", $0); $1 = ""; print $0; }' | fzf | xargs -r xdg-open; 
}

pwdclip(){ 
  pwd | awk '{gsub( " ","\\ " ); print}' | xclip -selection c 
}

cdclip(){ 
  $(xclip -o) 
}

updateBrewPackages(){ 
  brew bundle dump
}

installBrewPackages(){ 
  brew bundle
}

e(){
  emacs --with-profile=$1 ${@:2}
}
et(){
  emacsclient -t -s $1 -a emacs ${@:2}
}
ec(){
  emacsclient -c -s $1 -a emacs ${@:2}
}
ne(){
  emacs --with-profile=$1 --daemon &
}
ke(){
  emacsclient -s $1 -a emacs -e "(kill-emacs)"
}
re(){
  ke $1
  ne $1
}
