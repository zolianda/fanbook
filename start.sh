set -eu

export PYTHONNUNBUFFERED=true

VIRTUALENV=.data/venv

if [ ! -d $VIRTUALENV]; then
    python -m venv $VIRTUALENV

fi

if [ ! -d $VIRTUALENV/bin/pip]; then 
    curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get.py | $VIRTUALENV
fi

$VIRTUALENV/bin/pip install -requirements.txt

$VIRTUALENV/bin/python3 app.py
footer