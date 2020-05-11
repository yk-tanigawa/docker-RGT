# FROM python:3-slim
FROM jupyter/datascience-notebook:latest

USER root
RUN apt-get update
RUN apt-get install -y libcurl4-gnutls-dev zlib1g-dev

USER jovyan
RUN pip install cython numpy scipy pyBigWig RGT

