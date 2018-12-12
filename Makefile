config:
	@:> ./vhosts.cfg
	@containers=`docker ps --format "{{.Names}}"`; \
	while IFS= read -r name; do \
		id=`echo "$$name" | rev | cut -d "_" -f1  | rev`; \
		name=`echo "$$name" | rev | cut -d "_" -f2-  | rev`; \
		echo "$$id".lvh.me=$$name >> ./vhosts.cfg; \
	done <<< "$$containers";

certs:
	@mkdir -p ssl
	@cd ssl && rm -f *
	@addresses="localhost"; \
	while read -r p || [ -n "$$p" ]; do \
		domain=`echo $$p | cut -f1 -d=`; \
		addresses="$$addresses $$domain"; \
	done < vhosts.cfg; \
	cd ssl && mkcert $$addresses