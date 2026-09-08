# Demo — retos de código

Pruebas contra el **Travel Broker** para validar tus componentes (Regina y MCP de hoteles).

- **POST** al broker + ruta `/agent` que exponga el ingress.
- Headers: `Content-Type: application/json`, `A2A-Version: 1.0`.
- Body: JSON-RPC 2.0 (`message/send`). Multi-turno: reenviar el `contextId` de la respuesta previa.

Ver `curls.sh` y `payloads/`.

## Escenarios incluidos

1. `a2a-hola` — saludo simple (broker responde directo).
2. `a2a-monterrey` — recomendación local → debe delegar a **Regina** (Reto 3).
3. `a2a-hoteles` — hoteles en CDMX → debe usar tu **MCP de hoteles** (Reto 1).

> El formato exacto del envelope A2A conviene confirmarlo contra el agent-card del broker
> antes de la demo.
