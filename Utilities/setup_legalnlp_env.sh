#!/usr/bin/env sh

# INSTALL

# numpy
pip3 install -U numpy

# scikit-learn
pip3 install -U scikit-learn

# pandas
pip3 install -U pandas

# scipy
pip3 install -U scipy

# BeautifulSoup
pip3 install -U beautifulsoup4

# Parser for BeautifulSoup
pip3 install -U lxml

# requests
pip3 install -U requests

# gensim
pip3 install -U gensim

# nltk
pip3 install -U nltk

# spacy
pip3 install -U setuptools wheel
pip3 install -U spacy
python -m spacy download en_core_web_sm

# matplotlib
pip3 install -U matplotlib

# plotly
pip3 install -U plotly
pip3 install -U kaleido  # For static image generation

# networkx
pip3 install -U networkx[default]

# pygraphviz
pip3 install -U pygraphviz

# pytorch
pip3 install torch torchvision torchaudio

# CPU variant
# pip3 install torch==1.10.1+cpu torchvision==0.11.2+cpu torchaudio==0.10.1+cpu -f https://download.pytorch.org/whl/cpu/torch_stable.html

# huggingface transformers
pip3 install -U transformers
python -c "from transformers import pipeline;print(pipeline('sentiment-analysis')('we love you'))" # Checking installation

# spacy transformers
pip3 install -U spacy-transformers

# jellyfish
pip3 install -U jellyfish

# markdown
pip3 install -U markdown

# mypy
pip3 install -U mypy

# natsort
pip3 install -U natsort

# pdfminer
pip3 install -U pdfminer.six

# flake8
pip3 install -U flake8

# jupyter
pip3 install -U jupyterlab notebook

# nlpaug
pip3 install nlpaug

# mkdocs and related
# https://mkdocstrings.github.io/recipes/
pip3 install mkdocs
pip3 install mkdocstrings
pip3 install mkdocstrings-python
pip3 install mkdocs-gen-files
pip3 install mkdocs-section-index
pip3 install mkdocs-literate-nav
pip3 install mkdocs-material
