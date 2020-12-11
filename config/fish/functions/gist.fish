function gist
  echo 'File name: '
  read file_name
  
  echo 'Gist Description: '
  read gist_description

  vim /tmp/$file_name

  if read_confirm "Public gist?"
    gh gist create --public /tmp/$file_name -d $gist_description
  else
    gh gist create /tmp/$file_name -d $gist_description
  end
  rm /tmp/$file_name
end
