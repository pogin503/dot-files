function magit
  set repo $argv[1]
  string length -q -- $repo; or set repo (pwd)
  cd $repo ;and emacsclient --eval '(magit-status)'
end
