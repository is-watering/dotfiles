export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export DefaultIMModule=fcitx

export EDITOR=nvim
export VISUAL=nvim

# load Xresources
xrdb ~/.Xresources

# ranger
export RANGER_DEVICONS_SEPARATOR='  '

# fzf

# keychain
if status --is-interactive
  keychain --quiet --agents ssh
end

begin
  set -l HOSTNAME (hostname)
    if test -f ~/.keychain/$HOSTNAME-fish
      source ~/.keychain/$HOSTNAME-fish
  end
end

# yvm
set -x YVM_DIR /home/pp/.yvm
[ -r $YVM_DIR/yvm.fish ]; and source $YVM_DIR/yvm.fish

# asdf
source /opt/asdf-vm/asdf.fish

