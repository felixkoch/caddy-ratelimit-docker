# About the image

This image extends the original Caddy 2 image with the caddy-ratelimit plugin from hunderzehn.

https://github.com/hundertzehn/caddy-ratelimit

## How to use this image
Please refer to the official caddy image.

https://hub.docker.com/_/caddy

## Example

```
:80  {
  @noLimit {
    not path /test2.html /test3.html
  }
  route { 
    rate_limit @noLimit {
      #by_header Authorization
      max_requests 2
      window_length 1m
    }
    root * /srv
    file_server
  }
}
```

Please note the caddy plugin architecture requires that you need to wrap `rate_limit` inside a route directive (https://caddyserver.com/docs/caddyfile/directives/route) or manipulation of the global `order` of directives (https://caddyserver.com/docs/caddyfile/options).
