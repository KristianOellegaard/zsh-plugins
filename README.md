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
- Make a virtualenv with a different python version
    - ```venv 1.3 2.7``` and ```venv 1.3 3.3```
- Start working inside a virtualenv
    - ```work 1.2```
    - ```work 1.3``` (it automatically deactivates if inside another venv)
    - ```work 1.3 2.7```

Puts the virtualenv inside $PWD/.venv-1.2/ and $PWD/.venv-1.3/

- Install requirements.txt
    - ```req```


Django
------

- manage.py
    - ```dj```
    - E.g. ```dj runserver``` or ```dj shell```
    - Checks for manage.py, project/manage.py or bin/django (buildout)
- manage.py runserver
    - ```dr```
    - Checks for manage.py, project/manage.py or bin/django (buildout)


Install
=======

Symlink the directories into ~/.oh-my-zsh/custom/

E.g.: 
```bash
ln -s django ~/.oh-my-zsh/custom/plugins/django
ln -s virtualenv ~/.oh-my-zsh/custom/plugins/virtualenv
```


