#!/usr/bin/env bash

# need
# nano ~/.ansible/.vault_password
# ansible-vault encrypt ~/dotfiles/group_vars/all
# echo "ANSIBLE_VAULT_PASSWORD_FILE=~/.ansible/.vault_password" ~/.ansible.cfg

ansible_check () {
  # usage
  # $ ansible_check localhost.yml
  ansible-playbook --syntax-check "$1"
  ansible-playbook --check "$1" --vault-password-file ~/.ansible/.vault_password
  ansible-lint "$1" || true
}

reload_tmux_conf () {
  tmux source-file ~/.tmux.conf; tmux display-message "reload"
}
