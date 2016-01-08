1. Setup `/etc/nginx/nginx.conf`:
```
upstream duckex_cluster {
  server 127.0.0.1:5151;
}
```

2. Setup proxy `/etc/nginx/conf.d/duckex.conf`:

```
server {
        listen 80;
        server_name duckex.dylangriffith.net;

        location / {
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $http_host;
                proxy_redirect off;

                # Pass request to app.
                if (!-f $request_filename) {
                        proxy_pass http://duckex_cluster;
                        break;
                }
        }
}
```
2. Restart nginx:
```
# service nginx restart
```
3. Test it:
[Check it out](http://duckex.dylangriffith.net)
