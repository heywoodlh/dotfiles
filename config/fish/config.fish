set fish_greeting ''

#eval (python3 -m virtualfish compat_aliases)

if test -f ~/.bw_session
    set BW_SESSION (cat ~/.bw_session)
else
    set BW_SESSION ''
end

if uname -a | grep -q 'Darwin'
  set -Ux LSCOLORS cxfxcxdxbxcgdggcaghcah
end

if uname -a | grep -iq 'Linux'
  set -Ux LS_COLORS 'di=32:ln=35:so=32:pi=37:ex=35:bd=34;46:cd=37;43:su=34;46:sg=30;46:tw=30;45:ow=36;45'
end

export GOPATH=$HOME/go

set fish_user_paths       \
  $HOME/.nix-profile/bin  

if test -d /usr/local/go/bin
  set -gx PATH /usr/local/go/bin $PATH
end

if test -d ~/go
  set -gx PATH ~/go/bin $PATH
end


export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
source ~/.config/fish/functions/security-functions.fish
