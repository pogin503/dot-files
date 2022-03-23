function sh_template
	touch $argv[1]
	echo "#!/usr/bin/env bash" >> $argv[1]
	echo "set -x" >> $argv[1]
	echo "set -u" >> $argv[1]
	echo "set -e" >> $argv[1]
  chmod 744 $argv[1]
end
