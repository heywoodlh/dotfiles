function git_branch_name \
    --description "Print the name of the current branch, tag, or commit-ish"
    
    command git symbolic-ref --short HEAD 2>/dev/null \
        || command git describe --tags --exact-match HEAD 2>/dev/null \
        || command git rev-parse --short HEAD 2>/dev/null 
end