#!/bin/bash
# toolkit/utils/rebuild_network.sh
# Reconstrói rede Docker (caso corrompida)

set -e

# Nome da rede
NETWORK_NAME="web"

# Verifica se a rede já existe
if docker network inspect $NETWORK_NAME >/dev/null 2>&1; then
  echo "✅ Rede '$NETWORK_NAME' já existe, mantendo a atual."
else
  echo "ℹ️ Rede '$NETWORK_NAME' não encontrada, criando..."
  docker network create $NETWORK_NAME --driver bridge
  echo "✅ Rede '$NETWORK_NAME' criada!"
fi

# (Opcional) Exemplo de como conectar um contêiner existente à rede, se necessário)
# docker network connect $NETWORK_NAME nome_do_container
