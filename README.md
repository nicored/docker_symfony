# Docker with Symfony, PHP 5.6, PHP 7.0, Nginx, Kibana

Note: Doc is not done yet, will get it done within the next few days

### With php 5.6

```
    docker-compose -f config/compose_files/common.yml -f config/compose_files/dev.yml up
```

### With php 7.0

```
    docker-compose -f config/compose_files/common.yml -f config/compose_files/dev.yml -f config/compose_files/php7.yml up
```

## TODO
- Complete this README.md gile
