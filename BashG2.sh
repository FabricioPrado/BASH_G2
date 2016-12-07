#!/bin/bash
#
# Trabalho G2 - RSYNC e SCP
# Nome: Fabricio Francisco do Prado
# Tecnologo em Redes de Computadores - Desenvolvimento de Redes



principal() {           # Função principal do programa
    clear               # limpa a tela

    echo "[1] SINCRONIZAR OS DADOS UTILIZANDO RSYNC"  # imprime na tela as opções que serão
    echo "[2] SOBRESCREVER OS DADOS UTILIZANDO SCP"  # abordadas no comando case
    echo "[3] Sair"
    echo ""
    echo -n "Qual a opcao desejada ? "
    read opcao          # faz a leitura da variável "opcao", 
                        # que será utilizada no comando case
                        # para indicar qual a opção a ser utilizada

                        # caso o valor da variável "opcao"...
    case $opcao in
        1)              # seja igual a "1", então faça as instruções abaixo
              clear
			echo "SINCRONIZAR OS DADOS UTILIZANDO RSYNC" 
			echo -n ""
			echo -n "Usuario e senha do PC de destino: " # Seleciona o usuario do SSH
			read USUARIO_SSH
			
			echo -n "Qual Porta SSH utilizar? "  # Seleciona a porta do SSH
			read PORTA_SSH
			
			echo -n "Digite o IPv4 do host remoto: "  # Seleciona o IP Remoto
			read IP_HOST
			
			echo -n "Digite o Caminho do Arquivo ou Pasta a ser copiado: "  # Seleciona o caminho do arquivo ou pasta
			read ARC_ORG
			
			echo -n "Digite o caminho de destino: "  # Seleciona o caminho de destino
			read DESTINO
	
		
            echo "Iniciando RSYNC" # RSYNC é usado para sincronizar os arquivos, ( -a = recursivo)
			rsync -avz -e "ssh -p $PORTA_SSH -l $USUARIO_SSH" --progress $ARC_ORG $IP_HOST:$DESTINO 
			
            ;;          # os 2 ";;" (ponto e virgula)
                        # significam que chegou ao final
                        # esta opção do comando case
        2)
            clear
			echo "SOBRESCREVER OS DADOS UTILIZANDO SCP" 
			echo -n ""
						
			echo -n "Usuario e senha do PC de destino: " # Seleciona o usuario do SSH
			read USUARIO_SSH
			
			echo -n "Digite o IPv4 do host remoto: "  # Seleciona o IP Remoto
			read IP_HOST
			
			echo -n "Digite o Caminho do Arquivo ou Pasta a ser copiado: "  # Seleciona o caminho do arquivo ou pasta
			read ARC_ORG
			
			echo -n "Digite o caminho de destino: "  # Seleciona o caminho de destino
			read DESTINO
	
			echo "Iniciando SCP" # Sobrescrever os dados
			scp -r -P $USUARIO_SSH $ARC_ORG $USUARIO_SSH@$IP_HOST:$DESTINO 
            ;; # Finaliza a opção do case com ";;"
			
       
        3)
            clear
            exit ;;
        *)              # esta opçao existe para caso o usuário digite um 
                        # valor diferente de 1, 2 ou 3
            opcao_invalida ;;
    esac
}


opcao_invalida() {      # função da opção inválida
    clear
    echo "Opcao desconhecida."
    read pause
    principal
}