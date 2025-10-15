#!/bin/bash
# ============================================
# ⚙️ install.sh
# Instala dependências básicas e prepara ambiente DevOps.
# ============================================

set -e

echo "🚀 Iniciando instalação do Mini Toolkit DevOps..."

# Atualiza pacotes
sudo apt update -y && sudo apt upgrade -y

# Instala dependências
sudo apt install -y docker.io docker-compose curl git unzip jq

# Habilita Docker no boot
sudo systemctl enable docker
sudo systemctl start docker

# Cria diretórios padrões
mkdir -p /home/ubuntu/backups /home/ubuntu/logs

# Permissões
sudo chmod +x toolkit/**/*.sh
sudo chmod +x toolkit/*.sh

echo "✅ Ambiente configurado com sucesso!"
