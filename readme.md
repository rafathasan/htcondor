# Submitting a Job with HTCondor

Follow these steps to submit your project as an HTCondor job using the provided repository and container setup.

## 1. Clone the Repository

First, clone the HTCondor setup repository:

```bash
git clone https://github.com/rafathasan/htcondor.git
cd htcondor
```

## 2. Copy Your Project Files

Copy your Python project files (scripts, data, etc.) into the cloned `htcondor` directory:

```bash
cp -r /path/to/your/project/* ./your_project_folder/
```

## 3. Update Python Version in `apptainer.def`

Edit the `apptainer.def` file to set the desired Python version. Example for Python 3.12:

```Dockerfile
Bootstrap: docker
From: python:3.12

%files
    ./requirements.txt /requirements.txt

%post
    apt-get update
    apt-get install -y zip
    pip install -r /requirements.txt
```

## 4. Update `requirements.txt`

List all the Python dependencies your project needs in `requirements.txt`:

```text
numpy
pandas
scikit-learn
# add other libraries your project requires
```

## 5. Modify `run.sh` to Add Python Execution Command

Edit `run.sh` to prepare and execute your script. Here’s a template:

```bash
#!/bin/bash

CURR_DIR_NAME=$(basename "$PWD")
DATA_ZIP_DIR="${DATA}/${CURR_DIR_NAME}.zip"

# Prepare data
unzip "${DATA_ZIP_DIR}"
rm "${DATA_ZIP_DIR}"

# Execute Python script
python your_script.py
```

> Replace `your_script.py` with the entry point of your project.
