init:
	mkdir -p ssl && cd ssl && mkcert localhost local.ridi.io "*.local.ridi.io" pay.local.ridi.io "*.pay.local.ridi.io"

proxy:
	@CAROOT="`mkcert -CAROOT`" docker-compose up -d