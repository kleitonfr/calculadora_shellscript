#!/bin/bash

echo "Olá $USER, use a calculadora abaixo para realizar seus cálculos"

echo "Os valores serão armazenados em um arquivo.csv no pasta $USER/calculadora"



caminho_dir="/home/kleiton/projetos/calculadora"
caminho_pasta="/mnt/c/Users/kleyt/OneDrive/Área de Trabalho/EBAC/PROJETOS/calculadora"
arquivo_ubun="$caminho_dir/dados.csv"
arquivo_win="$caminho_pasta/dados.csv"
resposta="S"


#verifica se há o diretorio calculadora.

if [ ! -d "$caminho_dir" ]; then
	mkdir -p "$caminho_dir"
	echo "Diretório $caminho_dir criado."
fi


if [ ! -d "$caminho_pasta" ]; then
	mkdir -p "$caminho_pasta"
	echo "Diretório $caminho_pasta criado"
fi

#verfica se o arquivo dados.csv existe e criá-lo se não.

if [ ! -f "$arquivo_ubun" ]; then
	echo "usuario,data,resultado" > "$arquivo_ubun"
	echo "Arquivo $arquivo_ubun criado."
fi


if [ ! -f "$arquivo_win" ]; then
	echo "usuario,data,resultado" > "$arquivo_win"
	echo "Arquivo $arquivo_win criado."
fi


#executa a calculdadora.py e armazena as respostas no arquivo dados.csv

while [ "$resposta" = "S" ]; do
	python3 "/home/kleiton/projetos/calculadora.py"
	RESULTADO=$(tail -n 1 resultado.txt)
	data_atual=$(date +"%d/%m/%Y %H:%M:%S")
	echo "$USER,$data_atual,$RESULTADO" >> "$arquivo_ubun"
	echo "$USER,$data_atual,$RESULTADO" >> "$arquivo_win"
	read -p "Deseja realizar outro cálculo? [N ou S]" resposta
	resposta=$(echo "$resposta" | tr '[:lower:]' '[:upper:]')
done

