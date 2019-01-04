certs:
	@mkcert -install
	@rm -rf ssl && mkdir ssl && cd ssl \
	&& mkcert local.ridi.io '*.local.ridi.io'

dns-resolver:
	@mkdir -p /etc/resolver
	@[ -e /etc/resolver/local.ridi.io ] || echo "nameserver 127.0.0.1" >> /etc/resolver/local.ridi.io
