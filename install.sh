#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -s  ${SCRIPT_DIR}"/"${f} ${HOME}"/"${f}
done
