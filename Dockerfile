FROM grafana/agent:v0.37.0

# Copiar el archivo de configuración al contenedor
COPY config.river /etc/agent/config.river

# Comando correcto para ejecutar con la ruta al config
CMD ["run", "/etc/agent/config.river"]