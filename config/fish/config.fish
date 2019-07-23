set fish_greeting ''

eval (python3 -m virtualfish compat_aliases)

if test -f ~/.bw_session
    set BW_SESSION (cat ~/.bw_session)
else
    set BW_SESSION ''
end

umask 022

if uname -a | grep -q 'Darwin'
  set -gx PATH /Users/heywoodlh/go/bin $PATH
  set -Ux LSCOLORS cxfxcxdxbxcgdggcaghcah
end

if uname -a | grep -iq 'Linux'
  set -gx PATH /Users/heywoodlh/go/bin $PATH
  set -Ux LSCOLORS di=32:ln=35:so=32:pi=33:ex=31:bd=32;46:cd=33;46:su=36;42:sg=30;46:tw=37;42:ow=30;47
end


export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
source ~/.config/fish/functions/security-functions.fish
