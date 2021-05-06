#!/bin/bash
# git-bulk-install.sh 

curl -LOJ https://codeload.github.com/pdemanget/git-bulk/zip/refs/tags/0.0.2
mkdir -p ~/.local/bin
unzip -q git-bulk-0.0.2.zip -d ~/.local/bin
mv ~/.local/bin/git-bulk-0.0.2/* ~/.local/bin
rm ~/.local/bin/git-bulk-0.0.2/.gitignore
rmdir ~/.local/bin/git-bulk-0.0.2
echo "export PATH=$PATH:~/.local/bin" >> ~/.bashrc
rm git-bulk-0.0.2.zip
