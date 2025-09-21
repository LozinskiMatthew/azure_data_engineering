#bin/bash

function create_venv() {
    if command -v python3 &> /dev/null; then
        python3 -m venv .venv
    elif command -v python &> /dev/null; then
        python -m venv .venv
    else
        echo "No suitable Python interpreter found (python3 or python)." >&2
        return 1
    fi
}

function install_dependencies() {
    if [ ! -d "venv" ]; then
        echo "No venv found, creating one..."
        create_venv || return 1
    fi

    source ./venv/bin/activate
    pip install --upgrade pip
    pip install .
}

"$@"
