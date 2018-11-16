#!/bin/bash

update-ca-certificates

(
	backend=""
	use_backend=""

	while read -r p || [ -n "$p" ]; do
		key=$(echo "$p" | cut -f1 -d=)
		value=$(echo "$p" | cut -f2 -d=)

		if [ -z "${value##[0-9]*}" ]; then
			port="${value}"
			value="port_${value}"
			backend="${backend}\nbackend ${value}\n  server ${value} host.docker.internal:${port}\n"
		fi
		
		use_backend="${use_backend}
  {{ range \$host, \$container := . }}
  {{ if eq \$container.Name \"${value}\" }}
  acl ${value} hdr(host) -i ${key}
  use_backend ${value} if ${value}
  {{ end }}
  {{ end }}
		"
	done < vhosts.cfg

	IFS=''
	template=""
	while read -r p || [ -n "$p" ]; do
		if [ "$p" = "#backend" ]; then
			template="$template\n$backend"
		elif [ "$p" = "  #use_backend" ]; then
			template="$template\n$use_backend"
		else
			template="$template\n$p"
		fi
	done < haproxy.tmpl

	echo -e $template > ./haproxy.cfg.tmpl
)

find /ssl -name "*.pem" | xargs cat > ./cert.pem

set -e

# Warn if the DOCKER_HOST socket does not exist
if [[ $DOCKER_HOST == unix://* ]]; then
	socket_file=${DOCKER_HOST#unix://}
	if ! [ -S $socket_file ]; then
		cat >&2 <<-EOT
			ERROR: you need to share your Docker host socket with a volume at $socket_file
			Typically you should run with: \`-v /var/run/docker.sock:$socket_file:ro\`
			See the documentation at http://git.io/vZaGJ
		EOT
		socketMissing=1
	fi
fi

# If the user has run the default command and the socket doesn't exist, fail
if [ "$socketMissing" = 1 -a "$1" = 'docker-gen' -a "$2" = '-c' -a "$3" = '/app/docker-gen.cfg' ]; then
	exit 1
fi

exec "$@"