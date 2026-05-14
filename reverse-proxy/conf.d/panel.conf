# Cockpit - panel.danbesy.com
server {
    listen 80;
    server_name panel.danbesy.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    http2 on;
    server_name panel.danbesy.com;

    ssl_certificate /etc/nginx/certs/cloudflare/danbesy.com/cert.pem;
    ssl_certificate_key /etc/nginx/certs/cloudflare/danbesy.com/key.pem;

    include /etc/nginx/snippets/cloudflare.conf;
    include /etc/nginx/snippets/ssl.conf;

    location / {
        proxy_pass http://host.docker.internal:9090;

        include /etc/nginx/snippets/security-headers.conf;
        include /etc/nginx/snippets/proxy_params.conf;
        include /etc/nginx/snippets/proxy_ws.conf;
    }
}