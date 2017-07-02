# This is my dotfiles

# Description
my dotfiles

# Requirement
- Ansible
- Vagrant
- VirtualBox
- fish

# Usage

local setting

```
git clone git@github.com:pogin503/dot-files.git ~/dotfiles
cd ~/dotfiles
ansible-galaxy install -r requirements.yml
ansible-playbook -i hosts localhost.yml
```

Create guest machine (Ubuntu)

```
vagrant up
```

# Installation

- [Installation — Ansible Documentation](http://docs.ansible.com/ansible/intro_installation.html)
- [Vagrant by HashiCorp](https://www.vagrantup.com/)
- [Oracle VM VirtualBox](https://www.virtualbox.org/)
- [fish shell](https://fishshell.com/)
