#!/bin/bash

for file in *.tsv; do
        folder_name="${file%.tsv}"
        mkdir -p "$folder_name"
        mv "$file" "$folder_name/"
done
