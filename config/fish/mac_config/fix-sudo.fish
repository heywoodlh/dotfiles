function fix-sudo
  sudo cp /etc/pam.d/sudo{,.orig}
  if [ -e /usr/local/lib/pam/pam_watchid.so.2 ]
    printf '# sudo: auth account password session\nauth       sufficient     pam_smartcard.so\nauth       required       pam_opendirectory.so\nauth       sufficient     pam_watchid.so\nauth       required     pam_tid.so\naccount    required       pam_permit.so\npassword   required       pam_deny.so\nsession    required       pam_permit.so\n' | sudo tee /etc/pam.d/sudo
  else
    printf '# sudo: auth account password session\nauth       sufficient     pam_smartcard.so\nauth       required       pam_opendirectory.so\nauth       required     pam_tid.so\naccount    required       pam_permit.so\npassword   required       pam_deny.so\nsession    required       pam_permit.so\n' | sudo tee /etc/pam.d/sudo
  end
end
