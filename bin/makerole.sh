#!/usr/bin/env bash

set -eu

for OPT in "$@"
do
  case "$OPT" in
    # '-d'|'--dest' )
    #   shift 1
    #   DIR="$@"
    #   ;;
    *)
      DIR=$(pwd)
  esac
done

if [ $# -lt 1 ]; then
  cat <<EOF
usage:
    ./makerole.sh <role-name>
EOF
fi

ansible-galaxy init --init-path "$DIR"/roles/ "$1"

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

# テスト用のタスクを定義する
# tests/main.yml
cat > "$DIR"/roles/"$1"/tests/test.yml <<EOF
---
- hosts: localhost
  # remote_user: root
  roles:
    - $1
EOF

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

rm "$DIR"/roles/"$1"/README.md
ROLE_NAME=$1
ROLE_SEPARATOR=$(ruby -e "puts '='*${#ROLE_NAME}")

cat > "$DIR"/roles/"$1"/README.md <<EOF
$1
${ROLE_SEPARATOR}

Requirements
------------

Role Variables
--------------

Example Playbook
----------------

\`\`\`
    - hosts: servers
      roles:
         - { role: username.$1, x: 42 }
\`\`\`

\`\`\`
ansible-playbook -i $1/tests/inventory $1/tests/test.yml
\`\`\`

Usage
-----

License
-------

BSD

EOF

cat > "$DIR"/roles/"$1"/meta/main.yml <<EOF
galaxy_info:
  author: pogin503
  description: pogin503
  # company: your company (optional)

  # If the issue tracker for your role is not on github, uncomment the
  # next line and provide a value
  # issue_tracker_url: http://example.com/issue/tracker

  # Some suggested licenses:
  # - BSD (default)
  # - MIT
  # - GPLv2
  # - GPLv3
  # - Apache
  # - CC-BY
  license: BSD (GPLv2, CC-BY, etc)

  min_ansible_version: 2.0

  # If this a Container Enabled role, provide the minimum Ansible Container version.
  # min_ansible_container_version:

  # Optionally specify the branch Galaxy will use when accessing the GitHub
  # repo for this role. During role install, if no tags are available,
  # Galaxy will use this branch. During import Galaxy will access files on
  # this branch. If Travis integration is configured, only notifications for this
  # branch will be accepted. Otherwise, in all cases, the repo's default branch
  # (usually master) will be used.
  #github_branch:

  #
  # platforms is a list of platforms, and each platform has a name and a list of versions.
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
