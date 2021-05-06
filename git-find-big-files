#!/bin/bash
# This code is to find on :
# https://gist.github.com/masbicudo/c87600d08ba32903b0e0863efd0966a8
#
# This code is based on the awesome answer by @torek from StackOverflow:
# https://stackoverflow.com/a/41626019/195417
# I have only made a shell for his code, added some options, added some colors
# and voilà!
#
# This script can be used to find large files inside a git repository
# and it's whole history. It will list files larger than a given threshold,
# and display these files in a colored human readable way.
#
# usage examples:
# - find files larger than 10MB:
#      ./git-find-big-files-in-hist.sh -sz 10MB
# - show one file per line:
#      ./git-find-big-files-in-hist.sh -sz 10kb -sl

BIG=100KB # 100KB file

dkgray=[90m;red=[91m;green=[92m;yellow=[93m;blue=[94m;magenta=[95m
cyan=[96m;white=[97m;black=[30m;dkred=[31m;dkgreen=[32m;dkyellow=[33m
dkblue=[34m;dkmagenta=[35m;dkcyan=[36m;gray=[37m;cdef=[0m

while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
    -sl|--single-line) SINGLE_LINE=TRUE; shift;;
    -sz|--size)        BIG=$2;    shift; shift;;
    *)                                   shift;;
  esac
done

if [[ "$BIG" =~ ^[0-9]+[KMGTEkmgte][Bb]$ ]]; then
  LETTER=$(echo $BIG | sed -r 's ^[0-9]+([KMGTE])B$ \1 gI')
  BIG=$(echo $BIG | sed -r 's ^([0-9]+)[KMGTE]B$ \1 gI')
  if [ ${LETTER^^} = "K" ]; then let "BIG=$BIG*1024"; fi
  if [ ${LETTER^^} = "M" ]; then let "BIG=$BIG*1024000"; fi
  if [ ${LETTER^^} = "G" ]; then let "BIG=$BIG*1024000000"; fi
  if [ ${LETTER^^} = "T" ]; then let "BIG=$BIG*1024000000000"; fi
  if [ ${LETTER^^} = "E" ]; then let "BIG=$BIG*1024000000000000"; fi
fi

git log --pretty="%H %s" --topo-order | while read -r commithash message; do
  git diff-tree -r --name-only --diff-filter=AMT $commithash |
    tail -n +2 | (_iter=0; while read path; do
      #echo $(dirname "$path")/$(basename "$path")
      objsize=$(git cat-file -s "$commithash:$path")
      
      [ $objsize -lt $BIG ] && continue
      if [ -z $SINGLE_LINE ]; then
        [ $_iter -eq 0 ] && echo -e "\n"$blue"$commithash"$cdef"\n"$red"$message"$cdef
        echo $dkgray$(dirname "$path")$cdef"/"$white$(basename "$path")" "$yellow"$objsize"$cdef
      else
        [ $_iter -eq 0 ] && _color="$blue" || _color="$dkgray"
        echo $_color"$commithash"$cdef"/"$green$(dirname "$path")$cdef"/"$white$(basename "$path")" "$yellow"$objsize"$cdef
      fi
      let "_iter++"
    done)
done
