#!/bin/bash
# toolkit/utils/clean_docker.sh
# Limpa containers, volumes e imagens não usados

echo "🧹 Limpando Docker..."
docker system prune -af --volumes
echo "✅ Docker limpo!"