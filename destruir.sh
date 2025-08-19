#!/bin/bash
set -e

echo "Isso destruira tudo lab, tem certeza?"
echo
read -p "Continuar? (yes/NO): " confirm

if [[ "$confirm" == "yes" ]]; then
  terraform destroy -auto-approve
else
  echo "Operação cancelada"
fi
