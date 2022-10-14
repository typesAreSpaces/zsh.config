# Quick script for local dot files

config(){
  /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME ${@:1}
}

quickConfigUpdate(){
  config status | grep "modified:" | sed 's/modified:/git --git-dir=$HOME\/.cfg --work-tree=$HOME add/g' | zsh;
  config status | grep "new file:" | sed 's/new file:/git --git-dir=$HOME\/.cfg --work-tree=$HOME add/g' | zsh;
}

quickConfigRestore(){
  config status | grep "modified:" | sed 's/modified:/git --git-dir=$HOME\/.cfg --work-tree=$HOME restore/g' | zsh;
}

quickUntrack(){
  config rm --cached $1
}

# Git scripts

quickGitPush(){
  git add .;
  git commit -m $1;
  git push
}
