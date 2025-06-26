#!/bin/bash

# エラーハンドリング
set -e

# Ansibleがインストールされているか確認し、インストールされていなければインストールする
if ! command -v ansible >/dev/null 2>&1; then
    echo "Ansibleがインストールされていません。インストールを開始します。"
    sudo apt update
    sudo apt install -y ansible
fi

# コレクションのインストール
# ansible-galaxy collection install pogin503.dev

# プレイブックファイルの作成
PLAYBOOK_FILE="test_playbook.yml"

cat <<EOF > "$PLAYBOOK_FILE"
- name: Execute role from pogin503.dev collection on localhost
  hosts: localhost
  gather_facts: false
  roles:
    - pogin503.dev.lazygit
EOF

# Ansibleプレイブックを実行
ansible-playbook "$PLAYBOOK_FILE"

echo "ロールの実行が完了しました。"
