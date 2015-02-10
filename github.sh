#!/bin/bash
git add -A
echo "Write commit message and press [ENTER]:"
read commitmessage
git commit -m "$commitmessage"
git push -u origin master
