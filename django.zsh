
function dj() {
	if [ -f bin/django ]; then
		bin/django $*
	elif [ -f project/manage.py ]; then
		python project/manage.py $*
	elif [ -f manage.py ]; then
		python manage.py $*
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
	else
		echo "dj: $fg[red]Error:$reset_color Could not find runtests.sh or runtests.py"
	fi
}

alias req="pip install -r requirements.txt"
alias bs="venv && work && req"