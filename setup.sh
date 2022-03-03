#!/usr/bin/env bash

sudo apt-get install screen

wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
  -O /home/gitpod/.git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
  -O /home/gitpod/.git-prompt.bash

echo 'source /home/gitpod/.dotfiles/.bashrc' > /home/gitpod/.bashrc

ln -s /home/gitpod/.dotfiles/.vimrc /home/gitpod/
ln -s /home/gitpod/.dotfiles/.vim /home/gitpod/
vim -es -u /home/gitpod/.vimrc -i NONE -c "PlugUpgrade" -c "PlugInstall" -c "qa"

ln -s /home/gitpod/.dotfiles/.screenrc /home/gitpod/

ln -s /home/gitpod/.dotfiles/.inputrc /home/gitpod/
