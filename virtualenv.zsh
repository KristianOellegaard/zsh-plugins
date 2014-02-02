
function _work() {
	reply=(`find . -maxdepth 1 -type d -name ".venv-*" | sed 's/\.\/\.venv\-//g'`)
}


function work() {
	if [ $VIRTUAL_ENV ]; then
		deactivate
	fi
	if [ -f bin/activate ]; then
		source bin/activate
	elif [ ! -z $2 ]; then
		source .venv-$1-$2/bin/activate
	elif [ ! -z $1 ]; then
		source .venv-$1/bin/activate
	elif [ -f .venv/bin/activate ]; then
		source .venv/bin/activate
	else
		echo "work: $fg[red]Error:$reset_color Could not find venv $1"
		echo "You currently have the following venvs"
		find . -maxdepth 1 -type d -name ".venv-*" | sed 's/\.\/\.venv\-//g'
	fi
}
compctl -K _work work


function venv() {
    if [[ ! -z $1 && ($1 == "-h" || $1 == "--help") ]]; then
        echo "venv"
        echo "usage: venv <name> <python-version>"
        echo ""
        echo "Override python-version with PYTHON_VERSION environment variable"
        return 1
    fi
	if [[ ! -z $2 && -z $PYTHON_VERSION ]]; then
		PYTHON_VERSION=$2
	elif [[ -z $PYTHON_VERSION ]]; then
		PYTHON_VERSION="`python -c "import sys; print(sys.version.split('(')[0]).replace(' ', '').rsplit('.', 1)[0]"`"
	fi
	echo "Using python version ${PYTHON_VERSION}"
	VERSION_NAME="${fg[cyan]}Py${fg[yellow]}${PYTHON_VERSION}$reset_color"
	if [ ! -z $1 ]; then
		virtualenv --prompt "(${PWD##*/}-$1 | ${VERSION_NAME}) " --python=python$PYTHON_VERSION .venv-$1-$PYTHON_VERSION
	else
		virtualenv --prompt "(${PWD##*/} | ${VERSION_NAME}) " --python=python$PYTHON_VERSION .venv
	fi
}
