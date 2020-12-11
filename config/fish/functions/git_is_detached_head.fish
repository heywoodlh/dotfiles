function git_is_detached_head \
    --description "Check if a repository is in a detached HEAD state"
    command git symbolic-ref --quiet HEAD >/dev/null 2>&1 && test $status = 1
end
