#!/bin/bash

for filename in aa-commons-*; do
    if [ -f $filename ]; then
        continue
    fi
    if [ ! -f dist/$filename-*.tar.gz ]; then
        echo Missing artifact for package $filename
        exit -1
    fi
done
twine check dist/*

rm -rf dist/*.asc
for filename in dist/*.whl; do
    echo $filename
    gpg --detach-sign -a $filename
done
for filename in dist/*.tar.gz; do
    echo $filename
    gpg --detach-sign -a $filename
done

twine upload --verbose $@ dist/*.whl.asc dist/*.whl
