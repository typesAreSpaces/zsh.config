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
  echo ">>> Update software"
  brew update && arch --arm64 brew upgrade
  #echo ">>> Update emacs packages"
  #updateEmacs 
  echo ">>> Update neovim packages"
  updateNvim
  echo ">>> Update Latex macros"
  [ -d $LATEX_MACROS_DIR ] && make -C $LATEX_MACROS_DIR
}

se(){ 
  du -a "$(pwd)" | awk '{ gsub (" ", "\\ ", $0); $1 = ""; print $0; }' | fzf | xargs -r open; 
}

fo(){
  du -a "$(pwd)" | awk '{ gsub (" ", "\\ ", $0); $1 = ""; print $0; }' | xargs -I {} echo {} | fzf --print0 | xargs -0 -o $1
}

pwdclip(){ 
  pwd | awk '{gsub( " ","\\ " ); print}' | pbcopy
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
  emacs --init-directory $1 ${@:2}
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
  emacs --init-directory $1 --daemon=$2 &
}
ke(){
  emacsclient -s $1 -a emacs -e "(kill-emacs)"
}
re(){
  ke $2
  ne $1 $2
}

rej(){
  re $HOME/.config/jose-emacs jose
}

unzip1(){
  file="$1"
  unzip "$file" -d "$(basename "$file" .zip)"
}

mydiff(){
  diff -u "$1" "$2" | ydiff -s   
}

#justdir(){
  #REPO_PATH="$(git rev-parse --show-toplevel)"
  #INPUT="$REPO_PATH/$1"
  #if [ -d "$INPUT" ]; then
    #echo "$INPUT"
  #elif [ -f "$INPUT" ]; then
    #dirname "$INPUT"
  #fi
#}

#gitmove(){
  #cd "$(justdir "$(git status --porcelain | fzf | awk '{ print $2 }')")"
#}

gitdir() {
  # Ensure we are in a git repo
  local repo_path
  repo_path="$(git rev-parse --show-toplevel 2>/dev/null)" || return 1

  local input="$repo_path/$1"

  if [[ -d "$input" ]]; then
    printf '%s\n' "$input"
  elif [[ -f "$input" ]]; then
    dirname -- "$input"
  fi
}

gitmove() {
  # Ensure fzf selection works and handle cancel case
  local selected
  selected="$(git status --porcelain | fzf | awk '{ print $2 }')" || return 1
  [[ -z "$selected" ]] && return 1

  local dest
  dest="$(gitdir "$selected")" || return 1

  cd "$dest" || return 1
}

gitedit() {
  # Ensure fzf selection works and handle cancel case
  local selected
  selected="$(git status --porcelain | fzf | awk '{ print $2 }')" || return 1
  [[ -z "$selected" ]] && return 1

  local repo_path
  repo_path="$(git rev-parse --show-toplevel 2>/dev/null)" || return 1

  #local input="$2 $repo_path/$selected"
  local input="$repo_path/$selected"

  "$1" "$input" || return 1
}
