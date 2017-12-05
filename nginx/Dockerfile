FROM nginx
RUN apt-get update && apt-get install -y curl \
    && rm -rf /var/lib/apt/lists/*
COPY privkey.pem /etc/letsencrypt/live/babyjourn.al/privkey.pem
COPY fullchain.pem /etc/letsencrypt/live/babyjourn.al/fullchain.pem
#RUN mkdir /var/www/
#COPY index.html /var/www/index.html

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf