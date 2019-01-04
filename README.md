# Requirements

- docker
- mkcert

```
brew install mkcert
brew install nss # For Firefox
```

#### 1. Create local certificates

```
make certs
```

#### 2. Add dns resolver

```
sudo make dns-resolver
```


#### 3. Run docker compose

```
docker-compose up [-d]
```
