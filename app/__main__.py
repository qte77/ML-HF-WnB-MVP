#!/usr/bin/env python
"""Redirects to entrypoint of the app"""
from sys import exit
from .app import main

exit(main())