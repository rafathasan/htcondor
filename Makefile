CURR_DIR_NAME = $(notdir $(PWD))
DATA_ZIP_DIR = $(DATA)/$(CURR_DIR_NAME).zip
SIF_FILE = $(DATA)/$(CURR_DIR_NAME).sif

build:
	if [ -f "$(SIF_FILE)" ]; then \
		echo "$(SIF_FILE) already exists. Skipping container build."; \
	else \
		apptainer build $(SIF_FILE) apptainer.def; \
	fi
	if [ -f "$(DATA_ZIP_DIR)" ]; then \
		echo "$(DATA_ZIP_DIR) already exists. Skipping zip creation."; \
	else \

	fi

clean:

submit:
	@if [ -f $(SIF_FILE) ]; then \
		mkdir -p jobs && \
		condor_submit job.sub; \
	else \
		echo "Error: $(SIF_FILE) does not exist. Please run 'make build' first."; \
		exit 1; \
	fi
