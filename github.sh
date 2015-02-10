#!/bin/bash
echo "Write commit message and press [ENTER]:"
read commitmessage
git commit -am "$commitmessage"
git push -u origin master
