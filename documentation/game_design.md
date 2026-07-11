# Green Tide - Game Design (v0.1)

## High Concept

Green Tide es un juego incremental basado en campañas.

Cada campaña está formada por varias expediciones contra distintos reinos humanos.

Durante una expedición el jugador envía goblins que generan influencia con el paso del tiempo.

La influencia sirve para comprar mejoras temporales dentro del propio run.

Cuando termina la expedición, toda la influencia obtenida se convierte en experiencia para el Rey Goblin.

Al subir de nivel el jugador elige una carta entre varias opciones para construir una build única durante esa campaña.

Las campañas terminan cuando el Consejo Goblin se queda sin expediciones.

Los reinos conquistados otorgan Puntos del Consejo, que sirven para desbloquear mejoras permanentes entre campañas.

---

# Escalas de tiempo

## Click (segundos)

Enviar goblins.

Comprar mejoras.

Optimizar producción.

## Run (1-3 minutos)

Derrotar un reino.

Obtener influencia.

Comprar mejoras temporales.

## Campaña (30-60 minutos)

Construir una build mediante cartas.

Conquistar tantos reinos como sea posible.

Conseguir Puntos del Consejo.

## Meta

Desbloquear nuevas tecnologías, unidades y mejoras permanentes.

---

# Recursos

## Influencia

Recurso temporal.

Se obtiene durante un run.

Sirve para comprar mejoras temporales.

## Experiencia

Se obtiene al terminar una expedición.

Permite subir de nivel.

Cada nivel ofrece una carta entre varias opciones.

## Puntos del Consejo

Se obtienen al conquistar reinos.

Sirven para desbloquear mejoras permanentes.

---

# Flujo

Campaña

↓

Expedición

↓

Generar influencia

↓

Comprar mejoras

↓

Victoria o derrota

↓

Experiencia

↓

Subida de nivel

↓

Elegir carta

↓

¿Quedan expediciones?

Sí → siguiente reino

No → Fin de campaña

↓

Gastar Puntos del Consejo

↓

Nueva campaña

---

# Arquitectura

Game

├── UI

├── World

└── Managers

	├── ResourceManager

	├── ProductionCalculator

	├── RunManager

	├── CampaignManager

	└── UpgradeManager (futuro)

---

# Filosofía

- El click siempre es importante.
- La producción pasiva complementa al click.
- Cada campaña crea una build diferente.
- Las mejoras permanentes desbloquean nuevas posibilidades, no solo números mayores.
