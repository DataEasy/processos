#!/usr/bin/env expect -f
spawn scp -r . processos@processos.dataeasy.com.br:.
expect "password:"
send "processos\r"
expect eof
