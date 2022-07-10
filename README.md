# ML Pipeline

[![CodeQL](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/codeql.yml/badge.svg)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/codeql.yml)
[![Lint Code Base](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/linter.yml/badge.svg)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/linter.yml)
[![Links (Fail Fast)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/links-fail-fast.yml/badge.svg)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/links-fail-fast.yml)


[WIP] of a pipeline using Hugging Face and Weights&Biases.

----> **Not fully implemented** <----

## TOC

* [Purpose](#purpose-)
* [TODO](#todo-)
* [Pipeline](#pipeline-)
* [Install](#install-)
* [Notes on ressources used](#notes-on-ressources-used-)

## Structure
* `jupyter-exploration` Notebooks and nbconverted py to explore the used tools
* `jupyter-simple-pipeline` Explore using Jupyter notebooks, convert to py and run non-interactive

## Purpose [↑](#ml-pipeline)

* Explore different frameworks and models
* Explore usage of pre-trained models and tokenizers
* Focus on data and models
* Compare metrics of transformer models
* Create pipeline to avoid repetition and unforced errors
* Provide reference implementations

## TODO [↑](#ml-pipeline)

* [ ]
* [ ]

## Pipeline [↑](#ml-pipeline)

### Simple Jupyter pipeline with commercial vendors

* This is the implemented version in `jupyter-simple-pipeline`
* Code-versioning with [Github](https://Github.com)
* Logging, monitoring, alerting, model-versioning, -visualizing and -sweeping with [Weights & Biases](https://wandb.ai)
* Pre-trained models and tokenizers as well as metrics and curated datasets from [Hugging Face](https://huggingface.co)
* Explorative coding with [Jupyter-Notebooks](https://jupyter.org/)
* Compute resources from [Google Colab](https://colab.research.google.com)

<img src="./assets/ML-Pipeline-HF-WnB.draw.io.png" alt="ML-Pipeline-HF-WnB.draw.io.png" width="40%" height="40%" />

### Alternative vanilla with OSS tools

* Tools that could be implemented if OSS is required
* [Data Version Control (DVC)](https://dvc.org)
* Sweeps with AutoML or [AutoGluon](https://auto.gluon.ai)
* Logn/Mon/Alert with [TensorBoard](https://www.tensorflow.org/tensorboard) or [Grafana](https://grafana.com/)
* Generalize models with [ONNX](https://onnx.ai/)

<img src="./assets/ML-Pipeline-vanilla.draw.io.png" alt="ML-Pipeline-vanilla.draw.io.png" width="40%" height="40%" />

### K8s pipeline to version and deploy

* Conceptual pipeline to expand into CD4ML and MLOps
* ML lifecycle with [MLflow](https://mlflow.org)
* Automated delivery with [ArgoCD](https://argoproj.github.io/cd)
* Automated deplyoment with [KServe](https://kserve.github.io/website)

<img src="./assets/ML-Pipeline-Deploy.draw.io.png" alt="ML-Pipeline-Deploy.draw.io.png" width="40%" height="40%" />

## Install [↑](#ml-pipeline)

### Jupyter pipeline

<!--

# Exploration with Jupyter notebooks

## TOC

* [Exploration](./README.md#exploration-)
* [Notes on ressources used](./README.md#notes-on-ressources-used-)

# Exploration  [↑](./README.md#exploration-with-jupyter-notebooks-)

* [Sweep with Weights&Biases](./exploration/ipynb/HF-WnB-PyTorch-Sweeps.ipynb) &nbsp;
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/qte77/ML-HF-WnB/blob/main/ipynb/HF-WnB-PyTorch-Sweeps.ipynb/HEAD)
[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/qte77/ML-HF-WnB/blob/main/exploration/ipynb/HF-WnB-PyTorch-Sweeps.ipynb)
[![Open In Studio Lab](https://studiolab.sagemaker.aws/studiolab.svg)](https://studiolab.sagemaker.aws/import/github/qte77/ML-HF-WnB/blob/main/exploration/ipynb/HF-WnB-PyTorch-Sweeps.ipynb)
* [PoC with Huggin Face and Weights&Biases](./exploration/ipynb/HF-WnB-PoC.ipynb) &nbsp;
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/qte77/ML-HF-WnB/blob/main/exploration/ipynb/HF-WnB-PoC.ipynb/HEAD)
[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/qte77/ML/blob/main/exploration/ipynb/HF-WnB-PoC.ipynb)
[![Open In Studio Lab](https://studiolab.sagemaker.aws/studiolab.svg)](https://studiolab.sagemaker.aws/import/github/qte77/ML/blob/main/exploration/ipynb/HF-WnB-PoC.ipynb)

-->

## Notes on ressources used [↑](#ml-pipeline)

### Binder

* Disclaimer: supported/run by/on Google Cloud (GCE), OVH, GESIS Notebooks, Turing Institute 
* [Get badge](https://mybinder.org/)
* [ReadTheDocs](https://mybinder.readthedocs.io/en/latest/)
* [Binder on GH](https://github.com/jupyterhub/binder)

### Jupyter

* [Try Demo (GCE)](https://jupyter.org/try)
* [Demo Notebooks (GCE)](https://mybinder.org/v2/gh/jupyterlab/jupyterlab-demo/HEAD?urlpath=lab/tree/demo)
* [Demo Source on GH](https://github.com/jupyterlab/jupyterlab-demo/)
