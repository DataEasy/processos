#!/usr/bin/env sh
ssh -o "StrictHostKeyChecking no" processos@processos.dataeasy.com.br rm -rf *
scp -C -o "StrictHostKeyChecking no" -r . processos@processos.dataeasy.com.br:.

