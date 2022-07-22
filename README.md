# ML Pipeline

[![CodeQL](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/codeql.yml/badge.svg)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/codeql.yml)
[![Lint Code Base](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/linter.yml/badge.svg)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/linter.yml)
[![Links (Fail Fast)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/links-fail-fast.yml/badge.svg)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/links-fail-fast.yml)

App for benchmarking different BERT-Architectures using a pipeline with Hugging Face (HF) and Weights&Biases (WandB).

## Status

**[WIP]** **[DRAFT]** **----> Not fully implemented <----**

## Quickstart

Explore the app with Jupyter notebooks.

* [App](./ipynb/app.ipynb) &nbsp;
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/qte77/App-BERT-Benchmark/HEAD?urlpath=lab/tree/app/ipynb/app.ipynb)
[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/qte77/App-BERT-Benchmark/blob/main/app/ipynb/app.ipynb)
[![Open In Studio Lab](https://studiolab.sagemaker.aws/studiolab.svg)](https://studiolab.sagemaker.aws/import/github/qte77/App-BERT-Benchmark/blob/main/app/ipynb/app.ipynb)
* [HF-WnB-PoC](./ipynb/HF-WnB-PoC.ipynb) &nbsp;
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/qte77/App-BERT-Benchmark/HEAD?urlpath=lab/tree/app/ipynb/HF-WnB-PoC.ipynb)
[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/qte77/App-BERT-Benchmark/blob/main/app/ipynb/HF-WnB-PoC.ipynb)
[![Open In Studio Lab](https://studiolab.sagemaker.aws/studiolab.svg)](https://studiolab.sagemaker.aws/import/github/qte77/App-BERT-Benchmark/blob/main/app/ipynb/HF-WnB-PoC.ipynb)
* [HF-WnB-PyTorch-Sweeps-PoC](./app/ipynb/HF-WnB-PyTorch-Sweeps-PoC.ipynb) &nbsp;
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/qte77/App-BERT-Benchmark/HEAD?urlpath=lab/tree/app/ipynb/HF-WnB-PyTorch-Sweeps-PoC.ipynb)
[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/qte77/App-BERT-Benchmark/blob/main/app/ipynb/HF-WnB-PyTorch-Sweeps-PoC.ipynb)
[![Open In Studio Lab](https://studiolab.sagemaker.aws/studiolab.svg)](https://studiolab.sagemaker.aws/import/github/qte77/App-BERT-Benchmark/blob/main/app/ipynb/HF-WnB-PyTorch-Sweeps-PoC.ipynb)

## TOC

* [Usage](#usage-)
* [Install](#install-)
* [Reason](#reason-)
* [Purpose](#purpose-)
* [Paradigms](#paradigms-)
* [App Structure](#app-structure-)
* [App Details](#app-details-)
* [TODO](#todo-)
* [Rescources](#resources-)

## Usage [↑](#toc)

### Run

* Plain py train mode: `make train_py`
* Plain py infer mode: `make infer_py`
* Papermill: `exec_nb_full`

### Credentials

* Wandb
  * Read from `wandb_keyfile` in `/app/config/wandb.yml`
  * Format expected like `/app/config/wandb-key-dummy.yml`

## Install [↑](#toc)

* Local: `make setup_local`
* Local dev: `make setup_local_dev`

## Reason [↑](#toc)

* **TODO**

## Purpose [↑](#toc)

* BERT arch/specs/config

## Paradigms [↑](#toc)

* **TODO**

## App structure [↑](#toc)

### Essential

<details>
<pre>
/
├─ app/
│  ├─ config/
│  │  ├─ huggingface.yml
│  │  ├─ papermill.yml
│  │  ├─ wandb.yml
│  │  └─ wandb-sweep.yml
│  ├─ helper/
│  │  ├─ [__init__.py]
│  │  ├─ load_config.py
│  │  └─ load_save_hf.py
│  ├─ ipynb/
│  │  └─ [app.ipynb]
│  ├─ model/
│  │  ├─ [__init__.py]
│  │  ├─ infer_model.py
│  │  └─ train_model.py
│  ├─ .python-version
│  ├─ __main__.py
│  ├─ __version__.py
│  ├─ app.py
│  ├─ Pipfile
│  └─ [Pipfile.lock]
├─ Makefile
└─ [Setup.py]
</pre>
</details>

### Full

<details>
<pre>
/
├─ .github/
│  ├─ workflows/
│  │  ├─ codeql.yml
│  │  ├─ links-fail-fast.yml
│  │  └─ linter.yml
│  └─ dependabot.yml
├─ app/
│  ├─ config/
│  │  ├─ huggingface.yml
│  │  ├─ papermill.yml
│  │  ├─ wandb.yml
│  │  ├─ wandb-key-dummy.yml
│  │  └─ wandb-sweep.yml
│  ├─ helper/
│  │  ├─ [__init__.py]
│  │  ├─ load_config.py
│  │  └─ load_save_hf.py
│  ├─ [html/]
│  ├─ ipynb/
│  │  ├─ [app.ipynb]
│  │  ├─ HF-WnB-PoC.ipynb
│  │  ├─ HF-WnB-PyTorch-Sweeps-PoC.ipynb
│  │  └─ [converted-by-jupytext.ipynb]
│  ├─ [md/]
│  ├─ model/
│  │  ├─ [__init__.py]
│  │  ├─ infer_model.py
│  │  └─ train_model.py
│  ├─ .python-version
│  ├─ __main__.py
│  ├─ __version__.py
│  ├─ app.py
│  ├─ Pipfile
│  └─ [Pipfile.lock]
├─ assets/
│  └─ ML-Pipeline-HF-WnB.draw.io.png
├─ .gitignore
├─ .gitmessage
├─ CHANGELOG.md
├─ LICENSE
├─ Makefile
├─ README.md
└─ [Setup.py]
</pre>
</details>

## App Details [↑](#toc)

### Simple pipeline with commercial vendors

* SCM with [Github](https://Github.com)
* Logging, monitoring, alerting, model-versioning, -visualizing and -sweeping with [Weights & Biases](https://wandb.ai)
* Pre-trained models and tokenizers as well as metrics and curated datasets from [Hugging Face](https://huggingface.co)
* Explorative prototyping with [Jupyter-Notebooks](https://jupyter.org/)
* Compute resources from [Google Colab](https://colab.research.google.com)

  <img src="./assets/ML-Pipeline-HF-WnB.draw.io.png" alt="ML-Pipeline-HF-WnB.draw.io.png" width="50%" height="50%" />

### Tools used

* Jupyter notebooks (.ipynb), [Website](https://jupyter.org), [Docs](https://docs.jupyter.org/), [Github](https://github.com/jupyter/jupyter)
  * [Try (GCP, OVH)](https://jupyter.org/try), [Demo Notebooks (GCE)](https://mybinder.org/v2/gh/jupyterlab/jupyterlab-demo/HEAD?urlpath=lab/tree/demo), [Demo Source on GH](https://github.com/jupyterlab/jupyterlab-demo/)
  * Explore, modify, iterate, share
  * Rendered REPL (read, execute, print, loop)
  * Good visuals, logs, outputs, easy to colaborate and share with
  * Lack of history, mutable, difficult to version, test and template
* jupytext, [Docs](https://jupytext.readthedocs.io), [Github](https://github.com/mwouts/jupytext)
  * Diff in SCM as py or md
  * Convert to ipynb for experiments
  * Sync py and ipynb for quick modification
* papermill, [Docs](https://papermill.readthedocs.io/), [Github](https://github.com/nteract/papermill/)
  * Parameterise, execute and analyze ipynb
  * Create reports for specific param-set
  * Reproduce experiments by using template ipynb, save output ipynb
* Hugging Face, [Website](https://huggingface.co/), [Docs](https://huggingface.co/docs/), [Github](https://github.com/huggingface/)
  * 'The AI community building the future.'
  * 'Build, train and deploy state of the art models powered by the reference open source in machine learning.'
  * Products: Models, Datasets, Tasks, Metrics, Tokenizer
* WandB, [Website](https://wandb.ai/site), [Docs](https://wandb.ai/site), [Github](https://github.com/wandb)
  * 'The developer-first MLOps platform'
  * 'Build better models faster with experiment tracking, dataset versioning, and model management'
  * Products: Dashboard, Sweeps, Artifacts, Reports, Tables 
* Compute Resources
  * [Google Colab](https://colab.research.google.com/), [Limitations and restrictions](https://research.google.com/colaboratory/faq.html#limitations-and-restrictions), [Resource limits](https://research.google.com/colaboratory/faq.html#resource-limits)
  * [AWS Sagemaker StudioLab](https://studiolab.sagemaker.aws/), [FAQ](https://studiolab.sagemaker.aws/faq)
  * [Kaggle Code](https://www.kaggle.com/code/), [Docs](https://www.kaggle.com/docs/notebooks), [Github](https://github.com/Kaggle)
  * [Binder](https://mybinder.org/), [Docs](https://mybinder.readthedocs.io/), [Github](https://github.com/jupyterhub/binderhub), [Examples](https://github.com/binder-examples), [Get badge](https://mybinder.org/)
    * Disclaimer: supported/run by/on Google Cloud (GCE), OVH, GESIS Notebooks, Turing Institute

## TODO [↑](#toc)

* Milestones
  * [x] Exploration and PoC with Jupyter
    * Explore different frameworks, models, tasks and datasets
    * Explore usage of pre-trained models and tokenizers
    * Compare metrics of transformer models
  * [ ] Prototype with Python converted to Jupyter
    * Create pipeline to avoid repetition and unforced errors
    * Use `jupytext` to convert and sync py and ipynb
    * Use `papermill` to sweep over config
    * `papermill` crashes Colab kernel, use StudioLab?
  * [ ] MVP with Python only
* Project
  * [x] Load models, datasets, tokenizer and metrics from Hugging Face 
  * [x] Sweep-PoC with WandB
  * [ ] Sweep over optimizer (Adam, SGD, RMSProp, SWA, AWS AdaTune), not activation
  * [ ] Extract helper functions into modules
  * [ ] Load different BERT archs/specs/configs with HF benchmark.py as baseline
  * [ ] Explore torch bench
  * [ ] Get which loss is used in HF-BERT, can it be changed?
  * [ ] Test shuffle/batch train/eval data, e.g. train.shuffle(100).batch(32).repeat(2)
* Development
  * [x] Test Pipfile as successor of requirements.txt
    * Several advantages like auto-venv and combined prod/dev in one TOML
  * [ ] No default mutable arguments
  * [ ] Consistent typing and type hinting
  * [ ] Use comprehension for list, dict, set, gen if appropriate
  * [ ] Explore `setattr()` and `getattr()` for dynamic values
  * [ ] EXplore generators with `yield` for one result at a time into mem
  * [ ] Use `isinstance()` and `is`
  * [ ] Use [`pydantic`](https://pydantic-docs.helpmanual.io/) or [`traitlets`](https://pypi.org/project/traitlets/) for type hinting or strong typing
  * [ ] Consistent usage of `if` or `try` for features and catches
  * [ ] Try `arparse`
  * [ ] Try `Logger` instead of `print()`
  * [ ] Consistent use of pydoc for auto-gen `sphinx` or `pandoc` 
  * [ ] Test `__init__.py` for pkg
  * [ ] Test `setup.py` for wheel
* Best Practices
  * [x] Adopt [SemVer](https://semver.org/)
    * Using MAJOR.MINOR.PATCH (Breaking.Feature.Patch)
  * [x] Adopt [`CHANGELOG.md`](https://keepachangelog.com/)
    * Using `Added`, `Removed`, `Changed` and `Unreleased`
    * Also recommended: `Deprecated`, `Fixed` and `Security`
  * [x] Adopt [semantic commit messages](https://www.conventionalcommits.org/)
    * Purposful add human and machine readable meaning to commit messages
  * [ ] Adhere to [Docker BP](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
  * [ ] Adhere to BP from [The Hitchhiker's Guide to Python!](https://docs.python-guide.org/)

## Resources [↑](#toc)

* BERT (2018)
  * <a href="https://arxiv.org/abs/1810.04805" alt="BERT Paper">Paper</a>, <a href="https://github.com/google-research/bert" alt="BERT Github">Github</a>
* Transformer
  * <a href="https://nlp.seas.harvard.edu/annotated-transformer/" alt="The Annotated Transformer (2022 Version)">The Annotated Transformer (2022 Version)</a>, <a href="https://github.com/harvardnlp/annotated-transformer/" alt="Annotated Transformer Github">Github</a>
  * <a href="https://lilianweng.github.io/posts/2020-04-07-the-transformer-family/" alt="The Transformer Family (2020)">The Transformer Family (2020)</a>
  * <a href="https://www.youtube.com/watch?v=S27pHKBEp30" alt="LSTM is dead. Long Live Transformers! (2019)">LSTM is dead. Long Live Transformers! (2019)</a>
  * <a href="https://jalammar.github.io/illustrated-transformer/" alt="The Illustrated Transformer (2018)">The Illustrated Transformer (2018)</a>
  * <a href="https://arxiv.org/abs/1706.03762" alt="Attention Is All You Need (Transformer , 2017)">Attention Is All You Need (Transformer , 2017)</a>
* Jupytext and Papermill
  * <a href="https://github.com/CFMTech/jupytext_papermill_post/blob/master/README.md" alt="Automated Reports with Jupyter Notebooks (using Jupytext and Papermill)">Automated Reports with Jupyter Notebooks (using Jupytext and Papermill)</a>
  * <a href="https://www.youtube.com/watch?v=7ER9tqiNack" alt="Matthew Seal: Data and ETL with Notebooks in Papermill | PyData LA 2019">Matthew Seal: Data and ETL with Notebooks in Papermill | PyData LA 2019</a>
* Development
  * <a href="https://www.youtube.com/watch?v=Bq_oz7nCNUA" alt="Test Driven Development vs Behavior Driven Development">Test Driven Development vs Behavior Driven Development</a>
  * <a href="https://www.youtube.com/watch?v=x9l6yw1PFbs" alt="How to Build a DEPLOYMENT PIPELINE? (Continuous Delivery)">How to Build a DEPLOYMENT PIPELINE? (Continuous Delivery)</a>