FROM mmasson/craft-dev:7.4-alpine

# Move to app directory
WORKDIR /app/craft

# Copy project file
COPY . .

RUN mkdir -p ./storage \
    && \
    mkdir -p ./web/cpresources \
    && \
    chown -R www-data:www-data .

# Expose php port
EXPOSE 9000

# Run container
CMD chown -R www-data:www-data . \
    && \
    su-exec www-data composer install --verbose --no-progress --no-scripts --optimize-autoloader --no-interaction \
    && \
    su-exec www-data composer craft-update \
    && \
    php-fpm
