#!/bin/bash

# must be run as root
apt-get install -y git screen at vim openssh-server gcc clang htop valgrind nmap texlive gzip wireshark cpp 
emacs expect krb5-kdc krb5-locales zsh
cp ./.vimrc ~/.vimrc
# set up prettyvim

# add alias functions to .bashrc
