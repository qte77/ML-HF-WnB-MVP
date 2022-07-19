#https://github.com/harvardnlp/annotated-transformer/blob/master/Makefile
#https://makefiletutorial.com/
#https://devhints.io/makefile

APP_PATH := ./app
IPYNB_PATH := $(APP_PATH)/ipynb
RUNS_PATH := $(APP_PATH)/runs
APP := $(APP_PATH)/app.py
PAPER_CFG := $(APP_PATH)/config/papermill.yml
HELP := $(APP_PATH)/README.md
IPYNB := $(APP:$(APP_PATH)=$(IPYNB_PATH)/ipynb,.py=.ipynb)
RUNS_CUR != date + "%y-%m-%d_%H-%M-%S"

.PHONY: help

help: $(HELP)
	@$(cat $^)

py_to_nb: $(APP)
	jupytext --to ipynb $(APP)

nb_to_py: $(IPYNB)
	jupytext --to py:percent $(IPYNB)

nb_to_md: $(IPYNB)
	jupyter nbconvert --to markdown $(IPYNB)

py_to_html: $(IPYNB)
	py_to_nb
	jupyter nbconvert --to html $(IPYNB)

#TODO add args
exec_py: $(APP)
	python -m $(APP)

exec_papermill: $(IPYNB)
	mkdir -p 
	papermill -f $(PAPER_CFG) $(IPYNB) $(RUNS_PATH)/$(RUNS_CUR)

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

setup_req:
	python -m pip install -qr requirements.txt

setup_req_dev:
	python -m pip install -qr requirements-dev.txt

%: Makefile
	help