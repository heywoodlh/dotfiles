function duckduckgo
  set search_query $argv
  w3m "https://duckduckgo.com/?q=$search_query"
end
