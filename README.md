# MHF Hackathon 2026 — Retos de código (`lmm`)

Entrega de los **retos de código** del MuleSoft Agentic Fabric (MAF) Hackathon 2026.
Este repo contiene únicamente los dos componentes que producen proyecto Mule + los assets
necesarios para probarlos. Los retos no-code (Bridge de Restaurantes y Governance) se
documentan/evidencian por separado.

## Componentes

| # | Reto | Carpeta | Tipo |
|---|------|---------|------|
| 1 | MCP de Hoteles CDMX | [`lmm-hotelesMCPServer/`](lmm-hotelesMCPServer/) | Proyecto Mule (a generar) |
| 3 | Agente A2A Regina (Monterrey) | [`lmm-regina-mty-a2a-agent/`](lmm-regina-mty-a2a-agent/) | Proyecto Mule (a generar) |
| — | Demo end-to-end | [`demo/`](demo/) | curls + payloads |

## Assets incluidos

- `lmm-hotelesMCPServer/mock/hotels.json` — catálogo mock de 50 hoteles CDMX (10 zonas, MXN).
  Al crear el proyecto Mule, mover a `src/main/resources/mock/hotels.json`.

## Plantillas de referencia (repo de assets)

- Reto 1 → `hackathon-maf-2026-assets/gor-flight-mcp-server` (patrón MCP nativo).
- Reto 3 → `hackathon-maf-2026-assets/gor-a2a-diego-gdl` (patrón A2A 2.0.0).

## Requisitos / secretos (NO commitear)

- `mule.key` (Secure Properties master key) → `-Dsecure.key=<key>` para los agentes A2A.
- Credenciales del LLM Proxy (`client_id` / `client_secret`) — cifradas, requieren `mule.key`.

## Endpoints del ecosistema (provistos)

| Componente | Endpoint |
|---|---|
| Travel Broker | `https://agent-network-ingress-gw-uoraeq.nrik4c.can-c1.cloudhub.io/travel_broker/` |
| LLM Proxy | `https://agent-network-egress-gw-uoraeq.nrik4c.can-c1.cloudhub.io/maf-hackathon-proxy` |

Org `nrik4c` · región `can-c1`. Runtime: Mule 4.11 · A2A 2.0.0 · MCP 2025-06-18.

> **Naming:** este repo usa el prefijo `lmm-` (coincide con el nombre de la carpeta).
> Si tu prefijo oficial de equipo es `lmg`, renombra los proyectos antes de desplegar.
