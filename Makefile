.PHONY: up down logs logsf

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs

logsf:
	docker compose logs -f

passwd:
	@if [ -z "$(USERNAME)" ]; then \
	  echo "Usage: make passwd USERNAME=abc"; \
	  exit 1; \
	fi
	docker compose run --rm mosquitto \
	  sh -c '\
	    if [ ! -f /mosquitto/config/mosquitto.passwd ]; then \
		  mosquitto_passwd -c /mosquitto/config/mosquitto.passwd "$(USERNAME)"; \
		else \
		  mosquitto_passwd /mosquitto/config/mosquitto.passwd "$(USERNAME)"; \
		fi && \
		chmod 0600 /mosquitto/config/mosquitto.passwd && \
		chown root:root /mosquitto/config/mosquitto.passwd \
	  '
	docker compose restart mosquitto