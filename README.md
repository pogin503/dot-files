# This is my dotfiles

# Description
my dotfiles

# Requirement
- Ansible
- Vagrant
- VirtualBox
- fish
- Python 3

# Usage

local setting (for macOS)

```
git clone https://github.com/pogin503/dot-files.git ~/dotfiles
cd ~/dotfiles
ansible-galaxy install -r requirements.yml
ansible-playbook -K -i hosts localhost.yml -v
```

Create guest machine (Ubuntu)

```
cd dotfiles
vagrant up
```

# Installation

for macOS

- [Installation — Ansible Documentation](http://docs.ansible.com/ansible/intro_installation.html)
- [fish shell](https://fishshell.com/)
- [pyenv/pyenv: Simple Python version management](https://github.com/pyenv/pyenv#installation)

for guest machine

- [Vagrant by HashiCorp](https://www.vagrantup.com/)
- [Oracle VM VirtualBox](https://www.virtualbox.org/)
