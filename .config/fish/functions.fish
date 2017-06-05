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

function kill_process
  kill -9 (pgrep $argv[1])
end
