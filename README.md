git bulk
========

Uses .poject.gws file for gws to launch bulk command for many git folder. 
It doesn't require GWS to be installed, works on any bash (including windows git bash).

I did it becase I needed a simple tool working on windows, but it can run on linux in conjonction with GWS

Usage
=====
Command list: 
 - bulk: shell command for every projects 
 - git clonebulk: clone all projects of .project.gws
 - git bulk: git command on every projects 

Use it at your project root.


examples
--------

    # init all projects
    git clonebulk

    # fetch all projects
    git bulk fetch

    # merge all projects 
    git bulk merge origin/master --ff

    # count lines of all projects (requires cloc)
    bulk cloc >> projects.cloc

Tutorial
========
(Todo)

Evolutions
==========
scan API of github, gitlab, bitbucket, ssh to list projects


