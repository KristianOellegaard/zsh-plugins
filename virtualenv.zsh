
function _work() {
	reply=(`find . -maxdepth 1 -type d -name ".venv-*" | sed 's/\.\/\.venv\-//g'`)
}


function work() {
	if [ $VIRTUAL_ENV ]; then
		deactivate
	fi
	if [ -f bin/activate ]; then
		source bin/activate
	elif [ -f .venv/bin/activate ]; then
		source .venv/bin/activate
	elif [ ! -z $1 ]; then
		source .venv-$1/bin/activate
	else
		echo "work: $fg[red]Error:$reset_color Could not find venv $1"
		echo "You currently have the following venvs"
		find . -maxdepth 1 -type d -name ".venv-*" | sed 's/\.\/\.venv\-//g'
	fi
}
compctl -K _work work


function venv() {
	if [ ! -z $1 ]; then
		virtualenv --prompt "(${PWD##*/}-$1) " .venv-$1
	else
		virtualenv --prompt "(${PWD##*/}) " .venv
	fi
}
