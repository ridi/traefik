certs:
	@mkcert -install
	@rm -rf tls && mkdir tls && cd tls \
	&& mkcert local.ridi.io '*.local.ridi.io'
