#!/usr/bin/env bash

set -eu

usage() {
  cat <<EOF
usage:
    ./makerole.sh <role-name>
EOF
  exit
}

for OPT in "$@"
do
  case "$OPT" in
    # '-d'|'--dest' )
    #   shift 1
    #   DIR="$@"
    #   ;;
    h|help)
      usage
      ;;
    *)
      DIR=$(pwd)
  esac
done

if [ $# -lt 1 ]; then
  usage
fi

if [ ! -d "$DIR"/roles/ ]; then
  mkdir "$DIR"/roles/
fi

pushd "$DIR/roles" > /dev/null
# ansible-galaxy init --init-path "$DIR"/roles/ "$1"
molecule init role "$1"
popd

# 実行するタスクを定義する
# tasks/main.yml
# Role内で使う「外から書き換えるつもり」の変数のデフォルト値を設定する
# defaults/main.yml
# Role内で使う「外から書き換えるつもりの***ない***」の変数のデフォルト値を設定する
# vars/main.yml
# copyモジュールでリモートに配置するファイルを置くディレクトリ
# files/file.j2
# templateモジュールでリモートに展開するJinja2テンプレートを置くディレクトリ
# templates/file.j2
# ハンドラーを定義する
# handlers/main.yml

# tests/inventory
# cat > "$DIR"/roles/"$1"/tests/inventory <<EOF
# ---
# all:
#   hosts:
#     localhost:
#       ansible_connection: local
# EOF


# テスト用のタスクを定義する
# tests/main.yml
# cat > "$DIR"/roles/"$1"/tests/test.yml <<EOF
# ---
# - hosts: localhost
#   # remote_user: root
#   connection: local
#   roles:
#     - $1
# EOF

cat > "$DIR"/roles/"$1"/tasks/main.yml <<EOF
---
# tasks file for $1

- import_tasks: macOS.yml
  when: ansible_facts['os_family'] == 'Darwin'

- import_tasks: ubuntu.yml
  when: ansible_facts['distribution'] == 'Ubuntu'
EOF

cat > "$DIR"/roles/"$1"/tasks/macOS.yml <<EOF
---
EOF
cat > "$DIR"/roles/"$1"/tasks/ubuntu.yml <<EOF
---
EOF


# Roleの依存関係を記述するファイル
# meta/main.yml

# rm "$DIR"/roles/"$1"/README.md
# ROLE_NAME=$1
# ROLE_SEPARATOR=$(ruby -e "puts '='*${#ROLE_NAME}")

# cat > "$DIR"/roles/"$1"/README.md <<EOF
# $1
# ${ROLE_SEPARATOR}

# Requirements
# ------------

# Role Variables
# --------------

# Example Playbook
# ----------------

# \`\`\`
#     - hosts: servers
#       roles:
#          - { role: username.$1, x: 42 }
# \`\`\`

# \`\`\`
# ansible-playbook -i $1/tests/inventory $1/tests/test.yml
# \`\`\`

# Usage
# -----

# License
# -------

# MIT
# EOF

cat > "$DIR"/roles/"$1"/meta/main.yml <<EOF
galaxy_info:
  author: pogin503
  description: your role description
  # company: your company (optional)

  # If the issue tracker for your role is not on github, uncomment the
  # next line and provide a value
  # issue_tracker_url: http://example.com/issue/tracker

  # Choose a valid license ID from https://spdx.org - some suggested licenses:
  # - BSD-3-Clause (default)
  # - MIT
  # - GPL-2.0-or-later
  # - GPL-3.0-only
  # - Apache-2.0
  # - CC-BY-4.0
  license: license (GPL-2.0-or-later, MIT, etc)

  min_ansible_version: 2.9

  # If this a Container Enabled role, provide the minimum Ansible Container version.
  # min_ansible_container_version:

  #
  # Provide a list of supported platforms, and for each platform a list of versions.
  # If you don't wish to enumerate all versions for a particular platform, use 'all'.
  # To view available platforms and versions (or releases), visit:
  # https://galaxy.ansible.com/api/v1/platforms/
  #
  # platforms:
  # - name: Fedora
  #   versions:
  #   - all
  #   - 25
  # - name: SomePlatform
  #   versions:
  #   - all
  #   - 1.0
  #   - 7
  #   - 99.99

  galaxy_tags: []
    # List tags for your role here, one per line. A tag is a keyword that describes
    # and categorizes the role. Users find roles by searching for tags. Be sure to
    # remove the '[]' above, if you add tags to this list.
    #
    # NOTE: A tag is limited to a single word comprised of alphanumeric characters.
    #       Maximum 20 tags per role.

dependencies: []
  # List your role dependencies here, one per line. Be sure to remove the '[]' above,
  # if you add dependencies to this list.
  # example:
  #   dependencies:
  #     - { role: mysql/client }
  #     - { role: lxc/redhat, when: "ansible_os_family == 'RedHat'" }
  #     - { role: lxc/debian, when: "ansible_os_family == 'Debian'" }
  #     - { role: common, some_parameter: 3 }
  #     - { role: apache, apache_port: 80 }
  #     - { role: postgres, dbname: blarg, other_parameter: 12 }
  #     - src: geerlingguy.docker
  #     - src: git+https://github.com/geerlingguy/ansible-role-composer.git
  #       version: 775396299f2da1f519f0d8885022ca2d6ee80ee8
  #       name: composer
EOF
