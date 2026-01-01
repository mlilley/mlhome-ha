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
	docker compose run mosquitto \
	  chmod 0600 /mosquitto/config/mosquitto.passwd
	docker compose run mosquitto \
	  mosquitto_passwd -c /mosquitto/config/mosquitto.passwd $(USERNAME)
	docker compose restart mosquitto