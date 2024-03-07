#!/bin/bash

rm -rf dist/*
for filename in aa-commons-*; do
    if [ -f $filename ]; then
        continue
    fi
    python -m build -o dist $filename
done
