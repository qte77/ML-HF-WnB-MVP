#https://github.com/harvardnlp/annotated-transformer/blob/master/Makefile
#https://makefiletutorial.com/
#https://devhints.io/makefile

APP_PATH := ./app
APP := $(APP_PATH)/app.py
PAPER_CFG := $(APP_PATH)/config/papermill.yml
IPYNB := $(APP:$(APP_PATH)=$(APP_PATH)/ipynb,.py=.ipynb)
HELP := $(APP_PATH)

.PHONY: help

help: README.md
	@$(cat $^)

py_to_nb: $(APP)
	jupytext --to ipynb $(APP)

nb_to_py: $(IPYNB)
	jupytext --to py:percent $(IPYNB)

py_to_html: $(IPYNB)
	jupytext --execute --to ipynb $(APP)
	jupyter nbconvert --to html $(IPYNB)

#TODO add args
exec_py: $(APP)
	python -m $(APP)

exec_papermill: $(IPYNB)
	papermill $(IPYNB) -f $(PAPER_CFG)

exec_py_full: $(APP)
	py_to_nb
	exec_papermill

#TODO add train mode arg
train_py: $(APP)
	exec_py

#TODO add infer mode arg
infer_py: $(APP)
	exec_py

# nb_to_md: $(IPYNB)
# 	jupyter nbconvert --to markdown --execute $(IPYNB)

# blog: nb_to_md
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

# setup_app:s
#	python -c setup.py

setup_py:
	python -m pip install -qr requirements.txt

setup_py_dev:
	python -m pip install -qr requirements-dev.txt

# setup_conda:
#	conda.env

%: Makefile
	help