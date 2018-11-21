init:
	@mkdir -p ssl
	@cd ssl && rm -f *
	@addresses="localhost"; \
	while read -r p || [ -n "$$p" ]; do \
		domain=`echo $$p | cut -f1 -d=`; \
		addresses="$$addresses $$domain"; \
	done < vhosts.cfg; \
	cd ssl && mkcert $$addresses
