# Website - danbesy.com
server {
    listen 80;
    server_name danbesy.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    http2 on;
    server_name danbesy.com;

    ssl_certificate /etc/nginx/certs/cloudflare/danbesy.com/cert.pem;
    ssl_certificate_key /etc/nginx/certs/cloudflare/danbesy.com/key.pem;

    include /etc/nginx/snippets/cloudflare.conf;
    include /etc/nginx/snippets/ssl.conf;

    location / {
        proxy_pass http://danbesy-website:8888;

        include /etc/nginx/snippets/security-headers.conf;
        include /etc/nginx/snippets/proxy_params.conf;
        include /etc/nginx/snippets/proxy_ws.conf;
    }

    location /_next/static/ {
        proxy_pass http://danbesy-website:8888;
        proxy_cache_bypass $http_upgrade;
        expires 365d;
        access_log off;
        add_header Cache-Control "public, max-age=31536000, immutable";
    }

    location ~* \.(jpg|jpeg|png|gif|ico|css|js|mp4|webm|webp|svg)$ {
        proxy_pass http://danbesy-website:8888;
        include /etc/nginx/snippets/security-headers.conf;
        expires 30d;
        add_header Cache-Control "public, no-transform";
    }
}