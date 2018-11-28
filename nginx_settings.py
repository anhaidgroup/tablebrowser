#!/usr/bin/env python

import tempfile

f = open('/etc/nginx/conf.d/virtual.conf','w')
f.write('server {\n\tlisten  80;\n\tserver_name ec2-34-238-239-179.compute-1.amazonaws.com;\n\tlocation / {\n\t\tproxy_pass http://127.0.0.1:8000;\n\t\tproxy_set_header Host $host;\n\t\tproxy_set_header X-Real-IP $remote_addr;\n\t\tproxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n\t\tproxy_connect_timeout 600;\n\t\tproxy_send_timeout 600;\n\t\tproxy_read_timeout 600;\n\t\tsend_timeout 600;\n\t}\n}')
f.close()

t = tempfile.NamedTemporaryFile(mode="r+")
i = open('/etc/nginx/nginx.conf', 'r')
for line in i:
    t.write(line)
    if line.startswith('http'):
        t.write('    server_names_hash_bucket_size  128;\n    client_max_body_size 200M;\n')
i.close()
t.seek(0)
o = open('/etc/nginx/nginx.conf', "w")
for line in t:
    o.write(line)
t.close()
