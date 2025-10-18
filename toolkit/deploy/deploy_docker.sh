#!/bin/bash
# toolkit/deploy/deploy_docker.sh
# Deploy manual com rebuild local

set -e

echo "🚀 Realizando deploy da aplicação..."

cd ~/mini-toolkit-devops/app
docker stop mini-toolkit-api || true
docker rm mini-toolkit-api || true
docker build -t mini-toolkit-api:latest .

docker run -d \
  --name mini-toolkit-api \
  --network web \
  -l "traefik.enable=true" \
  -l 'traefik.http.routers.mini-toolkit.rule=Host("toolkit-api.sparkflux.com.br")' \
  -l "traefik.http.routers.mini-toolkit.entrypoints=websecure" \
  -l "traefik.http.routers.mini-toolkit.tls.certresolver=letsencrypt" \
  -l "traefik.http.services.mini-toolkit.loadbalancer.server.port=3000" \
  mini-toolkit-api:latest

echo "✅ Deploy finalizado!"
