#!/bin/bash

if [ -z "$DIVVY_PROJECT_ROOT" ]; then
  echo "Error: DIVVY_ROOT environment variable is not set."
  exit 1
fi

# change a current working directory
output_dir="${DIVVY_PROJECT_ROOT}/data"  # all the data is saved under /data
cd ${output_dir}

# download the files
years=(2020 2021 2022 2023 2024 2025)
months=(1 2 3 4 5 6 7 8 9 10 11 12)
base_url="https://divvy-tripdata.s3.amazonaws.com"
for year in "${years[@]}"; do
  for month in "${months[@]}"; do
    # Zero-pad month to two digits (e.g., 1 -> 01)
    month_padded=$(printf "%02d" "$month")
    file="${year}${month_padded}-divvy-tripdata.zip"
    url="${base_url}/${file}"

    echo "Downloading ${file}..."
    wget "${url}"  # download the zip file

    unzip "${file}"  # unzip the zip file
    rm "${file}"  # remove the zip file
  done
done