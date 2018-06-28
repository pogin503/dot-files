function sh_template
	touch $argv[1]
	echo "#!/usr/bin/env bash" >> $argv[1]
	echo "set -x" >> $argv[1]
	echo "set -u" >> $argv[1]
	echo "set -e" >> $argv[1]
  chmod 744 $argv[1]
end

function _read_confirm
  while true
    read -l -p _read_confirm_prompt confirm

    switch $confirm
      case Y y
        return 0
      case '' N n
        return 1
    end
  end
end

function _read_confirm_prompt
  echo 'README.md already exists. Do you want to overwrite ? [y/N] '
end

function readme_template
  if [ (count $argv) = 0 ]
    printf "usage:
    \$ readme_template <app_name>\n"
    return
  else
    if [ -f README.md ];
      if not _read_confirm
        return
      end
    end
    printf "$argv[1]\n" > README.md
    set len (string length $argv[1])
    ruby -e "$len.times {|i| print '=' }; puts " >> README.md
    set template "\


# Features



# Description



# Requirement



# Usage



# Installation



# License

MIT
"
    printf $template | cat >> README.md
  end
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

function ansible_check
  # usage
  # $ ansible_check ./locahost.yml
  # $ ansible_check ./locahost.yml hosts
  if [ (string length "$argv.length") = 0 ]
    exit
  else if [ (string length "$argv.length") = 1 ]
    ansible-playbook --syntax-check $argv[1]
    and ansible-playbook --check $argv[1] --vault-password-file ~/.ansible/.vault_password
    and ansible-lint $argv[1]
  else
    ansible-playbook --syntax-check $argv[1] -i $argv[2]
    and ansible-playbook --check $argv[1] -i $argv[2] --vault-password-file ~/.ansible/.vault_password
    and ansible-lint $argv[1]
  end
end

function reload_tmux_conf
  tmux source-file ~/.tmux.conf; tmux display-message "reload"
end

function dbash
    # $1 -> container_id
    command docker exec -it "$argv[1]" bash
end

function kbash
    # $1 -> container_id
    command kubectl exec -it "$argv[1]" bash
end

function homestead
    pushd ~/Homestead ;and vagrant $argv[1..-1]
    popd
end

function magit
    set repo $argv[1]
    string length -q -- $repo; or set repo (pwd)
    cd $repo ;and emacsclient --eval '(magit-status)'
end

function eshell
    emacsclient --eval '(eshell)' --eval '(open-emacs-window)'
end

function info-in-emacs
    set node=$argv[1]
    emacsclient --eval "(shell/info \"$node\")" --eval '(open-emacs-window)'
end

function find-file
    set repo $argv[1]
    string length -q -- $file; or set file (pwd)
    emacsclient --eval "(find-file \"$file\")" --eval '(open-emacs-window)'
end
alias ff=find-file
alias dired=find-file

# Get token(password) from log file.
function get_jupyternotebook_token
    set -q $argv[1]; and set -l log_path ~/var/log/jupyter-notebook/jupyter-notebook.err.log;
    or set -l log_path argv[1]
    set -q $argv[2]; and set -l grepword http://localhost:8888/\?token;
    or set -l log_path argv[2]
    cat $log_path | grep $grepword | tail -n 1 | sed -e 's/.*=//'
end

function sample_default_value
    set -q $MY_PROGRAM_ROOT; and set program_root ~/.local/share/my_prorgram;or set program_root $MY_PROGRAM_ROOT

    echo $program_root #=> /Users/username/.local/share/my_prorgram
    set MY_PROGRAM_ROOT "root!"
    set -q $MY_PROGRAM_ROOT; and set program_root ~/.local/share/my_prorgram;or set program_root $MY_PROGRAM_ROOT
    echo $program_root #=> root!
end
