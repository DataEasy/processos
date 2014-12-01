#!/usr/bin/env expect -f
spawn scp -o "StrictHostKeyChecking no" -r . processos@processos.dataeasy.com.br:.
expect "password:"
send "processos\r"
expect eof
