# n8n stack com ngrok

Compose com Postgres, Redis, n8n (web + worker) e ngrok para exposicao publica.

## Requisitos
- Docker + Docker Compose
- Token e dominio do ngrok (dashboard.ngrok.com)

## Configurar variaveis
1. Copie o exemplo: `cp .env-sample .env`
2. Edite `.env` e preencha ao menos:
   - `NGROK_AUTHTOKEN`
   - `N8N_HOST` e `WEBHOOK_URL` com o dominio reservado do ngrok (`https://...ngrok-free.dev`)
3. Opcional: ajuste fuso (`GENERIC_TIME_ZONE`) e demais flags do n8n se precisar.

## Permissoes de volume (Linux)
Antes do primeiro `up`, garanta dono/permite 1000:1000:
```bash
chmod +x setup-permissions.sh
./setup-permissions.sh
# ou manual:
mkdir -p n8n-data postgres_data redis_data
sudo chown -R 1000:1000 n8n-data
chmod -R 755 n8n-data
```

## Subir e verificar
```bash
docker compose up -d
docker compose ps

# Verificar ngrok e pegar URL publica
docker compose logs -f ngrok
# Inspector local: http://localhost:4040
```

## Reset de usuario (CLI n8n)
```bash
# Git Bash (evita reescrita de paths)
MSYS_NO_PATHCONV=1 MSYS2_ARG_CONV_EXCL='*' docker exec -it n8n-ftr-n8n-1 n8n user-management:reset

# PowerShell/CMD
docker exec -it n8n-ftr-n8n-1 n8n user-management:reset
```

## Problemas comuns
- `ERR_NGROK_8012` / connection refused: confirme que o n8n esta em UP (`docker compose ps`) e acessivel internamente `docker compose run --rm --network n8n-ftr alpine sh -c "apk add --no-cache curl >/dev/null && curl -I http://n8n:5678"`.
- Git Bash mudando `/bin/sh`: use `MSYS_NO_PATHCONV=1 MSYS2_ARG_CONV_EXCL='*'` ao rodar `docker exec` com shell/comandos.
