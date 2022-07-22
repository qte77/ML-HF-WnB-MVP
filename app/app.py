#!/usr/bin/env python
# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.14.0
#   kernelspec:
#     display_name: Python 3
#     name: python3
# ---

# %% [markdown]
# # BERT Benchmarking

# %%
"""Entrypoint of the app"""

# %% [markdown]
# ## Pre-Requisites

# %%
# ### Import modules
from sys import exit
from logging import basicConfig, DEBUG, \
    debug #, info, error, warning, critical

from _version import __version__
from helper.load_save_hf import load_and_save_model, \
    load_and_save_dataset, load_and_save_tokenizer, \
        load_and_save_metrics

# %%
# ###
log_level = DEBUG
log_format = '[%(levelname)s] %(asctime)s - %(process)d - %(message)s'
basicConfig(level = log_level, format = log_format)

# %% [markdown]
# ## Papermill parameters
# ### PM Start in the following code cell

# %% tags=["parameters"]

# %% [markdown]
# ### PM Parameters End

# %%
class App():
    """App object"""

    @staticmethod
    def get_self_name():
        debug('This is app speaking')

#main = launch_new_instance = App.launch_instance

# %%
if __name__ == "__main__":
    # main()
    # exit(main)
    App().get_self_name()#!/usr/bin/env python
# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .py
#       format_name: percent
#       format_version: '1.3'
#       jupytext_version: 1.14.0
#   kernelspec:
#     display_name: Python 3
#     name: python3
# ---

# %% [markdown]
# # BERT Benchmarking

# %%
"""Entrypoint of the app"""

# %% [markdown]
# ## Pre-Requisites

# %%
# ### Import modules
from sys import exit
from logging import basicConfig, DEBUG, \
    debug #, info, error, warning, critical

from _version import __version__
from helper.load_save_hf import load_and_save_model, \
    load_and_save_dataset, load_and_save_tokenizer, \
        load_and_save_metrics

# %%
# ###
log_level = DEBUG
log_format = '[%(levelname)s] %(asctime)s - %(process)d - %(message)s'
basicConfig(level = log_level, format = log_format)

# %% [markdown]
# ## Papermill parameters
# ### PM Start in the following code cell

# %% tags=["parameters"]

# %% [markdown]
# ### PM Parameters End

# %%
class App():
    """App object"""

    @staticmethod
    def get_self_name():
        debug('This is app speaking')

#main = launch_new_instance = App.launch_instance

def main():
    App().get_self_name()

# %%
if __name__ == "__main__":
    exit(main())
    # exit(main)