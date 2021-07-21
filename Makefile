default: start

.PHONY: clean start

rebuild:
	docker-compose stop $(container) && docker-compose rm -f $(container) && docker-compose build --no-cache $(container) && docker-compose up -d $(container)

restart:
	docker-compose stop $(container) && docker-compose rm -f $(container) && docker-compose up -d $(container)
