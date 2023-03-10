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
  brew update && arch --arm64 brew upgrade
  echo ">>> Update emacs packages"
  emacsclient -s jose -a emacs -e "(auto-package-update-now-async)"
  #emacsclient -s jose -a emacs -e "(straight-pull-all)"
  #emacsclient -s jose -a emacs -e "(straight-rebuild-all)"
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
etj(){
  emacsclient -t -s 'jose' -a emacs ${@:1}
}
ecj(){
  emacsclient -c -s 'jose' -a emacs ${@:1}
}
etg(){
  emacsclient -t -s 'god-layer' -a emacs ${@:1}
}
ecg(){
  emacsclient -c -s 'god-layer' -a emacs ${@:1}
}
ecp(){
  emacsclient -c -s $1 -a emacs -e "(persp-state-load \"$2\")" ${@:3}
}
ecs357(){
  emacs --quick -l "~/Documents/GithubProjects/phd-thesis/Documents/Semesters/2023/Spring/TA-CS-357/Extra/basic_configuration/cs-357-macos.el" ${@:1}
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
