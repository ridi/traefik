certs:
	@mkcert -install
	@rm -rf ssl && mkdir ssl && cd ssl \
	&& mkcert local.ridi.io '*.local.ridi.io'
