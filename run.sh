#!/bin/bash
CURR_DIR_NAME = $(notdir $(PWD))
DATA_ZIP_DIR = $(DATA)/$(CURR_DIR_NAME).zip

# Prepare data

unzip ${DATA_ZIP_DIR}
rm ${DATA_ZIP_DIR}

# Execute command below