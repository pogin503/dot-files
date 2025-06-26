# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a comprehensive dotfiles repository for setting up a development environment across macOS and Linux systems. It uses Ansible for automation and includes configurations for shells (bash, zsh, fish), development tools, programming languages, and various utilities.

## Key Architecture Components

### Ansible Structure
- **Main playbook**: `bootstrap.yml` (not `localhost.yml` as mentioned in README - this appears outdated)
- **Inventory**: `hosts/hosts` - defines local_group with macOS, ubuntu, and local targets
- **Custom collection**: `collections/pogin503/dev/` with reusable roles
- **External dependencies**: Managed via `requirements.yml`

### Configuration Management
- **Shell setup**: Symlinks dotfiles using `setup.sh` script
- **Environment variables**: Defined in `etc/env.sh`
- **XDG compliance**: Uses `XDG_CONFIG_HOME`, `XDG_CACHE_HOME`, `XDG_DATA_HOME`

### Development Tools Roles
The custom Ansible collection includes roles for:
- Common utilities (alloy, docker, fish, gnu-global)
- Programming languages (python, js, haskell, scala, ruby, powershell)
- Development tools (emacs, lazygit, lazydocker)

## Common Commands

### Initial Setup
```bash
# Clone and basic setup
git clone https://github.com/pogin503/dot-files.git ~/dotfiles
cd ~/dotfiles
./setup.sh

# Install external Ansible dependencies
ansible-galaxy install -r requirements.yml

# Run main Ansible playbook (use bootstrap.yml, not localhost.yml)
ansible-playbook -K -i hosts/hosts bootstrap.yml -v
```

### Development Workflows
```bash
# Test specific Ansible roles
./bin/test_collection.sh

# Docker development environment
cd docker/my-dev
docker-compose up -d

# JupyterLab environment
cd docker/jupyterlab
docker-compose up -d
```

### Ansible Collection Development
```bash
# Test collection roles individually
ansible-playbook test_playbook.yml

# Collection is located in collections/pogin503/dev/
# Use molecule for testing roles (molecule directories exist)
```

## Configuration Files Structure

### Core Dotfiles
- Shell configs: `.bashrc`, `.zshrc`, `.config/fish/config.fish`
- Editor: `.vimrc`, custom Emacs configuration via Ansible
- Development: `.textlintrc`, `.rubocop.yml`, `.ansible.cfg`
- Git: `.config/git/` with templates and global gitignore

### Ansible Vault
Sensitive data (like sudo passwords) should be stored in:
```bash
echo "ansible_become_pass: password" > hosts/group_vars/local_group/vault
ansible-vault encrypt hosts/group_vars/local_group/vault
```

## Platform-Specific Notes

### macOS
- Uses Homebrew (prefix and cellar auto-detected)
- Repository location: `/Volumes/ext_SSD/repo` (external SSD)

### Ubuntu/Linux
- APT package management
- Systemd support enabled
- WSL2 compatible (based on kernel version in environment)

## Docker Environments

### Development Container (`docker/my-dev/`)
Full development environment with tools and languages pre-installed.

### JupyterLab (`docker/jupyterlab/`)
Data science and notebook environment.

### WebAssembly (`docker/webassembly/`)
Environment for WebAssembly development.

## Important Notes

- The README references `localhost.yml` but the actual main playbook is `bootstrap.yml`
- Git configuration includes personal email (pogin503@gmail.com) - update as needed
- Collection roles support both macOS and Ubuntu with platform-specific tasks
- XDG Base Directory specification is followed for configuration files