#!/bin/bash

cat > index.html <<EOF
<H1>Hello, World</H1>
<p>
<p>DB address: ${db_address}</p>
<p>   DB port: ${db_port}</p>
EOF

nohup busybox httpd -f -p "${server_port}" &
