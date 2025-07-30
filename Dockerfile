FROM composer/composer

# Add the required tokenizer exention which is required for token_get_all in this swagger tool
RUN printf "#!/usr/bin/env sh\nexec $COMPOSER_HOME/vendor/bin/openapi \$@" > /docker-entrypoint.sh
RUN apk add --no-cache php82-tokenizer

RUN composer global require -a --prefer-stable zircote/swagger-php
WORKDIR /app
