## Scripts to customize system

alacrittyThemeSwitch(){
  case $1 in  
    "gruvbox")
      alacritty-theme-switch --select gruvbox_dark.yml
      ;;
    "nord")
      alacritty-theme-switch --select nord.yml
      ;;
    "tokyo")
      alacritty-theme-switch --select tokyo-night.yml
      ;;
  esac
}
polybarThemeSwitch(){
  config_file=$HOME/.config/polybar/config.ini
  case $1 in
    "gruvbox")
      ~/.config/polybar/scripts/colors.sh -gruvbox-dark
      sed -i "s|^border-color.*|border-color = #689d6a|g" $config_file
      ;;
    "nord")
      ~/.config/polybar/scripts/colors.sh -nord
      sed -i "s|^border-color.*|border-color = #88C0D0|g" $config_file
      ;;
    "tokyo")
      ~/.config/polybar/scripts/colors.sh -tomorrow-night
      sed -i "s|^border-color.*|border-color = #7aa2f7|g" $config_file
      ;;
  esac
}
wallpaperThemeSwitch(){
  case $1 in
    "gruvbox")
      sed -i "s|$WALLPAPERS_DIR/.*|$WALLPAPERS_DIR/gruv-4.jpg|g" $2
      ;;
    "nord")
      sed -i "s|$WALLPAPERS_DIR/.*|$WALLPAPERS_DIR/minimal_mountains.png|g" $2
      ;;
    "tokyo")
      sed -i "s|$WALLPAPERS_DIR/.*|$WALLPAPERS_DIR/city_night_city_coast_179489_3840x2160.jpg|g" $2
      ;;
  esac
}
nvimThemeSwitch(){
  config_file=$HOME/.config/nvim/lua/customization.lua
  case $1 in
    "gruvbox")
      sed -i "s/vim.cmd(\[\[color.*/vim.cmd(\[\[color gruvbox-material\]\])/g" $config_file
      ;;
    "nord")
      sed -i "s/vim.cmd(\[\[color.*/vim.cmd(\[\[color nord\]\])/g" $config_file
      ;;
    "tokyo")
      sed -i "s/vim.cmd(\[\[color.*/vim.cmd(\[\[color tokyonight\]\])/g" $config_file
      ;;
  esac
}
emacsThemeSwitch(){
  emacs_dir=$HOME/.emacs.d
  case $1 in
    "gruvbox")
      sed -i "s/(load-theme '.*/(load-theme 'doom-gruvbox t))/g" $EMACS_DIR/config.org
      sed -i "s/(load-theme '.*/(load-theme 'doom-gruvbox t))/g" $EMACS_DIR/init.el
      ;;
    "nord")
      sed -i "s/(load-theme '.*/(load-theme 'doom-nord t))/g" $EMACS_DIR/config.org
      sed -i "s/(load-theme '.*/(load-theme 'doom-nord t))/g" $EMACS_DIR/init.el
      ;;
    "tokyo")
      sed -i "s/(load-theme '.*/(load-theme 'doom-tokyo-night t))/g" $EMACS_DIR/config.org
      sed -i "s/(load-theme '.*/(load-theme 'doom-tokyo-night t))/g" $EMACS_DIR/init.el
      ;;
  esac
}
bspwmThemeSwitch(){
  config_file=$HOME/.config/bspwm/bspwmrc
  case $1 in
    "gruvbox")
      sed -i "s|.*focused_border_color.*|bspc config focused_border_color \"#689d6a\"|g" $config_file
      ;;
    "nord")
      sed -i "s|.*focused_border_color.*|bspc config focused_border_color \"#88C0D0\"|g" $config_file
      ;;
    "tokyo")
      sed -i "s|.*focused_border_color.*|bspc config focused_border_color \"#7aa2f7\"|g" $config_file
      ;;
  esac
}
zathuraThemeSwitch(){
  case $1 in
    "gruvbox")
      $HOME/.config/zathura/apply-gruvbox.sh
      ;;
    "nord")
      $HOME/.config/zathura/apply-nord.sh
      ;;
    "tokyo")
      $HOME/.config/zathura/apply-tokyo.sh
      ;;
  esac
}

changeTheme(){
  alacrittyThemeSwitch $2
  polybarThemeSwitch $2
  nvimThemeSwitch $2
  emacsThemeSwitch $2
  zathuraThemeSwitch $2
  tmuxThemePicker.sh $2
  case $1 in
    "i3")
      wallpaperThemeSwitch $2 "$HOME/.config/i3/config"
      # TODO check if i3 requires to be restarted
      ;;
    "bspwm")
      wallpaperThemeSwitch $2 "$HOME/.config/bspwm/bspwmrc"
      bspwmThemeSwitch $2
      bspc wm -r
      ;;
  esac 
  echo "Theme has changed to " $2 " for " $1
  ## TODO: Fix this, it's not waiting until
  ## previous script changes the keyboard layout
}
