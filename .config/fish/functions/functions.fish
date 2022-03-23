# function kill_process
#   set pid (pgrep $argv[1])
#   if not (-z $pid "")
#     # kill -9 $pid
#     echo 11
#   else
#     echo 22
#   end
# end

function homestead
    pushd ~/Homestead ;and vagrant $argv[1..-1]
    popd
end

# ============================
# emacs
function info-in-emacs
    set node=$argv[1]
    emacsclient --eval "(shell/info \"$node\")" --eval '(open-emacs-window)'
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
