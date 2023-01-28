#!/bin/bash

grupos=("GRP_ADM" "GRP_VEN" "GRP_SEC")
diretorios=("publico" "adm" "ven" "sec")
usuarios_adm=("carlos" "maria" "joao")
usuarios_ven=("debora" "sebatiana" "roberto")
usuarios_sec=("josefina" "amanda" "rogerio")

echo "Criando diretórios"

for diretorio in ${diretorios[@]}; do 
    mkdir "/$diretorio"
    echo "Diretorio $diretorio criado"
done

echo "Criando grupos"

for grupo in ${grupos[@]}; do 
    echo "Grupo $grupo criado"
    groupadd $grupo
done

echo "Criando usuários"

for adm in ${usuarios_adm[@]}; do 
    echo "Usuário $adm adm criado"
    useradd $adm -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_ADM
done

for ven in ${usuarios_adm[@]}; do 
    echo "Usuário $ven ven criado"
    useradd $ven -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_VEN
done

for sec in ${usuarios_sec[@]}; do 
    echo "Usuário $sec sec criado"
    useradd $sec -m -s /bin/bash -p $(openssl passwd Senha123) -G GRP_SEC
done

echo "Adicionando permissões dos diretórios"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Script executado com exito!"

# Fiz algumas modificações nos comandos, -crypt no openssl não é necessário e substitui as diversas sentenças pelo loop
