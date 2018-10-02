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


# Roleの依存関係を記述するファイル
# meta/main.yml

touch "$DIR"/roles/"$1"/README.md
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
         - { role: username.rolename, x: 42 }
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

