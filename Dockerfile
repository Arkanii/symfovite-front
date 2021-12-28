ARG CADDY_VERSION=2
ARG NODE_VERSION=17

FROM node:${NODE_VERSION}-alpine AS vite_node

WORKDIR /srv/app

ENV PATH /app/node_modules/.bin:$PATH

RUN yarn --silent

COPY . .

CMD ["yarn", "run", "dev-docker"]

FROM caddy:${CADDY_VERSION} AS vite_caddy

WORKDIR /srv/app

COPY docker/caddy/Caddyfile /etc/caddy/Caddyfile
