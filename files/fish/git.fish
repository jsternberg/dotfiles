#!fish

for prefix in /usr /usr/local /opt/local
  if test -f $prefix/share/fish/completions/git.fish
    source $prefix/share/fish/completions/git.fish
    break
  end
end

if not functions -q __fish_git_needs_command
  echo \nError: git completion not found >&2
  exit
end

complete -f -c git -n '__fish_git_needs_command' -a change-branch -d 'Checkout and switch to a branch'
complete -f -c git -n '__fish_git_using_command change-branch' -a '(__fish_git_branches)' --description 'Branch'
complete -f -c git -n '__fish_git_using_command change-branch' -a '(__fish_git_heads)' --description 'Head'
complete -f -c git -n '__fish_git_using_command change-branch' -a '(__fish_git_unique_remote_branches)' --description 'Remote branch'
complete -f -c git -n '__fish_git_using_command change-branch' -a '(__fish_git_tags)' --description 'Tag'
complete -f -c git -n '__fish_git_using_command change-branch' -s b -d 'Create a new branch'
