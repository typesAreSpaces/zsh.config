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

quickRemoveSubmodule(){
  GIT_DIR=$HOME/.cfg GIT_WORK_TREE=$HOME $HOME/.local/scripts/remove_submodules.sh $1
}

# Git scripts

quickGitPush(){
  git add .;
  git commit -m $1;
  git push
}

alias quickRestore="git diff --name-status | awk '{ system(\"git restore \" \$2) }'"

gitPrev(){
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" |
    fzf --ansi --no-sort --reverse --tiebreak=index \
    --bind "ctrl-m:execute:
  (grep -o '[a-f0-9]\{7\}' | head -1 |
    xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
  {}
  FZF-EOF"
}
