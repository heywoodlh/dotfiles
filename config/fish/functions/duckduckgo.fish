function duckduckgo
  set search_query $argv
  links "https://duckduckgo.com/?q=$search_query"
end
