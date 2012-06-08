What is this?
=============

A collection of some of my personal ZSH scripts, to make my life easier.


Virtualenv
----------

- Make a virtualenv:
    - ```venv```
- Start working inside a virtualenv
    - ```work```

Puts the virtualenv in $PWD/.venv/

- Make a virtualenv for two different versions of a software, in the same module
    - ```venv 1.2```
    - ```venv 1.3```
- Start working inside a virtualenv
    - ```work 1.2```
    - ```work 1.3``` (it automatically deactivates if inside another venv)

Puts the virtualenv inside $PWD/.venv-1.2/ and $PWD/.venv-1.3/
