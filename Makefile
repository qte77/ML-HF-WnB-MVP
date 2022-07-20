#https://github.com/harvardnlp/annotated-transformer/blob/master/Makefile
#https://makefiletutorial.com/
#https://devhints.io/makefile

APP_PATH := ./app
IPYNB_PATH := $(APP_PATH)/ipynb
MD_PATH := $(APP_PATH)/md
HTML_PATH := $(APP_PATH)/html
RUNS_PATH := $(APP_PATH)/runs
APP := $(APP_PATH)/app.py
PIPENV := $(APP_PATH)/Pipenv
PAPERMILL := $(APP_PATH)/config/papermill.yml
HELP := $(APP_PATH)/README.md
IPYNB := $(APP:$(APP_PATH)=$(IPYNB_PATH),.py=.ipynb)
MD := $(APP:$(APP_PATH)=$(MD_PATH),.py=.md)
HTML := $(APP:$(APP_PATH)=$(HTML_PATH),.py=.html)
RUNS_CUR != date + "%y-%m-%d_%H-%M-%S"

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

#TODO install jupyter for nbconvert?
# py_to_html: $(IPYNB)
# 	py_to_nb
# 	mkdir -p $(HTML_PATH)
# 	jupyter nbconvert --to html $(IPYNB) -o $(HTML)

#TODO add args
exec_py: $(APP)
	python -m $(APP)

exec_papermill: $(IPYNB)
	mkdir -p 
	papermill -f $(PAPERMILL) $(IPYNB) $(RUNS_PATH)/$(RUNS_CUR)

exec_py_full: $(APP)
	py_to_nb
	exec_papermill

#TODO add train mode arg
train_py: $(APP)
	exec_py

#TODO add infer mode arg
infer_py: $(APP)
	exec_py

# create_docs: nb_to_md
# 	pandoc docs/header-includes.yaml the_annotated_transformer.md \
# 		--katex=/usr/local/lib/node_modules/katex/dist/ \
# 		--output=docs/index.html --to=html5 \
# 		--css=docs/github.min.css \
# 		--css=docs/tufte.css \
# 		--no-highlight --self-contained \
# 		--metadata pagetitle="The Annotated Transformer" \
# 		--resource-path=/home/srush/Projects/annotated-transformer/ \
# 		--indented-code-classes=nohighlight

# clean_nb:
#	rm -f $(IPYNB)

# setup_pkg:
#	python -c setup.py

# setup_conda:
#	conda.env

# https://pypi.org/project/pipfile/
# setup_pipfile:
#	pip install -p

setup_req: $(PIPENV)
	pipenv install $(APP_PATH)

setup_req_dev: $(PIPENV)
	pipenv install $(APP_PATH)

.PHONY: help

help: $(HELP)
	@$(cat $^)

%: Makefile
	help