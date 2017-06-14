#!/usr/bin/env bash

set -eu

if [ $# -lt 1 ]; then
    cat <<EOF
usage:
    ./makerole.sh <role-name>
EOF
fi

# make role directory
mkdir -p ./roles/"$1"/tasks
mkdir -p ./roles/"$1"/defaults
mkdir -p ./roles/"$1"/vars
# mkdir -p ./roles/"$1"/files
mkdir -p ./roles/"$1"/templates
mkdir -p ./roles/"$1"/tests
mkdir -p ./roles/"$1"/handlers
# mkdir -p ./roles/"$1"/meta

# 実行するタスクを定義する
touch ./roles/"$1"/tasks/main.yml
printf -- "---\n" > ./roles/"$1"/tasks/main.yml

# Role内で使う「外から書き換えるつもり」の変数のデフォルト値を設定する 
touch ./roles/"$1"/defaults/main.yml
printf -- "---\n" > ./roles/"$1"/defaults/main.yml

# Role内で使う「外から書き換えるつもりの***ない***」の変数のデフォルト値を設定する 
touch ./roles/"$1"/vars/main.yml
printf -- "---\n" > ./roles/"$1"/vars/main.yml

# copyモジュールでリモートに配置するファイルを置くディレクトリ
# touch ./roles/"$1"/files/file.j2
# printf -- "---\n" >> ./roles/"$1"/templates/main.yml

# templateモジュールでリモートに展開するJinja2テンプレートを置くディレクトリ
touch ./roles/"$1"/templates/file.j2
printf -- "---\n" > ./roles/"$1"/templates/main.yml

# ハンドラーを定義する
touch ./roles/"$1"/handlers/main.yml
printf -- "---\n" > ./roles/"$1"/handlers/main.yml

# テスト用のタスクを定義する
touch ./roles/"$1"/tests/main.yml
printf "localhost" > ./roles/"$1"/tests/inventory
cat > ./roles/"$1"/tests/test.yml <<EOF
---
- hosts: localhost
  # remote_user: root
  roles:
    - $1
EOF


# Roleの依存関係を記述するファイル
# touch ./roles/"$1"/meta/main.yml
# printf "---\n" >> ./roles/"$1"/meta/main.yml

touch ./roles/"$1"/README.md
cat > ./roles/"$1"/README.md <<EOF
$1 doc

# Usage

ansible-playbook -i $1/tests/inventory $1/tests/test.yml

EOF
