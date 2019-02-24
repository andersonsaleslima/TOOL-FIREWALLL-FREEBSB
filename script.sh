#!/bin/sh

INTERFACE=$1
IP_REDE=$2


echo "Ativando IPFW com politica DEFAULT ALLOW ALL com ID 65000"
kldload ipfw && ipfw -q add 65000 allow all from any to any
if [ $? -ne 0 ]
then
        echo "Erro ao Ativar IPFW com politica DEFAULT ALLOW ALL"
	exit
fi

# Criacao de painel
tmux new-session -d -s monitor_IPFW

# divisao do painel
tmux split-window -v

# execucao de comando no painel 0
tmux send-keys -t 0 C-z "tcpdump -i $INTERFACE net $IP_REDE" Enter

# Selcionar painel 1
tmux select-pane -t 1

# Executar menu  
tmux send-keys -t 1 C-z "./menu.sh $INTERFACE" enter

tmux -2 attach-session -d

