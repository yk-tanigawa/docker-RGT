# FROM python:3-slim
FROM jupyter/datascience-notebook:latest
RUN pip install cython numpy scipy 
# RUN pip install pyBigWig
RUN conda install pybigwig -c bioconda
RUN pip install RGT
