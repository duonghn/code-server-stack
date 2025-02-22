# Code Server Stack

This is a implementation of code-server, <https://github.com/coder/code-server>, which can be run on a docker stack for a small live coding session.

Use `session.sh` to start | stop the session, so that the password will be reset and the server
will be turn off.

```bash
Usage: ./session.sh [start|stop]
```

## .env file

Please create a .env file on the root with passw and DNS server name.

```bash
SERVER_NAME=example1.com
CODE_SERVER_PASSWORD=please_add_me
```

## How to create certificate

``` bash
docker compose run --rm certbot certonly --webroot --webroot-path=/var/www/certbot -d ${SERVER_NAME}$
```

## Other information

Check this out for more information:
<https://coder.com/docs/code-server/guide>

(We don't use <https://github.com/coder/coder> on purpose)
