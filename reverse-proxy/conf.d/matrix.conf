# Matrix - matrix.danbesy.com
server {
    listen 80;
    server_name matrix.danbesy.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    http2 on;
    server_name matrix.danbesy.com;

    ssl_certificate /etc/nginx/certs/letsencrypt/danbesy.com/fullchain.pem;
    ssl_certificate_key /etc/nginx/certs/letsencrypt/danbesy.com/key.pem;

    include /etc/nginx/snippets/cloudflare.conf;
    include /etc/nginx/snippets/ssl.conf;
    include /etc/nginx/snippets/matrix.conf;

    location /_matrix {
        proxy_pass http://dendrite:8008;

        include /etc/nginx/snippets/proxy_params.conf;

        client_max_body_size 500M;
        proxy_connect_timeout 600;
        proxy_send_timeout 600;
        proxy_read_timeout 600;
    }

    location /_synapse/client {
        proxy_pass http://dendrite:8008;

        include /etc/nginx/snippets/proxy_params.conf;
    }
}

server {
    listen 8448 ssl;
    http2 on;
    server_name matrix.danbesy.com;

    ssl_certificate /etc/nginx/certs/letsencrypt/danbesy.com/fullchain.pem;
    ssl_certificate_key /etc/nginx/certs/letsencrypt/danbesy.com/key.pem;

    include /etc/nginx/snippets/cloudflare.conf;
    include /etc/nginx/snippets/ssl.conf;

    location / {
        proxy_pass http://dendrite:8008;

        include /etc/nginx/snippets/proxy_params.conf;
    }
}