git bulk
========

Uses .project.gws file for gws to launch bulk command for many git folder. 
It doesn't require GWS to be installed, works on any bash (including windows git bash).

I did it because I needed a simple tool working on linux/windows, but it can run in conjonction with GWS

Installation
============
Download, unzip, and add files in your path:

Check the file before running it:
<https://raw.githubusercontent.com/pdemanget/git-bulk/master/git-bulk-install.sh>
then run it
    curl https://raw.githubusercontent.com/pdemanget/git-bulk/master/git-bulk-install.sh | bash

Usage
=====
usage: git bulk [git command| git bulk command]
note: This script reuse the configuration file from streakyCobra gws.

A ".projects.gws" file should be present in the parent of your git-root directories.

The file format is as follow:
	projectName | git@gitrepo:projectName.git
	projectName2 | git@gitrepo:projectName2.git
	
The your directory should be like that:
git-root-parent/
  .projects.gws
  projectName/
	.git/
  projectName1/
    .git/
    
    
to initialize the configuration file if none:
git bulk init
git bulk update    

Examples with standard git commands
------------------------------------
git bulk fetch : fetch all directories
git bulk merge --ff : merge remote branch if possible


Specific commands:
------------------
git bulk clone: clone every project of .projects , if possible
git bulk init: intialize the configuration file
git bulk update: modify .projects with all directories
git bulk help: ... display this help
git bulk dirty: one-liner to tell in color which projects are dirty
git bulk find-big-files -sz 1kb -sl     : find all files > 1kb

"bulk" command
--------------
execute sh command in all directories:

$ bulk mvn install



examples
--------

    # init all projects
    git bulk clone

    # or create the configuration file for an epxort on another host
    git bulk init
    git bulk update


    # fetch all projects
    git bulk fetch

    # merge all fetched project without conflict
    git bulk merge --ff

    # merge all master 
    git bulk fetch origin master:master

    # works with alias 
    git bulk youralias

    # count lines of all projects (requires cloc)
    bulk cloc >> projects.cloc

Tutorial
========
(Todo)

Evolutions
==========
scan API of github, gitlab, bitbucket, ssh to list projects


