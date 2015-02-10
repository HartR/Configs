#!/bin/bash
git add -u
git status
echo "Write commit message and press [ENTER]:"
read commitmessage
git commit -m "$commitmessage"
git push 
