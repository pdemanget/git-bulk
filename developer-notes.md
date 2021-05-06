DEVELOPER NOTES
========


If you don't understand anything here, it's perfectly normal.

DIRTY command notes
--------------------
###research 
Use various shell from internet, SO ..

# Get number of files added to the index (but uncommitted)
expr $(git status --porcelain 2>/dev/null| grep "^M" | wc -l)

# Get number of files that are uncommitted and not added
expr $(git status --porcelain 2>/dev/null| grep "^ M" | wc -l)

# Get number of total uncommited files
expr $(git status --porcelain 2>/dev/null| egrep "^(M| M)" | wc -l)


Analyze the result of git status --porcelain

M  README.md
A  a
 M git-bulk
D  git-clonebulk
 D git-find-big-files-in-hist.sh
?? git-bulk-clone
?? git-bulk-help
?? git-bulk-init
?? git-bulk-update
?? git-find-big-files

### another reseach with plumbing commands:
git diff-files --quiet
git diff-index --quiet --cached HEAD --
echo $?

git diff-index --quiet HEAD --
echo $?

https://stackoverflow.com/questions/2657935/checking-for-a-dirty-index-or-untracked-files-with-git



CONSOLE COLOR
--------------
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"


shell Installer
---------------
this:

wget -O - https://raw.githubusercontent.com/pdemanget/git-bulk/master/README.md 2> /dev/null

curl https://raw.githubusercontent.com/pdemanget/git-bulk/master/git-bulk-install.sh | bash


