#!/usr/bin/env expect -f
spawn ssh -o "StrictHostKeyChecking no" processos@processos.dataeasy.com.br rm -rf *
expect "password:"
send "processos\r"

spawn scp -C -o "StrictHostKeyChecking no" -r . processos@processos.dataeasy.com.br:.
expect "password:"
send "processos\r"

expect eof
