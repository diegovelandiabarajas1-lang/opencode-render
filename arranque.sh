#!/bin/sh
# Arranca el guardián que mantiene despierto a Render mientras el agente trabaja y luego el OpenCode de siempre.
/mantener-despierto.sh >/tmp/mantener-despierto.log 2>&1 &
exec /entrypoint.sh "$@"
