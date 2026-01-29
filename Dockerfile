# fmPDA development container
# - PHP CLI for running tools (Composer, Rector, scripts)
# - Composer baked in so host doesn't need PHP/Composer

# Stage 1: get Composer binary from official image
FROM composer:2 AS composer_bin

# Stage 2: PHP runtime
FROM php:8.3-cli-alpine

# Install useful tools and PHP extensions commonly needed by Composer/analysis tools
RUN apk add --no-cache git unzip libzip-dev bash shadow curl && \
    docker-php-ext-install zip

# Copy Composer from the composer image
COPY --from=composer_bin /usr/bin/composer /usr/bin/composer

# Create a non-root user to avoid permission issues on host-mounted volumes
# UID/GID 1000 is common for Linux dev machines; adjust at runtime if needed
RUN addgroup -g 1000 app || true && \
    adduser -D -u 1000 -G app app || true

WORKDIR /app

# Default command shows PHP version; docker-compose can override as needed
CMD ["php", "-v"]
