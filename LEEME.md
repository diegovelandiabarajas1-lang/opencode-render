# OpenCode en Render (plan gratuito)

Contiene solo lo necesario para que Render levante el servidor de OpenCode para la app OpenCode Móvil:
- `Dockerfile`: imagen mínima (parte de `smanx/opencode`), puerto 10000.
- `render.yaml`: Blueprint (servicio web gratuito en la región de Virginia).

La contraseña la genera Render (`OPENCODE_SERVER_PASSWORD`); se lee en el panel de Render → Environment.
Probado en local con 512 MB y 0,1 CPU: arranca en ~14 s y usa ~75 MB en reposo.
Límites del plan gratuito: se duerme a los 15 min sin tráfico (despierta en ~1 min) y el disco se borra al dormir.
