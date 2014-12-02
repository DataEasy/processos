#!/usr/bin/env bash

SSH_PARAM='-o "StrictHostKeyChecking no"'
if [ "${JENKINS_SSH_KEY_FILE}x" != "x" ]; then
    SSH_PARAM="$SSH_PARAM -i $JENKINS_SSH_KEY_FILE"
fi

rsync -hrvz \
    -e "ssh ${SSH_PARAM}" \
    --exclude=.git/ \
    --exclude=${0##*/} \
    --exclude=Icon* \
    --exclude=.gitignore \
    --exclude=.DS_Store \
    . processos@processos.dataeasy.com.br:.
