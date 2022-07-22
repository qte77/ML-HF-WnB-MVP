#!/usr/bin/env python
"""
Local load and save components from Hugging Face.
If not available, download from Hugging Face.
- Models
- Datasets
- Tokenizer
- Metrics

TODO repeated code into decorator for sep of concerns
TODO use @property and @<property>.setter to avoid get/set()
"""
from os import makedirs
from os.path import exists
from typing import Union

from transformers import AutoModel, AutoTokenizer
from datasets import load_dataset, load_metric

def load_and_save_model(
    model_name: str,
    model_dir: str,
    num_labels: int = None
) -> Union[AutoModel, Exception]:
    """
    Load and save models from and to '<model_dir>/<model_name>' with '[num_labels]'.
    """
    model_dir = f'{model_dir}/{model_name}'
    if not exists(model_dir):
        print(f'Downloading and saving model to {model_dir}')
        try:
            makedirs(model_dir)
            modelobj = AutoModel.from_pretrained(model_name, num_labels = num_labels)
            modelobj.save_pretrained(model_dir)
            return modelobj
        except Exception as e:
            print(str(e))
            return e
    else:
        print(f'Loading local model from {model_dir}')
        try:
            return AutoModel.from_pretrained(model_dir)
        except Exception as e:
            print(str(e))
            return e

def load_and_save_dataset(
    dataset_name: str,
    dataset_dir: str,
    dataset_config: str = None
) -> Union[load_dataset, Exception]:
    """
    Load and save datasets from and to <dataset_dir>/<dataset_name>/[config_name]
    """
    dataset_full_name = f'{dataset_name}/{dataset_config}'
    dataset_dir = f'{dataset_dir}/{dataset_full_name}'

    if not exists(dataset_dir):
        print(f'Downloading and saving dataset to "{dataset_dir}".')
        try:
            makedirs(dataset_dir)
            datasetobj = _download_dataset(dataset_name, dataset_config)
            datasetobj.save_to_disk(dataset_dir)
            return datasetobj
        except Exception as e:
            print(str(e))
            return e
    else:
        print(f'Loading local dataset from "{dataset_dir}".')
        try:
            #data_files = { 'train': 'train' }
            #load_dataset(path = dataset_dir, data_files = data_files)
            return load_dataset(path = dataset_dir)
        except Exception as e:
            print(str(e))
            return e

def _download_dataset(
    dataset_name: str,
    dataset_config: str = None
) -> Union[load_dataset, Exception]:
    """
    Download and return <dataset_name> with [dataset_config] from Hugging Face
    """
    try:
        if dataset_config == None:
            return load_dataset(dataset_name)
        else:
            return load_dataset(dataset_name, dataset_config)
    except Exception as e:
        return e

def load_and_save_tokenizer(
    model_name: str,
    tokenizer_dir: str
) -> Union[AutoTokenizer, Exception]:
    """
    Load and save tokenizer from and to
        <tokenizer_dir>/<model_name>
    """
    tokenizer_dir = f'{tokenizer_dir}/{model_name}'
    if not exists(tokenizer_dir):
        print(f'Downloading and saving tokenizer to {tokenizer_dir}')
        try:
            makedirs(tokenizer_dir)
            tokenizer = AutoTokenizer.from_pretrained(model_name, use_fast=True, \
                truncation=True, padding=True)
            tokenizer.save_pretrained(tokenizer_dir)
            return tokenizer
        except Exception as e:
            print(str(e))
            return e
    else:
        print(f'Loading local tokenizer from {tokenizer_dir}')
        try:
            return AutoTokenizer.from_pretrained(tokenizer_dir)
        except Exception as e:
            print(str(e))
            return e

def load_and_save_metrics(
    metrics_to_load: list[str],
    metrics_dir: str = None
) -> dict[str, dict[str, Union[load_metric, Exception]]]:
    """
    Load and save metrics with Metrics Builder Scripts from and to <metrics_dir>/<metric_name>
    TODO local save metrics NOT IMPLEMENTED YET
    """
    metrics_loaded = {}
    metrics_load_errors = {}

    for metric in metrics_to_load:
        print(f'Downloading builder script for "{metric}".')
        try:
            metrics_loaded[metric] = load_metric(metric)
        except Exception as e:
            print(str(e))
            metrics_load_errors[metric] = e
    
    return { 'metrics': metrics_loaded, 'errors': metrics_load_errors }