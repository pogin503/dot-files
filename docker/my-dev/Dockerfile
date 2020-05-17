# syntax = docker/dockerfile:experimental
FROM ubuntu:18.04 as my-dev-base

RUN sed -i.bak -e "s%http://[^ ]\+%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y upgrade
RUN apt-get update && apt-get install -y git sudo

RUN apt-get update && apt-get install -y openssh-server
# RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# FOR Ansible
RUN apt-get update && apt-get -y install python3-dev

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
# RUN --mount=type=secret,id=ssh,target=/root/.ssh/id_rsa git clone git@github.com:pogin503/dot-files.git /root/dotfiles
# RUN --mount=type=ssh git clone git@github.com:pogin503/dot-files.git /root/dotfiles
RUN git clone https://github.com/pogin503/dot-files.git /root/dotfiles

RUN apt update && \
    apt install software-properties-common \
    apt-add-repository ppa:ansible/ansible \
    apt update \
    apt install ansible

ansible-galaxy install -r requirements.yml

RUN rm -rf /var/lib/apt/lists/*

FROM my-dev-base

WORKDIR /root/dotfiles
ansible-playbook -i hosts localhost.yml -v
exit 0

# EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]
