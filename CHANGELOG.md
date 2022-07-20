# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Types of changes:

- `Added` for new features.
- `Changed` for changes in existing functionality.
- `Deprecated` for soon-to-be removed features.
- `Removed` for now removed features.
- `Fixed` for any bug fixes.
- `Security` in case of vulnerabilities.

## [Unreleased]

- Things to come
- Move to new version section if completed

## [0.4.0] - 2022-07-21

### Added

- `Pipenv` and modified `jupytext`labels in `Makefile`

### Changed

- Separated modules into `helper` and `model`
- Pydoc comments from `'` to `"`
- Generated current `app.ipynb` with label `py_to_nb` from `Makefile`

## [0.3.0] - 2022-07-20

### Added

- Logic to  module `load_config`

### Changed

- Minor changes and renames

## [0.2.0] - 2022-07-20

### Added

- Draft of module `loadSaveHF` for loading and saving Hugging Face components (models, datasets, tokenizer, metrics)
- Empty modules `loadConfig`, `inferModel` and `trainModel` for later use

### Removed

- Module `convertNbToPm` because conversion is done with `Makefile`

## [0.1.0] - 2022-07-19

### Added

- Pipfile
- ./app/ipynb/*.ipynb
- ./app/__main\__.py

### Changed

- README.md

### Removed

- requirements.txt
- requirements-dev.txt
- Pipfile.lock