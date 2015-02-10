#!/bin/bash
# Checks if you already have a .bashrc file in your home directory
# If you do, it asks for permission to delete it then symlink new .bashrc
# If not, symlinks new .bashrc to home folder
if [ -e /home/$USER/.bashrc ]
then
    read -p ".bashrc already exists. Delete and continue? [y/n] " -n 1 -r
    echo    
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm /home/$USER/.bashrc
        ln -s /home/$USER/LinuxConfig/bash/.bashrc /home/$USER/.bashrc
    fi
else 
    ln -s /home/$USER/LinuxConfig/bash/.bashrc /home/$USER/.bashrc
fi

