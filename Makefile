SHELL := bash
PATH := ./venv/bin:${PATH}
PYTHON = python3.7
PROJECT = flask_base
isort = isort -rc -ac $(PROJECT) tests
black = black -S -l 79 --target-version py37 $(PROJECT) tests


venv:
		$(PYTHON) -m venv --prompt $(PROJECT) venv
		pip3 install -qU pip

install:
		pip3 install -q -r requirements.txt

format:
		$(isort)
		$(black)

lint:
		$(isort) --check-only
		$(black) --check
		flake8 $(PROJECT) tests setup.py
		mypy $(PROJECT) tests

clean:
		find . -name '*.pyc' -exec rm -f {} +
		find . -name '*.pyo' -exec rm -f {} +
		find . -name '*~' -exec rm -f {} +
		rm -rf build dist $(PROJECT).egg-info

.PHONY: install format lint clean