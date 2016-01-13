#!/bin/bash
# Checks if you already have a .vimrc file in your home directory
# If you do, it asks for permission to delete it then symlink new .vimrc
# If not, symlinks new .vimrc to home folder
if [ -e ~/.vimrc ]
then
    read -p ".vimrc already exists. Delete and continue? [y/n] " -n 1 -r
    echo    
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.vimrc
        ln -s ~/LinuxConfig/vim/.vimrc ~/.vimrc
    fi
else 
    ln -s /home/$USER/LinuxConfig/vim/.vimrc /home/$USER/.vimrc
fi
