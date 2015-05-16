#!/bin/sh

if [ $# -eq 0 ]
  then
    echo "Add a commit message"
    return 1
fi

git add .
git commit -m "$1"
git push origin master

be nanoc

cd output
git add .
git commit -m "$1"
git push origin gh-pages
cd ..
