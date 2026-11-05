#!/usr/bin/env bash
set -euo pipefail

# Automated Odoo 20.0 Community Edition Deployment Script for Ubuntu
export DEBIAN_FRONTEND=noninteractive

apt-get update -qq
apt-get install -y git python3-pip python3-dev python3-venv libxml2-dev libxslt1-dev \
    zlib1g-dev libsasl2-dev libldap2-dev build-essential libssl-dev libffi-dev \
    libmysqlclient-dev libjpeg-dev libpq-dev libjpeg8-dev liblcms2-dev libblas-dev \
    xfonts-75dpi xfonts-base fontconfig postgresql

npm install -g rtlcss less

cd /tmp
wget -q https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.jammy_amd64.deb
apt-get install -y ./wkhtmltox_0.12.6.1-3.jammy_amd64.deb

systemctl enable --now postgresql
id odoo 2>/dev/null || useradd -m -d /opt/odoo -U -r -s /bin/bash odoo
su - postgres -c "createuser -s odoo 2>/dev/null || true"

mkdir -p /opt/odoo/custom-addons
if [ ! -d /opt/odoo/odoo-server/.git ]; then
    git clone https://www.github.com/odoo/odoo --depth 1 --branch 20.0 --single-branch /opt/odoo/odoo-server
fi
chown -R odoo:odoo /opt/odoo

su - odoo -c "python3 -m venv /opt/odoo/odoo-venv && /opt/odoo/odoo-venv/bin/pip install --upgrade pip wheel setuptools && /opt/odoo/odoo-venv/bin/pip install -r /opt/odoo/odoo-server/requirements.txt"

mkdir -p /var/log/odoo
chown odoo:odoo /var/log/odoo
