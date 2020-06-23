#!/usr/bin/env bash

PROGNAME=$(basename "$0")
usage() {
  cat <<HELP
Wrapper script for ansible-playbook to apply single role.

Usage: ./bin/$PROGNAME <host-pattern> <role-name> [ansible-playbook options]

Examples:
  ./bin/$PROGNAME dest_host my_role
  ./bin/$PROGNAME custom_host my_role -i 'custom_host,' -vv --check
HELP
  exit
}
if [[ $# -lt 2 ]]; then
  usage
fi

HOST_PATTERN=$1
shift
ROLE=$1
shift

echo "Trying to apply role \"$ROLE\" to host/group \"$HOST_PATTERN\"..."
ANSIBLE_ROLES_PATH="$(pwd)/roles:$HOME/.ansible/roles"
ANSIBLE_CONFIG="$HOME"/.ansible.cfg
export ANSIBLE_ROLES_PATH
export ANSIBLE_CONFIG
echo "${ANSIBLE_ROLES_PATH}"
export ANSIBLE_RETRY_FILES_ENABLED="False"
# connection: localhost
# gather_facts: False
YAML_DATA=$(cat << END
---
- hosts: $HOST_PATTERN
  pre_tasks:
    - debug: msg={{ ansible_env.PWD }}
  roles:
    - $ROLE
END
            )
echo $YAML_DATA
ansible-playbook "$@" /dev/stdin <<END
$YAML_DATA
END

# @see https://stackoverflow.com/questions/38350674/ansible-can-i-execute-role-from-command-line
