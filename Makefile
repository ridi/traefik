init:
	mkdir ssl || cd ssl && mkcert local.ridi.io "*.local.ridi.io" api.pay.local.ridi.io pay.local.ridi.io
