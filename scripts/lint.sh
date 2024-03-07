RET=0

for filename in aa-commons-*; do
    if [ -f $filename ]; then
        continue
    fi
    cd $filename

    black --check . 1>/dev/null 2>&1
    if [ $? -gt 0 ]; then
        black .
    fi
    isort --check . 1>/dev/null 2>&1
    if [ $? -gt 0 ]; then
        isort .
    fi
    OUT=$(FORCE_COLOR=1 pyright --warnings 2>&1)
    if [ $? -gt 0 ]; then
        echo -e "$OUT"
        RET=1
    fi

    cd ..
done

/bin/bash -c "exit $RET"
