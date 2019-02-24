#!/bin/sh

echo "Instaladno TCPDump"
pkg install -y tcpdump

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

