updateEmacs(){
  emacsclient -s jose -a emacs -e "(auto-package-update-now-async)"
  emacsclient -s jose -a emacs -e "(straight-pull-all)"
  emacsclient -s jose -a emacs -e "(straight-rebuild-all)"
}
updateNvim(){
  nvim --headless +TSUpdateSync +qa;
  nvim --headless '+Lazy! sync' +qa
}
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
  echo ">>> Update config"
  updateMachine.sh;
  echo ">>> Update software"
  paru;
  #echo ">>> Update emacs packages"
  #updateEmacs 
  echo ">>> Update neovim packages"
  updateNvim
  echo ">>> Update Latex macros"
  [ -d $LATEX_MACROS_DIR ] && make -C $LATEX_MACROS_DIR
}

setScreenBrightness(){
  xrandr --output DP-0 --brightness $1
}

updateMirrorList(){
  sudo reflector --latest 100 --protocol https --country 'US' --sort age --save /etc/pacman.d/mirrorlist
}

se(){ 
  du -a "$(pwd)" | awk '{ gsub (" ", "\\ ", $0); $1 = ""; print $0; }' | fzf | xargs -r xdg-open; 
}

pwdclip(){ 
  pwd | awk '{gsub( " ","\\ " ); print}' | xclip -selection c 
}

cdclip(){ 
  $(xclip -o) 
}

updateArchPackages(){ 
  pacman -Qqe > .arch_packages
}
installArchPackages(){ 
  cat .arch_packages | xargs pacman -S --needed --noconfirm
}

tns(){
  tmux new -s $1 -d
  tmux switch -t $1
}
trs(){
  tmux rename-session $1
}

e(){
  emacs --with-profile=$1 ${@:2}
}
et(){
  emacsclient -t -s $1 -a emacs ${@:2}
}
ec(){
  emacsclient -s $1 -n -e "(> (length (frame-list)) 1)" | grep -q t
  if [ "$?" = "1" ]; then
    emacsclient -c -s $1 -a emacs ${@:2}
  else
    emacsclient $3 -s $1 -a emacs ${@:2}
  fi
}
etj(){
  ej 'jose' $1
}
ecj(){
  ec 'jose' $1 $2
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
