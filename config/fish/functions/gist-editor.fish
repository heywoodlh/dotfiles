function gist-editor
  set selection (gh gist list --limit 10000 | fzf | awk '{print $1}')
  gh gist edit $selection
end
