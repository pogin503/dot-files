#!/usr/bin/env fish

function readme_template
  set -l usage "usage:
    \$ readme_template
    \$ readme_template -f <path>\n"

  argparse -n readme_template 'v/version' 'f/filepath=' 'h/help' -- $argv
  or return 1

  if set -lq _flag_help
    printf $usage
    return
  end

  if set -lq _flag_version
    echo "readme_template, version 0.0.1"
    return
  end

  set -l filepath
  set -l app_name
  if set -lq _flag_filepath
    set filepath (realpath "$_flag_filepath/README.md")
    set app_name (basename (realpath $_flag_filepath))
  else
    set filepath (realpath ./README.md)
    set app_name (basename (dirname $filepath))
  end

  if [ -f $filepath ]
    if not _read_confirm
      return
    end
  end

  set template "\


# Features



# Description



# Requirement



# Usage



# Installation



# License

MIT
"
  echo $app_name > $filepath
  set -l len (string length $app_name)
  ruby -e "$len.times {|i| print '=' }; puts " >> $filepath
  printf $template | cat >> $filepath

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
