FROM mmasson/craft-dev:7.4-alpine

ARG UID
ARG GID

# Move to app directory
WORKDIR /app/craft

# Copy project file
COPY . .

RUN mkdir -p ./storage \
    && \
    mkdir -p ./web/cpresources \
    && \
    chown -R ${UID}:${GID} .

# Expose php port
EXPOSE 9000

USER ${UID}

# Run container
CMD composer install --verbose --no-progress --no-scripts --optimize-autoloader --no-interaction \
    && \
    composer craft-update \
    && \
    php-fpm
