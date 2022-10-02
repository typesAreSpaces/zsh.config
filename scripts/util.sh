upload_video(){
  THUMBNAIL_PATH=$2
  [ -z $THUMBNAIL_PATH ] && THUMBNAIL_PATH=/home/jose/Pictures/thumbnail.jpg
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

