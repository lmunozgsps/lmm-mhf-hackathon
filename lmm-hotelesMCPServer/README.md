# Reto 1 — `lmm-hotelesMCPServer` (20%)

Servidor **MCP nativo** (no wrapper REST) para operaciones de hoteles en CDMX.

## Tools requeridas

| Tool | Descripción | Params clave |
|------|-------------|--------------|
| `search_hotels` | Buscar hoteles por zona, precio, estrellas | `area`, `price_min`, `price_max`, `min_stars` |
| `check_availability` | Disponibilidad + precio total por fechas | `hotel_id`, `checkin_date`, `checkout_date`, `room_type`, `num_rooms` |
| `create_reservation` | Reserva simulada con datos de contacto | `hotel_id`, fechas, `room_type`, `num_rooms`, contacto |

## Cómo construirlo

1. **Plantilla:** partir de `gor-flight-mcp-server` (patrón `<mcp:server-config>` +
   `<mcp:streamable-http-server-connection>` + un `flow` por tool con `<mcp:tool-listener>` /
   `<mcp:description>` / `<mcp:parameters-schema>`).
2. **Asset:** `mock/hotels.json` (incluido). Al crear el proyecto Mule, moverlo a
   `src/main/resources/mock/hotels.json` y leerlo con `readUrl("classpath://mock/hotels.json")`.
3. **Lógica DataWeave:** el README de `cdmx-hotels-api` trae el DW de los 3 tools casi listo.
4. **Persistencia** de `create_reservation`: Object Store (opcional en mock).
5. **Runtime:** Mule 4.11 EE (Java 17), conector MCP. Puerto local `8081`, `/health`.

## Enums de validación

- `area`: Polanco · Roma Norte · Condesa · Historic Center · Santa Fe · Reforma · Coyoacán · Del Valle · Zona Rosa · Airport (Terminal 1/2)
- `room_type`: single · double · suite · family

## Checklist

- [ ] Proyecto Mule creado; `hotels.json` movido a `src/main/resources/mock/`
- [ ] 3 tools con schema JSON válido y `description` claras
- [ ] `/health` responde
- [ ] Probado localmente (MCP inspector / curl)
- [ ] Desplegado a CloudHub 2.0 como `lmm-hotelesMCPServer`
