# Powerfox Exporter

[![Docker Pulls](https://img.shields.io/docker/pulls/martinlowinski/powerfox-exporter.svg?maxAge=604800)][hub]

Service to scrape [powerfox](https://www.powerfox.energy/) metrics and to export them for prometheus.

## Configuration

Environment variables:

- `POLLING_INTERVAL_SECONDS`, the default is 60
- `EXPORTER_PORT`, the port where `/metrics` is exported, default is 9813
- `POWERFOX_API_USER` as part of the powerfox credentials
- `POWERFOX_API_PASSWORD` as part of the powerfox credentials
- `POWERFOX_DEVICE`, the ID of the poweropti

## Usage

### Docker Compose

```
version: '3.8'

services:
  powerfox-exporter:
    image: powerfox-exporter:latest
    restart: always
    environment:
      - POWERFOX_API_USER=username
      - POWERFOX_API_PASSWORD=password
      - POWERFOX_DEVICE=123456789
```

This allows prometheus to scrape the metrics via inter-container communication on the default port `9813`.

### Prometheus scrape usage

```
scrape_configs:
  - job_name: 'powerfox-exporter'
    scrape_interval: 60s
    static_configs:
      - targets: ['powerfox-exporter:9813']
```

### Grafana

I have created an example grafana [dashboard](https://grafana.com/grafana/dashboards/20350-powerfox/) for this exporter, feel free to use it.
