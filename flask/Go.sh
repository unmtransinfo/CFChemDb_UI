#!/bin/bash
###
# https://flask.palletsprojects.com/en/2.0.x/tutorial/blog/
###
# We need to use Conda, not VirtualEnv, for RDKit support.
# https://softwarejargon.com/dockerizing-python-flask-app-and-conda-environment/
###
# conda create -c conda-forge -n rdktools rdkit
# conda activate rdktools
# pip install Flask
# Or:
# conda env create -f environment.yml
# conda activate rdktools
###
if [ ! "$CONDA_EXE" ]; then
	CONDA_EXE=$(which conda)
fi
if [ ! "$CONDA_EXE" -o ! -e "$CONDA_EXE" ]; then
	echo "ERROR: conda not found."
	exit
fi
#
source $(dirname $CONDA_EXE)/../bin/activate rdktools
#
export FLASK_APP=depict
export FLASK_ENV=development
export APP_SETTINGS="depict.config.DevelopmentConfig"
export DATABASE_URL="postgresql://commoner:easement@localhost/cfchemdb"
#
flask run
#
conda deactivate
###
