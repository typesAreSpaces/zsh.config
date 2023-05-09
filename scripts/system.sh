updateEmacs(){
  emacsclient -s jose -a emacs -e "(auto-package-update-now-async)"
  emacsclient -s jose -a emacs -e "(straight-pull-all)"
  emacsclient -s jose -a emacs -e "(straight-rebuild-all)"
}
updateNvim(){
  nvim --headless +TSUpdateSync +qa;
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync';
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
  ame upg;
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
  du -a $(pwd) | awk '{ gsub (" ", "\\ ", $0); $1 = ""; print $0; }' | fzf | xargs -r xdg-open; 
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
  emacs --quick -l "~/Documents/GithubProjects/phd-thesis/Documents/Semesters/2023/Spring/TA-CS-357/Extra/basic_configuration/cs-357-linux.el" ${@:1}
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
