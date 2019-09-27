set -x NIX_PATH "$HOME/.nix-defexpr/channels"
set -x NIXPKGS_CONFIG "$HOME/.nix/config.nix"
set -x NIXOS_CONFIG "$HOME/.nix/os/config.nix"
set -x NIX_LINK "$HOME/.nix-profile"
set -x NIX_USER_PROFILE_DIR "/nix/var/nix/profiles/per-user/$USER"


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

if uname -a | grep -iq 'darwin'
  ~/.nix/shell/mac-link-apps.sh
end

#-------------------------------------------------------------------
#  The great nix function
#-------------------------------------------------------------------

function nix
  switch $argv[1]

  case channels
    nix-channel --list

  case update
    nix-channel --update

  case rebuild-os
    sudo env \
      NIX_PATH="$NIX_PATH" \
      NIXOS_CONFIG="$NIXOS_CONFIG" \
      nixos-rebuild switch --option substituters 'https://cache.nixos.org'

  case packages
    nix-env -q

  case install
    nix-env --keep-going --file '<nixpkgs>' --install --attr $argv[2]

  case uninstall remove
    nix-env -f '<nixpkgs>' -e $argv[2]

  case path
    nix-store -r (nix drv $argv[2])

  case drv
    nix-instantiate '<nixpkgs>' -A $argv[2]

  case gc
    sudo nix-collect-garbage --delete-older-than $argv[2]

  case '*'
    env nix $argv[1..(count $argv)]

  end
end
