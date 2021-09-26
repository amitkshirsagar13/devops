#!/bin/sh
cat > ./vault/volumes/config/vault.json << EOF
{
  "backend": {
    "file": {
      "path": "/vault/file"
    }
  },
  "listener": {
    "tcp":{
      "address": "0.0.0.0:8200",
      "tls_disable": 1
    }
  },
  "ui": true
}
EOF

cat > ./vault/docker-compose.yml << EOF
version: '2'
services:
  vault:
    image: vault
    container_name: vault
    ports:
      - "8200:8200"
    restart: always
    volumes:
      - ./vault/volumes/logs:/vault/logs
      - ./vault/volumes/file:/vault/file
      - ./vault/volumes/config:/vault/config
    cap_add:
      - IPC_LOCK
    entrypoint: vault server -config=/vault/config/vault.json
EOF

docker-compose up