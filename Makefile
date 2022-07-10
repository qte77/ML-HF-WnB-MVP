#https://github.com/harvardnlp/annotated-transformer/blob/master/Makefile
#https://makefiletutorial.com/
#https://devhints.io/makefile

APP_PATH = ./app
APP := $(APP_PATH)/pipeline.py
IPYNB := $(APP:$(APP_PATH)=$(APP_PATH)/ipynb,.py=.ipynb)
PAPER_CFG := $(APP_PATH)/config/papermill-parameters.yml
HELP := $(APP_PATH)/

.PHONY: help

help: README.md
	@$(cat $^)

py_to_nb: $(APP)
	jupytext --to ipynb $(APP)

nb_to_py: $(IPYNB)
	jupytext --to py:percent $(IPYNB)

exec_py: $(APP)
	python -m $(APP)

exec_ipynb: $(IPYNB)
	papermill $(IPYNB) -f $(PAPER_CFG)

py_to_html: $(IPYNB)
	jupytext --execute --to ipynb $(APP)
	jupyter nbconvert --to html $(IPYNB)

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

clean_nb: 
	rm -f $(IPYNB)

setup_app:
	python -c setup.py

setup_py:
	pip install -r requirements.txt

setup_py_dev:
	pip install -r requirements-dev.txt

%: Makefile
	help