FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/hundertzehn/caddy-ratelimit

FROM caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy