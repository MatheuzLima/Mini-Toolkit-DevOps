#!/bin/bash
set -e

echo "🚀 Verificando ambiente Mini Toolkit DevOps..."

# Verifica se Docker já existe
if ! command -v docker &> /dev/null
then
  echo "🐳 Docker não encontrado. Instalando..."
  sudo apt update -y && sudo apt install -y docker.io docker-compose
  sudo systemctl enable docker
  sudo systemctl start docker
else
  echo "✅ Docker já está instalado. Pulando etapa..."
fi

# Dependências adicionais
sudo apt install -y curl git unzip jq

mkdir -p /home/ubuntu/backups /home/ubuntu/logs
sudo chmod +x toolkit/**/*.sh toolkit/*.sh

echo "✅ Ambiente pronto!"