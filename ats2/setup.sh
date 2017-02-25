#!/bin/bash

if [ ! -d "$HOME"/atshome ]; then mkdir -p "$HOME"/atshome; fi

pushd "$HOME"/atshome

wget --trust-server-name 'http://downloads.sourceforge.net/project/ats2-lang/ats2-lang/ats2-postiats-0.2.1/ATS2-Postiats-0.2.1.tgz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fats2-lang%2Ffiles%2Fats2-lang%2Fats2-postiats-0.2.1%2F&ts=1437234613&use_mirror=jaist'
wget --trust-server-name 'http://downloads.sourceforge.net/project/ats2-lang-contrib/ats2-lang-contrib/ATS2-Postiats-contrib-0.1.12.tgz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fats2-lang-contrib%2Ffiles%2Fats2-lang-contrib%2F&ts=1437234808&use_mirror=jaist'

tar xf ATS2-Postiats-0.2.1.tgz
PATSHOME="$(pwd)"/ATS2-Postiats-0.2.1
export PATSHOME
export PATH=${PATSHOME}/bin:${PATH}
rm ATS2-Postiats-0.2.1.tgz

tar xf ATS2-Postiats-contrib-0.1.12.tgz
PATSHOMERELOC="$(pwd)"/ATS2-Postiats-contrib-0.1.12
export PATSHOMERELOC
rm ATS2-Postiats-contrib-0.1.12.tgz
pushd "${PATSHOME}"
./configure
make

echo 'Add to .bashrc or .zshrc'
echo '    export PATSHOME="$HOME"/atshome/ATS2-Postiats-0.2.1'
echo '    export PATH=${PATSHOME}/bin:${PATH}'
echo '    export PATSHOMERELOC="$HOME"/atshome/ATS2-Postiats-contrib-0.1.12'
echo 'example:'
echo '    touch hello.dats'
echo '    echo '\''implement main0 () = println! ("Hello world!")'\'' > hello.dats'
echo '    patscc -o hello hello.dats'
echo '    ./hello'
