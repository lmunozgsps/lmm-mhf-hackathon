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

## Cómo correr / desplegar

El listener está parametrizado (`${http.host}` / `${http.port}`, default `0.0.0.0:8081`)
y el agent-card anuncia `${agent.publicUrl}`. Así el mismo artefacto sirve local y en CloudHub.

### Local (Studio · Run As → Mule Application)
VM arguments:
```
-Dmule.key=<TU_MASTER_KEY>
-Dhttp.port=8082
-Dagent.publicUrl=http://localhost:8082/agent
```
Prueba directa (conector A2A 2.0.0 → método `SendMessage`):
```bash
curl -s -X POST http://localhost:8082/agent \
  -H "Content-Type: application/json" -H "A2A-Version: 1.0" \
  -d @../demo/payloads/regina-agent-turn1.json | jq .
```

### CloudHub 2.0 (Runtime Manager)
1. Desplegar el `.jar` (`lmm-regina-mty-a2a-agent-1.0.0-mule-application.jar`) al org `nrik4c` / región `can-c1`.
2. Dejar `http.port` en **8081** (default — NO ponerlo en 8082; la plataforma enruta a 8081).
3. Propiedades del deployment:
   - `mule.key` = tu master key (marcar como **secured property**).
   - `agent.publicUrl` = `https://<nombre-app>-<sufijo>.<region>.cloudhub.io/agent`
     (se conoce tras el primer deploy; setéala y reinicia para que el agent-card la anuncie).
4. Verificar: `GET https://<url-publica>/agent/.well-known/agent-card.json` → Regina / Monterrey / 3 skills.

## Checklist

- [ ] Clonado desde Diego
- [ ] Agent-card con las 3 skills y naming `lmm-regina-mty-a2a-agent`
- [ ] `agent.prompt` con personalidad regia + "Tip de guía local"
- [ ] Consume `maf-hackathon-proxy` (con `mule.key`)
- [ ] Object Store con ventana de 10 verificado
- [ ] Desplegado a CloudHub 2.0
