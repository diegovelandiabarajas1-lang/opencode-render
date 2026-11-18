# OpenCode mínimo para el plan gratuito de Render (512 MB, 0,1 CPU).
# Sin .NET, Python extra ni navegador: solo el servidor de OpenCode,
# más las instrucciones base y las skills de uso general en /workspace.
FROM smanx/opencode:latest

ENV OPENCODE_HOSTNAME=0.0.0.0 \
    OPENCODE_PORT=10000
WORKDIR /workspace
COPY workspace/ /workspace/
# Guardián: mantiene despierto a Render mientras un agente trabaja (aunque nadie envíe mensajes).
COPY mantener-despierto.sh arranque.sh /
RUN chmod 0755 /mantener-despierto.sh /arranque.sh /workspace/herramientas/*.sh
ENTRYPOINT ["/arranque.sh"]
EXPOSE 10000
