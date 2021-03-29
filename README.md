# odoo-docker-compose
odoo docker with docker compose
1. Mô tả:
Postgresql 10 
Odoo12 FROM debian:buster-slim 
ODOO_RELEASE=20210318
Odoo14 Lastest docker compose image 


2. Cài đặt Doker, docker compose

tạo thư mục và cấp quyền cho chúng addons config, etc data postgresql

sudo find . -type f -exec chmod 644 {} \;
sudo find . -type d -exec chmod 755 {} \;

build: docker-compose up -d

restart odoo: docker-compose restart odoo12

restart post gresql: docker-compose restart db
