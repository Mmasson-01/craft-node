default: start

.PHONY: clean start

restart:
	docker-compose stop $(container) && docker-compose rm -f $(container) && docker-compose build $(container) && docker-compose up -d $(container)
