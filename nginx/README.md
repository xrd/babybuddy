Google Home requires an SSL endpoint, and this nginx configuration supports SSL.

To properly configure nginx, you need to create privkey.pem and fullchain.pem files,
(using something like certbot is the easiest route).

Then, as root, copy those files into the nginx directory.

If your hostname is babyfoo.com, then adjust the paths in the following files:

Then, edit the Dockerfile to copy them into the correct location based on the hostname.

Also, edit the following lines in nginx/default.conf:

```
ssl_certificate /etc/letsencrypt/live/babyfoo.com/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/babyfoo.com/privkey.pem;
```

Then, `docker-compose build` and `docker-compose up`. 
