function sh_template
	touch $argv[1]
	echo "#!/usr/bin/env bash" >> $argv[1]
	echo "set -x" >> $argv[1]
	echo "set -u" >> $argv[1]
	echo "set -e" >> $argv[1]
  chmod 744 $argv[1]
end

function git_template
  printf "$argv[1]\n" > README.md
  set len (string length $argv[1])
  ruby -e "$len.times {|i| print '=' }; puts " >> README.md
  printf "\


# Features



# Description



# Requirement



# Usage



# Installation



# License

MIT
" | cat >> README.md
end

# function kill_process
#   set pid (pgrep $argv[1])
#   if not (-z $pid "")
#     # kill -9 $pid
#     echo 11
#   else
#     echo 22
#   end
# end

function ansible_chceck
  # usage
  # $ ansible_check ./locahost.yml
  ansble-playbook --syntax-check $argv[1]
  ansible-playbook --check $argv[1] --vault-password-file ~/.ansible/.vault_password
  ansible-lint $argv[1]

function reload_tmux_conf
  tmux source-file ~/.tmux.conf; tmux display-message "reload"
end
