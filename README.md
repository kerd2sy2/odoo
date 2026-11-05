# Odoo 18.0 Community Edition — Production Deployment & Custom Addons

This repository contains the deployment configuration, infrastructure automation scripts, and custom modules (`custom-addons`) for our **Odoo 18.0 Community Edition** server.

## Architecture Overview

- **Odoo Version:** 18.0 Community Edition (`18.0` branch from official `odoo/odoo`)
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
│   ├── odoo.conf.example      # Sanitized Odoo 18 configuration template
│   └── odoo.service           # Systemd unit file for Odoo 18
├── custom-addons/             # Place custom Odoo 18 modules here
│   └── .gitkeep
├── scripts/
│   └── deploy_odoo18.sh       # Automated Ubuntu deployment script for Odoo 18
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
