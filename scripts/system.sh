update(){
  for project in ${ACTIVE_PROJECTS[@]}; do
    echo "Updating project: $project"
    pushd $project
    git pull
    popd
  done
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
