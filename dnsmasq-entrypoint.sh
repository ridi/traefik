addresses=""
while read -r p || [ -n "$p" ]; do
    domain=$(echo "$p" | cut -f1 -d=)
    addresses="${addresses}/.${domain}"
done < /vhosts.cfg

dnsmasq -k -h --address=${addresses}/${IP_ADDR:-127.0.0.1}