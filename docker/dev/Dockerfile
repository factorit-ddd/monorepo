FROM alpine:3.13 AS symfony-cli

RUN apk update && \
    apk add bash git wget && \
    wget https://get.symfony.com/cli/installer -O - | bash && \
    /root/.symfony/bin/symfony self:update

###########################################################################
# BASE
###########################################################################

FROM php:8.0-fpm-alpine3.15

ARG HOST_USER="host"
ARG HOST_UID=1000
ARG HOST_GID=1000
ARG APP_CODE_PATH="/data"

#--------------------------------------------------------------------------
# Update
#--------------------------------------------------------------------------

RUN apk update && \
    apk add zsh git zsh-autosuggestions zsh-syntax-highlighting bind-tools curl openssh && \
    rm -rf /var/cache/apk/*

#--------------------------------------------------------------------------
# Tools
#--------------------------------------------------------------------------

COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer
COPY --from=symfony-cli /root/.symfony/bin/symfony /usr/bin/symfony

#--------------------------------------------------------------------------
# PHP setup
#--------------------------------------------------------------------------

# install php extensions
RUN curl -sSLf -o /usr/local/bin/install-php-extensions \
    https://github.com/mlocati/docker-php-extension-installer/releases/download/1.4.8/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions ctype iconv

#--------------------------------------------------------------------------
# Add non-root user + access
#--------------------------------------------------------------------------

RUN addgroup --gid "$HOST_GID" "$HOST_USER" \
    && adduser --ingroup "$HOST_USER" --home /home --disabled-password --shell /bin/zsh --uid $HOST_UID  "$HOST_USER"

USER "$HOST_USER"

ARG GIT_NAME
ARG GIT_EMAIL
RUN git config --global user.name "$GIT_NAME" && \
    git config --global user.email "$GIT_EMAIL"

#--------------------------------------------------------------------------
# Setup mountpoint
#--------------------------------------------------------------------------

VOLUME "${APP_CODE_PATH}"
WORKDIR "${APP_CODE_PATH}"

#--------------------------------------------------------------------------
# Project
#--------------------------------------------------------------------------

# make sure PATH contains all global composer scripts
# make sure PATH contains all project composer scripts
# make sure PATH contains all project scripts
ENV PATH="${APP_CODE_PATH}/bin:${APP_CODE_PATH}/vendor/bin:/home/.composer/vendor/bin:${PATH}"
