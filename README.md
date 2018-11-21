> RIDI Reverse-Proxy


## Requirements

- docker
- mkcert

```
brew install mkcert
brew install nss # For Firefox
```

#### 1. Create a local certificate

```
make init
```

#### 2. Create vhosts.cfg file

_example_
```
local.ridi.io=store_apache_1
select.local.ridi.io=store_apache_1
pay.local.ridi.io=8090
api.pay.local.ridi.io=pay-backend_api_1
```

#### 3. Run docker compose

```
docker-compose up [-d]
```