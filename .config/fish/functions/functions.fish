function sh_template
	touch $argv[1]
	echo "#!/usr/bin/env bash" >> $argv[1]
	echo "set -x" >> $argv[1]
	echo "set -u" >> $argv[1]
	echo "set -e" >> $argv[1]
  chmod 744 $argv[1]
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
    echo 'usage'
    echo '  $ ansible_check ./locahost.yml'
    echo '  $ ansible_check ./locahost.yml hosts'
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

# ============================
# emacs
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

function sample_default_value
    set -q $MY_PROGRAM_ROOT; and set program_root ~/.local/share/my_prorgram;or set program_root $MY_PROGRAM_ROOT

    echo $program_root #=> /Users/username/.local/share/my_prorgram
    set MY_PROGRAM_ROOT "root!"
    set -q $MY_PROGRAM_ROOT; and set program_root ~/.local/share/my_prorgram;or set program_root $MY_PROGRAM_ROOT
    echo $program_root #=> root!
end

# https://github.com/fish-shell/fish-shell/issues/296
function clear_dupe_var --description 'Remove duplicates from environment variable'
  if test (count $argv) = 1
    set -l newvar
    set -l count 0
    for v in $$argv
      if contains -- $v $newvar
        set count (math $count+1)
      else
        set newvar $newvar $v
      end
    end
    set $argv $newvar
    test $count -gt 0
    and echo Removed $count duplicates from $argv
  else
    for a in $argv
      varclear $a
    end
  end
end

function show_path
  echo $$argv[1] | tr " " "\n" | nl
end
