function dj() {
	if [ -f bin/django ]; then
		bin/django $* # Buildout
	elif [ -f src/manage.py ]; then
		python src/manage.py # src/ folder
	elif [ -f project/manage.py ]; then
		python project/manage.py $* # django default
	elif [ -f manage.py ]; then
		python manage.py $* # plain
	else
		echo "dj: $fg[red]Error:$reset_color Could not find manage.py or buildout"
	fi
}

alias dr='dj runserver'

function rt() {
	if [ -f runtests.sh ]; then
		./runtests.sh $*
	elif [ -f runtests.py ]; then
		python runtests.py $*
	elif [ -f scripts/runtests.sh ]; then
		./scripts/runtests.sh $*
	else
		echo "dj: $fg[red]Error:$reset_color Could not find runtests.sh or runtests.py"
	fi
}

function req() {
	if [ -f requirements.txt ]; then
		pip install -r requirements.txt
	elif [ -f setup.py ]; then
		python setup.py develop
	else
		echo "dj: $fg[red]Error:$reset_color Could not find requirements.txt or setup.py"
	fi
}

alias bs="venv && work && req"
