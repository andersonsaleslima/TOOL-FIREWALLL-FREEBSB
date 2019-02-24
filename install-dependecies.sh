#!/bin/bash

if (( $? != 0 ))
then
        echo "Pacote Tcpdump não instalad"
        exit
fi

echo "Instaladno tmux"
pkg install -y tmux

if (( $? != 0 ))
then
        echo "Pacote tmux não instaldo"
        exit
fi

