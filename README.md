> Proxy for Ridi Development Enviorment


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

#### 2. Add a host name
```
127.0.0.1 api.pay.local.ridi.io
127.0.0.1 pay.local.ridi.io
127.0.0.1 local.ridi.io
127.0.0.1 static.local.ridi.io
127.0.0.1 admin.local.ridi.io
```

#### 3. Run docker compose
