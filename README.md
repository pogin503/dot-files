# This is my dotfiles

# Description
my dotfiles

# Requirement
- Ansible
- fish
- Python 3

# Usage

```
git clone https://github.com/pogin503/dot-files.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

local setting

```
echo "ansible_become_pass: password" > hosts/group_vars/local_group/vault
ansible-vault encrypt hosts/group_vars/local_group/vault
```

Ubuntu

```
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt update
$ sudo apt install ansible
```

Execute ansible playbook.

```
ansible-galaxy install -r requirements.yml
ansible-playbook -K -i hosts/hosts localhost.yml -v
```

Create container

```
cd dotfiles/docker/my-dev
docker-compose u -d
```

# Installation

for macOS

- [Installation — Ansible Documentation](http://docs.ansible.com/ansible/intro_installation.html)
- [fish shell](https://fishshell.com/)
- [pyenv/pyenv: Simple Python version management](https://github.com/pyenv/pyenv#installation)

for docker

- [Docker](https://www.docker.com/)
