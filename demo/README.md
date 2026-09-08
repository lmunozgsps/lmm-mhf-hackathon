# Demo — retos de código

Dos formatos distintos según a quién le pegues:

## 1. Directo al agente Regina (conector A2A 2.0.0)
- **POST** a `http://<host>:8082/agent` (local) o la URL pública del agente.
- Headers: `Content-Type: application/json`, **`A2A-Version: 1.0`** (obligatorio).
- Body JSON-RPC 2.0 con **`"method":"SendMessage"`**, **`"role":"ROLE_USER"`**, parts sin `kind`.
- Multi-turno: reenviar el `contextId` de la respuesta previa (valida el Object Store).
- Payloads: `payloads/regina-agent-turn1.json`, `payloads/regina-agent-turn2.json`.

## 2. A través del Travel Broker (A2A v1.0 externo)
- **POST** al broker + ruta que exponga el ingress.
- Headers: `Content-Type: application/json`, `A2A-Version: 1.0`.
- Body JSON-RPC 2.0 (`message/send`, `role:user`). Multi-turno: `contextId`.
- Payloads: `payloads/a2a-*.json`.

Ver `curls.sh`.

## Escenarios incluidos

1. `a2a-hola` — saludo simple (broker responde directo).
2. `a2a-monterrey` — recomendación local → debe delegar a **Regina** (Reto 3).
3. `a2a-hoteles` — hoteles en CDMX → debe usar tu **MCP de hoteles** (Reto 1).

> El formato exacto del envelope A2A conviene confirmarlo contra el agent-card del broker
> antes de la demo.
