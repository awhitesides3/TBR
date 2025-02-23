#!/usr/bin/env python
import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="arc_2",
    version="0.1.0-dev",
    description="OpenMC-based API for studying TBR in fusion liquid immersion blankets",
    long_description=long_description,
    packages=setuptools.find_packages()
)
