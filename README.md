# Odoo 20.0 Community Edition — Production Deployment & Custom Addons

This repository contains the deployment configuration, infrastructure automation scripts, and custom modules (`custom-addons`) for our **Odoo 20.0 Community Edition** server.

## Architecture Overview

- **Odoo Version:** 20.0 Community Edition (`20.0` branch from official `odoo/odoo`)
- **Application Directory:** `/opt/odoo/odoo-server`
- **Custom Addons Directory:** `/opt/odoo/custom-addons`
- **Python Virtual Environment:** `/opt/odoo/odoo-venv`
- **Configuration File:** `/etc/odoo.conf` (permissions `640`, owned by `odoo:odoo`)
- **Systemd Service:** `/etc/systemd/system/odoo.service`
- **Log File:** `/var/log/odoo/odoo-server.log`
- **Default Production Database:** `odoo_prod`
- **Port:** `8069`

## Repository Structure

```text
├── config/
│   ├── odoo.conf.example      # Sanitized Odoo 20 configuration template
│   └── odoo.service           # Systemd unit file for Odoo 20
├── custom-addons/             # Place custom Odoo 20 modules here
│   └── custom_placeholder/
├── scripts/
│   └── deploy_odoo20.sh       # Automated Ubuntu deployment script for Odoo 20
├── .gitignore
└── README.md
```

## Managing the Odoo Service

```bash
# Check service status
sudo systemctl status odoo

# Restart Odoo after uploading or updating custom modules
sudo systemctl restart odoo

# Tail live server logs
sudo tail -f /var/log/odoo/odoo-server.log
```
