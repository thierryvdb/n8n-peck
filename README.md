# n8n stack com ngrok

## Preparar variáveis
- Copie o arquivo de exemplo: `cp .env-sample .env`
- Edite `.env` com seu `NGROK_AUTHTOKEN` e URL do ngrok (obtenha em https://dashboard.ngrok.com)

## Corrigir permissões (Ubuntu/Linux)
**IMPORTANTE**: Execute antes de subir a stack pela primeira vez:

```bash
chmod +x setup-permissions.sh
./setup-permissions.sh
```

Ou manualmente:
```bash
mkdir -p n8n-data postgres_data redis_data
sudo chown -R 1000:1000 n8n-data
chmod -R 755 n8n-data
```

## Subir stack
```bash
docker compose up -d

# Verificar ngrok e copiar URL pública
docker compose logs -f ngrok
# Inspector: http://localhost:4040
```

## Reset de usuário (CLI n8n)
```bash
# Git Bash: evitar reescrita de paths
MSYS_NO_PATHCONV=1 MSYS2_ARG_CONV_EXCL='*' docker exec -it n8n-ftr-n8n-1 n8n user-management:reset

# PowerShell/CMD
docker exec -it n8n-ftr-n8n-1 n8n user-management:reset
```
