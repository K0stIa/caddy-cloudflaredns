FROM caddy:2.6.4-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security \
    --with github.com/lucaslorentz/caddy-docker-proxy/plugin

FROM caddy:2.6.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
