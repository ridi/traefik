> RIDI Reverse-Proxy


## Requirements

- docker
- mkcert

```
brew install mkcert
brew install nss # For Firefox
```

#### 1. Create a vhosts.cfg file and local certificates

```
make config
make certs
```

#### 3. Run docker compose

```
docker-compose up [-d]
```