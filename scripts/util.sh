upload_video(){
  THUMBNAIL_PATH=$2
  [ -z $THUMBNAIL_PATH ] && THUMBNAIL_PATH="$HOME/Pictures/thumbnail.jpg"
  python $GITHUB_PROJECTS_DIR/VideoUploaderMachine/upload_video.py \
    --file $1 \
    --thumbnail $THUMBNAIL_PATH
}

removeQuotes(){
  cat $1 | tr -d '"'
}

bspLayout(){
  bsp-layout set $1 $2 -- --master-size 0.5
}

editSyms(){
  pushd $HOME/texmf/tex/latex/local;
  nv symbols.sty;
  git add symbols.sty;
  git commit -m "Minor changes."; 
  git push;
  popd;
}

za(){
  zathura $1 &
}

si(){
  sioyek $1 &
}

countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}
