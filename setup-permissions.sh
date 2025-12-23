#!/bin/bash

# Script para corrigir permissões dos diretórios do n8n no Ubuntu

echo "Corrigindo permissões dos diretórios..."

# Cria os diretórios se não existirem
mkdir -p n8n-data postgres_data redis_data

# Ajusta as permissões (UID 1000 é o padrão do container n8n)
sudo chown -R 1000:1000 n8n-data
chmod -R 755 n8n-data

# Permissões para postgres e redis
sudo chown -R 999:999 postgres_data
sudo chown -R 999:999 redis_data

echo "✅ Permissões corrigidas!"
echo "Agora execute: docker compose up -d"
