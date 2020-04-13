set fish_greeting ''

eval (python3 -m virtualfish compat_aliases)

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

if test -d ~/.nix-profile/bin
  if not echo "$PATH" | grep -q '~/.nix-profile/bin'
    set -gx PATH ~/.nix-profile/bin $PATH 
  end
end

if test -d /usr/local/go/bin
  if not echo "$PATH" | grep -q '/usr/local/go/bin'
    set -gx PATH /usr/local/go/bin $PATH
  end
end

if test -d ~/go/bin
  if not echo "$PATH" | grep -q '~/go/bin'
    set -gx PATH ~/go/bin $PATH
  end
end

if test -d /usr/X11R6/bin
  if not echo "$PATH" | grep -q '/usr/X11R6/bin'
    set -gx PATH /usr/X11R6/bin $PATH
  end
end

if test -d ~/.local/bin
  if not echo "$PATH" | grep -q '~/.local/bin'
    set -gx PATH ~/.local/bin $PATH
  end
end

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
source ~/.config/fish/functions/security-functions.fish
source ~/.config/fish/functions/vultr.fish

set -x NIX_PATH "$HOME/.nix-defexpr/channels"
set -x NIXPKGS_CONFIG "$HOME/.nix/config.nix"
set -x NIXOS_CONFIG "$HOME/.nix/os/config.nix"
set -x NIX_LINK "$HOME/.nix-profile"
set -x NIX_USER_PROFILE_DIR "/nix/var/nix/profiles/per-user/$USER"
set -x NIX_IGNORE_SYMLINK_STORE 1

if uname -a | grep -iq 'Linux'
  export XDG_DATA_DIRS="$HOME/.nix-profile/share:$HOME/.local/share/:/usr/share:$XDG_DATA_DIRS"
end

if test -f /etc/ssl/certs/ca-certificates.crt
  set -x NIX_SSL_CERT_FILE "/etc/ssl/certs/ca-certificates.crt"

else if test -f /etc/ssl/ca-bundle.pem
  set -x NIX_SSL_CERT_FILE "/etc/ssl/ca-bundle.pem"

else if test -f /etc/ssl/certs/ca-bundle.crt
  set -x NIX_SSL_CERT_FILE "/etc/ssl/certs/ca-bundle.crt"

else if test -f /etc/pki/tls/certs/ca-bundle.crt
  set -x NIX_SSL_CERT_FILE "/etc/pki/tls/certs/ca-bundle.crt"

else if test -f "$NIX_LINK/etc/ssl/certs/ca-bundle.crt"
  set -x NIX_SSL_CERT_FILE "$NIX_LINK/etc/ssl/certs/ca-bundle.crt"

else if test -f "$NIX_LINK/etc/ca-bundle.crt"
  set -x NIX_SSL_CERT_FILE "$NIX_LINK/etc/ca-bundle.crt"
end

if pass ls | grep -q openweathermap_api
  set WTF_OWM_API_KEY (pass openweathermap_api)
end 
