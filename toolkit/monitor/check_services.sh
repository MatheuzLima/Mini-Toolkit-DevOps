#!/bin/bash
# toolkit/monitor/check_services.sh
# Verifica se containers essenciais estão rodando

SERVICES=("traefik" "postgres" "mini-toolkit-api")

echo "🔍 Verificando status dos serviços..."

for SERVICE in "${SERVICES[@]}"; do
  if docker ps --filter "name="$SERVICE"" --filter "status=running" | grep -q "$SERVICE"; then
    echo "✅ "$SERVICE" está rodando"
  else
    echo "❌ "$SERVICE" está parado. Tentando reiniciar..."
    docker start "$SERVICE" || echo "⚠️ Falha ao reiniciar "$SERVICE""
  fi
done
