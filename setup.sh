#!/bin/bash
bash -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
ln -sf .bash/.bashrc ~/.bashrc
ln -sf .bash/.bash_logout ~/.bash_logout
ln -sf .bash/.bash_history ~/.bash_history
ln -sf .bash/.profile ~/.profile
source ~/.bashrc

