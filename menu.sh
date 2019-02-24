#!/bin/sh

# Inicializar variavel
OPCAO=2
INTERFACE=$1


while [ $OPCAO != 0 ]
do

	clear
	echo MENU
	echo 0- Sair
	echo 1- Listar regras IPFW
	echo 2- Adicionar regra IPFW 
	echo 3- Deletar regra IPFW
	echo 4- Modificar regras manualmente
	echo -n "Opcao: "

	read OPCAO
	clear

	if [ -z $OPCAO ]
        then
                OPCAO=2
        fi

	case $OPCAO in

		0)

			tmux kill-session -t monitor_IPFW

			break;;

		1)

			ipfw list | more ;;	

		2)

			echo -n "Numero da regra: "
			read number
			clear

			echo -n "Tipo da regra(deny|premit): "
			read RULE
			clear

			echo -n "Protocolo(ex.: ip|icmp|tcp|udp|all): "
			read protocol
			clear	

			echo -n "Rede de origem(ex.: 10.0.0.1/32): "
			read net_origin
			clear

			echo -n "Rede de destino(ex.: 10.1.0.2/32: "
			read net_destiny
			clear

			echo -n "Porta de Origem: "
			read port_origin
			clear

			echo -n "Porta de destino: "
			read port_destiny		
			clear

			echo -n "Fluxo do trafego(in/out): "
			read FLOW

			ipfw add $number $RULE  $protocol from $net_origin $port_origin to $net_destiny $port_destiny $FLOW via $INTERFACE ;;

		3)

			echo -n "Numero da regra a ser deletada: "
			read number
			clear

			ipfw delete $number ;;

		4)


			OPCOMMAND=c

        	        while [ $OPCOMMAND == 'c' ]
                	do

                                echo -n "# "
	                        read COMMAND
        	                $COMMAND
	                        echo "$COMMAND"
        	                echo
	                        echo -n "Digite (c = executar outro comando): "
	                        read OPCOMMAND

        	        done ;;			

		*)

			echo "Opcao Invalida"
                        echo "Aperte Enter para continuar"
                        read VAR ;;

	esac

done
