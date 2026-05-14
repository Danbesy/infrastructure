# Stalwart - mail.danbesy.com
server {
    listen 80;
    server_name mail.danbesy.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    http2 on;
    server_name mail.danbesy.com;

    ssl_certificate /etc/nginx/certs/letsencrypt/danbesy.com/fullchain.pem;
    ssl_certificate_key /etc/nginx/certs/letsencrypt/danbesy.com/key.pem;

    include /etc/nginx/snippets/cloudflare.conf;
    include /etc/nginx/snippets/ssl.conf;

    location / {
        proxy_pass http://stalwart-mail:4884;

        include /etc/nginx/snippets/security-headers.conf;
        include /etc/nginx/snippets/proxy_params.conf;
    }
}