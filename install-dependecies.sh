echo "Instaladno TCPDump"
pkg install -y tcpdump

if [ $? -ne 0 ]
then
        echo "Pacote Tcpdump não instalado"
        exit
fi

echo "Instaladno tmux"
pkg install -y tmux

if [ $? -ne  0 ]
then
        echo "Pacote tmux não instalado"
        exit
fi
