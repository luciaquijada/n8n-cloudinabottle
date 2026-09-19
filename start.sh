#!/bin/sh
set -eu

# Carpeta persistente proporcionada por Cloud in a Bottle.
export N8N_USER_FOLDER="${BOTTLE_APP_DATA_DIR:?}"

# Comprobar que n8n puede guardar sus datos.
if ! mkdir -p "$N8N_USER_FOLDER/.n8n"; then
  echo "ERROR: No se puede crear la carpeta persistente de n8n."
  exit 1
fi

if ! touch "$N8N_USER_FOLDER/.n8n/.write-test"; then
  echo "ERROR: n8n no tiene permisos de escritura."
  exit 1
fi

rm "$N8N_USER_FOLDER/.n8n/.write-test"

export N8N_PORT=5678
export N8N_LISTEN_ADDRESS=0.0.0.0
export N8N_PROTOCOL=http
export GENERIC_TIMEZONE=Europe/Madrid
export TZ=Europe/Madrid

export N8N_DIAGNOSTICS_ENABLED=false
export N8N_VERSION_NOTIFICATIONS_ENABLED=false

exec n8n start
