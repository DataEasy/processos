#!/usr/bin/env sh
OPTION=$JENKINS_SSH_KEY_FILE
PARAM="-i $JENKINS_SSH_KEY_FILE"

if [ "${OPTION+x}" = "x" ]; then
    PARAM=""
fi

ssh -o "StrictHostKeyChecking no" $PARAM processos@processos.dataeasy.com.br rm -rf *
scp -C -o "StrictHostKeyChecking no" $PARAM -r . processos@processos.dataeasy.com.br:.

