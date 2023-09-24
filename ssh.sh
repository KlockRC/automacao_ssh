#!/bin/bash
#
#
# automaçao ssh
# Ruan Cesar

# variaveis
user="aluno"
senha="Senai@127"

shopt -s -o nounset

echo "instalaçao do ssh com criaçao automatica de usuario"

# verificando privilegios
if sudo -n true 2>/dev/null; then
    echo "O usuário tem privilégios sudo."
    sleep 2
else
    echo " pfv tenha permiçao sudo para executar esse script"
    echo "saindo..... "
    sleep 3
    exit 1
fi

# atualizando o sistema
echo "atualizando o sistema"
sleep 2
apt-get update -y && apt-get upgrade -y
sleep 4

# verificando a instalaçao do programa

if [ comand -v ssh &>/dev/null ]; then
    echo " o programa ja esta instalado "
    echo "saindo...."
    exit 1
else
    echo " instalando ssh"
    sleep 2
fi

#instalando o programa

apt-get install ssh -y

echo "deseja criar um usario? ( sim - nao )"
read re

if [[ $re = sim ]]; then
    echo "crindo o usuario"
    sleep 2
else
    echo "finalizando script"
    rm $0
    sleep 2
    exit 1
fi

#criando o usuario

adduser $user
echo -e "$senha\n$senha" | passwd $user
usermod -aG sudo $user
sleep 2

echo " programa finalizado"
echo " exibindo informaçoes"
sleep 2
echo " usuario: $user"
echo " senha: $senha"
sleep 1

rm $0

