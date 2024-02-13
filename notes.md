# Setup
Note: If hosted on a server, open the respective ports of exporter and prometheus

1. Start graphana (e.g. through docker)
2. Start the powerfox exporter (docker compose)

```bash
docker run \
    -p 9090:9090 \
    -v prometheus.yml:/etc/prometheus/prometheus.yml \
    prom/prometheus
```

3. Start prometheus with the scraper config
