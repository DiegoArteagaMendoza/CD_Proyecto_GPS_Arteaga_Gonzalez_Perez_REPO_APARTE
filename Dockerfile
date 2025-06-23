FROM grafana/agent:v0.37.0

COPY config.river /etc/agent/config.river

CMD ["run", "/etc/agent/config.river"]