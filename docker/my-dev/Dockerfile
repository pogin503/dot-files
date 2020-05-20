# syntax=docker/dockerfile:experimental

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

RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan -t rsa -H github.com >> ~/.ssh/known_hosts
RUN --mount=type=secret,id=ssh,target=/root/.ssh/id_rsa git clone git@github.com:pogin503/dot-files.git /root/dotfiles

RUN apt-get update \
  && apt-get install -y software-properties-common  \
  && apt-add-repository -y ppa:ansible/ansible \
  && apt-get update \
  && apt-get install -y ansible

WORKDIR /root/dotfiles
RUN ansible-galaxy install -r requirements.yml

# install pyenv
RUN apt-get install -y libffi-dev libssl-dev zlib1g-dev liblzma-dev libbz2-dev libreadline-dev libsqlite3-dev
RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# RUN ansible-playbook -i hosts localhost.yml -v

RUN rm -rf /var/lib/apt/lists/*

# EXPOSE 22
# CMD ["/usr/sbin/sshd", "-D"]
