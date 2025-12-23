# n8n stack com ngrok

## Preparar variáveis
- Edite `.env` com seu `NGROK_AUTHTOKEN` (e ajuste host/domínio se mudar o túnel).

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
