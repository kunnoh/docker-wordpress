# docker-wordpress
clone code
```sh
git clone https://github.com/kunnoh/docker-wordpress.git
```

change directory
```sh
cd docker-wordpress
```

## wordpress
edit docker-compose to point your domain name
```sh

... other config settings
    container_name: wpapp
    volumes:
      - ./wp/web/:/var/www/html/
      - logs/wp:/var/log/nginx/<your-site-domain>/
    depends_on:
      - pgdb
... other config settings

```

start the system.
```sh
make start
```

stop thw system
```sh
make stop
```

rebuild the system
```sh
make rebuild
```

delete containers, images and volumes
```sh
make destroy
```