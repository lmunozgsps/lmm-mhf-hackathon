#!/usr/bin/env bash
# Pruebas contra el Travel Broker para los retos de código.
# Uso: BROKER_URL="https://.../travel_broker" bash curls.sh
set -euo pipefail

BROKER_URL="${BROKER_URL:-https://agent-network-ingress-gw-uoraeq.nrik4c.can-c1.cloudhub.io/travel_broker}"
HDRS=(-H "Content-Type: application/json" -H "A2A-Version: 1.0")

echo "== 1) Saludo simple =="
curl -s "${HDRS[@]}" -X POST "$BROKER_URL" -d @payloads/a2a-hola.json | jq .

echo "== 2) Recomendacion local (Monterrey -> Regina) =="
curl -s "${HDRS[@]}" -X POST "$BROKER_URL" -d @payloads/a2a-monterrey.json | jq .

echo "== 3) Hoteles en CDMX (MCP hoteles) =="
curl -s "${HDRS[@]}" -X POST "$BROKER_URL" -d @payloads/a2a-hoteles.json | jq .
