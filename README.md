

## Prerequistie

Install the virtual environment using `uv`. This installs a virtual environment under `.venv/`. You can set your python interpreter accordingly.
```bash
uv sync
```

Set the following environment variable:
```bash
export DIVVY_PROJECT_ROOT="path/to/this/project"
```

## Download the data

Run
```bash
bash utils/download_divvy_files.sh
```
It'll download all the datasets from https://divvy-tripdata.s3.amazonaws.com/index.html.