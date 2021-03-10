#!/usr/bin/env bash
# Script que facilita o envio de emails de trabalhos
# Esse script supõe uma configuração váida de msmtp em ./send.conf, e variáveis de ambientes adequadas em ./send.env
set -e
set -u
script_dir="$(dirname "${BASH_SOURCE[0]}")"
source "${script_dir}/send.env"  # Dados escondidos do repositório público

echo "Insira o número do lab:"
read -r no

email="\
To: ${TO}
Subject: ${MATRICULA}_${NOME}_lab${no}_pf

Segue o link para o repositório com o trabalho semanal: https://github.com/agstrc/ufu-pf/tree/UFU/Trabalhos%20Semanais
"

echo -e "---\n${email}\n---\nO email acima está de acordo? [y/N]"
read conf
[[ "${conf}" == "y" ]]  # diferente de y irá cancelar o script devido ao 'set -e'


echo "${email}" | msmtp -v -C "${script_dir}/send.conf" -a "${ACCOUNT}" -F'Davi Augusto' "${TO}"
