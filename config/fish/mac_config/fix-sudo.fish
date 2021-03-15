function fix-sudo
  sudo cp /etc/pam.d/sudo{,.orig}
  printf '# sudo: auth account password session\nauth       sufficient     pam_smartcard.so\nauth       required       pam_opendirectory.so\nauth	   required	  pam_tid.so\naccount    required       pam_permit.so\npassword   required       pam_deny.so\nsession    required       pam_permit.so\n' | sudo tee /etc/pam.d/sudo
end
