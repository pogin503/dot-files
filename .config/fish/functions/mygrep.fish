function mygrep
  set -l word $argv[1]
  rg -n $word | expand -t 4 | gawk -vword="$word" -F':' '{c="";for(i=3;i<=NF;i++) c=c $i" "; print word "\t" $1 "\t" $2 "\t" c}' | sed '${/^$/d;}'
end
