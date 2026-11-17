# OpenCode mínimo para el plan gratuito de Render (512 MB, 0,1 CPU).
# Sin .NET, Python extra ni navegador: solo el servidor de OpenCode.
FROM smanx/opencode:latest

ENV OPENCODE_HOSTNAME=0.0.0.0 \
    OPENCODE_PORT=10000
WORKDIR /workspace
EXPOSE 10000
