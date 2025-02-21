# How to create certificate

``` bash
    docker compose run --rm certbot certonly --webroot --webroot-path=/var/www/certbot -d code-server.sima.revvitycloud.net

    # alternative
    # certbot --non-interactive --redirect --agree-tos --nginx -d code-server.sima.revvitycloud.net
```
