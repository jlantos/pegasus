#!/bin/bash

HIVE_VER=1.2.0

if [ ! -f ~/Downloads/apache-hive-$HIVE_VER-bin.tar.gz ]; then
  wget http://apache.mesi.com.ar/hive/stable/apache-hive-$HIVE_VER-bin.tar.gz -P ~/Downloads

  sudo tar zxvf ~/Downloads/apache-hive-*.tar.gz -C /usr/local
  sudo mv /usr/local/apache-hive-* /usr/local/hive
  sudo mv /usr/local/hadoop/share/hadoop/yarn/lib/jline-* /usr/local/hadoop/share/hadoop/yarn/lib/jline.backup
fi

if ! grep "export HIVE_HOME" ~/.profile; then
  echo -e "\nexport HIVE_HOME=/usr/local/hive\nexport PATH=\$PATH:\$HIVE_HOME/bin\n" | cat >> ~/.profile

  . ~/.profile
fi
