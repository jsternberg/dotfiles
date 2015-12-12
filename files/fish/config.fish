# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

set fish_greeting

function fish_prompt
  set_color $fish_color_cwd
  printf '%s:[%s] $' (whoami) (prompt_pwd)
  set_color normal
  printf '%s ' (__fish_git_prompt)
  set_color normal
end

alias git hub

set -x EDITOR vim

# go
set -x GOPATH $HOME/go

# add additional binary paths in a way that prevents them from being duplicated
set fish_user_paths $GOPATH/bin
