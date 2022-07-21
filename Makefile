# https://github.com/harvardnlp/annotated-transformer/blob/master/Makefile
# https://makefiletutorial.com/
# https://devhints.io/makefile
.PHONY: help
.DEFAULT_GOAL := help

APP_PATH := ./app
IPYNB_PATH := $(APP_PATH)/ipynb
MD_PATH := $(APP_PATH)/md
HTML_PATH := $(APP_PATH)/html
RUNS_PATH := $(APP_PATH)/runs
APP := $(APP_PATH)/app.py
PIPENV_PATH := .
PIPFILE_PATH := $(PIPENV_PATH)/Pipfile
PAPERMILL := $(APP_PATH)/config/papermill.yml
HELP := $(APP_PATH)/README.md
IPYNB := $(APP:$(APP_PATH)=$(IPYNB_PATH),.py=.ipynb)
MD := $(APP:$(APP_PATH)=$(MD_PATH),.py=.md)
HTML := $(APP:$(APP_PATH)=$(HTML_PATH),.py=.html)
RUNS_CUR != date + "%y-%m-%d_%H-%M-%S"
PY_BIN != /usr/bin/env python

py_to_nb: $(APP)
	mkdir -p $(IPYNB_PATH)
	jupytext --to ipynb $(APP) --test-strict
	jupytext --to ipynb $(APP) -o $(IPYNB)

nb_to_py: $(IPYNB)
	jupytext --to py:percent $(IPYNB) --test-strict
	jupytext --to py:percent $(IPYNB) -o $(APP)

nb_to_md: $(MD)
	mkdir -p $(MD_PATH)
	jupyter nbconvert --to markdown $(IPYNB)

# TODO install jupyter for nbconvert?
# py_to_html: $(IPYNB)
# 	py_to_nb
# 	mkdir -p $(HTML_PATH)
# 	jupyter nbconvert --to html $(IPYNB) -o $(HTML)

# TODO add args
exec_py: $(APP)
	python -m $(APP)

exec_papermill: $(IPYNB)
	papermill -f $(PAPERMILL) $(IPYNB) $(RUNS_PATH)/$(RUNS_CUR)

exec_nb_full: $(APP)
	py_to_nb
	exec_papermill

# TODO add train mode arg
train_py: $(APP)
	exec_py

# TODO add infer mode arg
infer_py: $(APP)
	exec_py

# clean_nb:
#	rm -f $(IPYNB)

lint:
	flake8 app tests

test:
	pytest -svv tests

coverage:
	coverage run --source pytest_workshop -m pytest
	coverage report -m
	coverage html
	cat htmlcov/index.html

# https://pypi.org/project/pipfile/
setup_local: $(PY_BIN) $(PIPFILE_PATH)
	$(PY_BIN) -m pipenv install $(PIPENV_PATH)
	run_local

setup_local_dev: $(PY_BIN) $(PIPFILE_PATH)
	$(PY_BIN) -m pipenv install -d $(PIPENV_PATH)

# TODO run in local venv train/infer mode
# run_local: $(PY_BIN)
# #	$(PY_BIN) -m pipenv shell
#  $(PY_BIN) -m pipenv run

help: $(HELP)
	@$(cat $^)

%: Makefile
	help