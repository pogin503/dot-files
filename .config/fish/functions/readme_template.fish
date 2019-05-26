#!/usr/bin/env fish

function readme_template
  if [ (count $argv) = 0 ]
    printf "usage:
    \$ readme_template <app_name>\n"
    return
  else
    if [ f README.md ];
      if not _read_confirm
        return
      end
    end
    printf "$argv[1]\n" > README.md
    set len (string length $argv[1])
    ruby e "$len.times {|i| print '=' }; puts " >> README.md
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

function _read_confirm
  while true
    read l p _read_confirm_prompt confirm

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
