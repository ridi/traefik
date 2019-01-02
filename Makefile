certs:
	@mkdir -p ssl
	@cd ssl \
	&& rm -f * \
	&& mkcert local.ridi.io '*.local.ridi.io' '*.select.local.ridi.io' '*.pay.local.ridi.io'