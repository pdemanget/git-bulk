git bulk
========

Uses .poject.gws file for gws to launch bulk command for many git folder. 
It doesn't require GWS to be installed, works on any bash (including windows git bash).

I did it becase I needed a simple tool working on windows, but it can run on linux in conjonction with GWS

Usage
=====
Command list: 
 - bulk: shell command for every projects 
 - git bulk command: git command on every projects 

special commands:
 - git bulk clone: clone all the project of the gws (no check, will fail if exists)
 - git bulk update: update the list according to the folders, if not already in the file. maintain a sorted file.

Use it at your project root.


examples
--------

    # init all projects
    git clonebulk

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


