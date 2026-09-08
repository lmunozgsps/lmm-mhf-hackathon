# Reto 3 — `lmm-regina-mty-a2a-agent` (20%)

Nuevo agente **A2A** (patrón Mateo/Diego) para **Monterrey**.

## Skills mínimas (agent-card)

| Skill | Descripción |
|-------|-------------|
| `crear_itinerario` | Itinerarios multi-día optimizados por colonias/zonas |
| `recomendar_gastronomia` | De cabrito y taquerías a alta cocina regia |
| `consejos_logistica_seguridad` | Tiempos de traslado (Metrorrey, Ecovía), seguridad, clima |

## Personalidad

Tono **cálido y con orgullo regio**. Pedir contexto antes de armar itinerarios a ciegas
(duración, presupuesto, intereses, con quién viaja). Cerrar con un **"Tip de guía local"**.

## Cómo construirlo

1. **Plantilla:** clonar `gor-a2a-diego-gdl` (Mule **4.11.4** EE, Java 17,
   `mule4-a2a-connector 2.0.0`).
2. **Agent card** (JSON inline): cambiar `name`/`display_name`/`description`/`skills` y
   `language: es-MX`. Servicio: `lmm-regina-mty-a2a-agent`.
3. **`src/main/resources/agent.prompt`:** reescribir rol/personalidad de Regina (Monterrey).
4. **Config:** `config/config.yaml` (LLM proxy + `agent.publicUrl`);
   `config/secure/config.yaml` (`client_id`/`client_secret` cifrados, requieren `mule.key`).
5. **Memoria:** Object Store con **ventana deslizante de 10 mensajes** (ya en el flow `preLLM`).
6. **A2A 2.0.0 (breaking):** `<a2a:interfaces>` explícito + `<a2a:update-task-status>`
   (ya presentes en la plantilla Diego).

## Checklist

- [ ] Clonado desde Diego
- [ ] Agent-card con las 3 skills y naming `lmm-regina-mty-a2a-agent`
- [ ] `agent.prompt` con personalidad regia + "Tip de guía local"
- [ ] Consume `maf-hackathon-proxy` (con `mule.key`)
- [ ] Object Store con ventana de 10 verificado
- [ ] Desplegado a CloudHub 2.0
