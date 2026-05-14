# Редирект с tg.danbesy.com в Telegram
server {
    listen 80;
    server_name tg.danbesy.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    http2 on;
    server_name tg.danbesy.com;

    ssl_certificate /etc/nginx/certs/cloudflare/danbesy.com/cert.pem;
    ssl_certificate_key /etc/nginx/certs/cloudflare/danbesy.com/key.pem;

    include /etc/nginx/snippets/cloudflare.conf;
    include /etc/nginx/snippets/ssl.conf;

    return 301 https://t.me/danbesy;
}

# Редирект с danbesy.lol в Telegram
server {
    listen 80;
    server_name danbesy.lol;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    http2 on;
    server_name danbesy.lol;

    ssl_certificate /etc/nginx/certs/cloudflare/danbesy.lol/cert.pem;
    ssl_certificate_key /etc/nginx/certs/cloudflare/danbesy.lol/key.pem;

    include /etc/nginx/snippets/cloudflare.conf;
    include /etc/nginx/snippets/ssl.conf;

    return 301 https://t.me/danbesy;
}