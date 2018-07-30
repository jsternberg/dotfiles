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

function fish_user_key_bindings
  # preserve old fish behavior of wiping out the line instead of creating a newline
  bind \cc 'commandline ""'
end

alias git hub

set -x EDITOR vim

# go
set -x GOPATH $HOME/go
set -x DEPCACHEAGE 24h
alias go "env GOGC=off go"

# docbook
set -x XML_CATALOG_FILES /usr/local/etc/xml/catalog

# etcdctl should use api version 3 by default
set -x ETCDCTL_API 3

# add additional binary paths in a way that prevents them from being duplicated
set fish_user_paths $GOPATH/bin $HOME/git-helpers/bin{% if ansible_distribution == 'MacOSX' %} /usr/local/opt/sqlite/bin{% endif %}

function jsfmt
  cat $argv[1] | python -mjson.tool
end
