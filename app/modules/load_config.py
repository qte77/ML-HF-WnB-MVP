#!/usr/bin/env python
'''
Load and return yaml configuration files
'''
from os.path import exists
from typing import Union
from yaml import safe_load

#TODO export config in files.yml to separate from program flow?
cfg_path = "../config"
cfg_defaults = [ 
    'defaults' 'task',
    'huggingface', 'wandb',
    'sweep', 'sweep-wandb'
]

def get_config(cfg_name: str) -> Union[dict[str, object], Exception]:
    '''
    Parses config yaml and returns config objects
    '''
    if cfg_defaults.__contains__(cfg_name):
        cfg = cfg_defaults[cfg_name]
    else:
        cfg = cfg_name

    cfg = f'{cfg_path}/{cfg}.yml'

    if not exists(cfg):
        print(str(FileNotFoundError))
        return FileNotFoundError

    try:
        with open(cfg, 'r', encoding='utf8') as yml:
            return safe_load(yml)
    except Exception as e:
        print(str(e))
        return e