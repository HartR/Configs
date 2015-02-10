#!/bin/bash
# Checks if you already have a .vimrc file in your home directory
# If you do, it asks for permission to delete it then symlink new .vimrc
# If not, symlinks new .vimrc to home folder
if [ -e /home/$USER/.vimrc ]
then
    read -p ".vimrc already exists. Delete and continue? [y/n] " -n 1 -r
    echo    
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm /home/$USER/.vimrc
        ln -s /home/$USER/LinuxConfig/vim/.vimrc /home/$USER/.vimrc
    fi
else 
    ln -s /home/$USER/LinuxConfig/vim/.vimrc /home/$USER/.vimrc
fi

# Checkout necessary plugins
# TODO: check whether these directories already exist
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
