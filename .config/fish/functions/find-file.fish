function find-file
  set repo $argv[1]
  string length -q -- $file; or set file (pwd)
  emacsclient --eval "(find-file \"$file\")" --eval '(open-emacs-window)'
end
