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
