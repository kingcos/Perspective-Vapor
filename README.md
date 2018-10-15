# Perspective-Vapor

A Vapor server for WeApp of my personal blog - Perspective.

## Preface

This is just a simple server for visit GitHub API through your server. It's even without a database. (So why not visit GitHub API directly? Because there're some weird reasons here, I have to do this.)

## Progress

- [x] Support Linux
- [x] HTTPS (Based on nginx)
- [x] More generic use (Like fetch by page, username, repository name ...)
- [ ] GraphQL
- [ ] Docker

## How to run?

Install Vapor 3.0 first from [Vapor Documentation](https://docs.vapor.codes/3.0/).

### macOS

1. `git clone https://github.com/kingcos/Perspective-Vapor.git`
2. Setup your GitHub API token in `Perspective-Vapor/Sources/App/Util/API.swift` - `GitHubAPIToken`
3. `cd Perspective-Vapor`
4. `vapor build`
5. `vapor run`

### Linux

> Ubuntu 16.04 x86_64

1. `git clone https://github.com/kingcos/Perspective-Vapor.git`
2. Setup your GitHub API token in `Perspective-Vapor/Sources/App/Util/API.swift` - `GitHubAPIToken`
3. `cd Perspective-Vapor`
4. `vapor build`

- nginx HTTPS & Vapor proxy (Run `service nginx restart` after configuration):

```conf
# /etc/nginx/conf.d/kingcos_top_433.conf
# Note the YOUR_PEM_PATH & YOUR_KEY_PATH
server {
    listen 443;
    server_name kingcos.top;
    ssl on;
    root html;
    index index.html index.htm;
    ssl_certificate YOUR_PEM_PATH.pem;
    ssl_certificate_key YOUR_PEM_PATH.key;
    ssl_session_timeout 5m;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers on;

    location / {
        proxy_pass http://localhost:8080;
        proxy_pass_header Server;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass_header Server;
        proxy_connect_timeout 3s;
        proxy_read_timeout 10s;
    }
}
```

```conf
# /etc/nginx/conf.d/kingcos_top_80.conf
server {
    listen 80;
    server_name kingcos.top;
    index index.html index.htm;

    return 301 https://$server_name$request_uri;
}
```

```conf
# /etc/nginx/nginx.conf
# Comment this line
# include /etc/nginx/sites-enabled/*;
```

- Run in background by Supervisor

```
; vapor_server.ini
[program:Vapor]
command=vapor run serve --hostname=127.0.0.1 --port=8080
autostart=true
autorestart=true
startretries=5
user=root

[supervisord]
```

## API

> You can visit my website for test: [https://kingcos.top](https://kingcos.top)

```
eg:
https://kingcos.top/repos/kingcos/perspective/issues?page=1&per_page=10
https://kingcos.top/repos/kingcos/perspective/issues/20
https://kingcos.top/repos/kingcos/perspective/issues/5/comments?page=1&per_page=10
https://kingcos.top/repos/kingcos/perspective/labels
https://kingcos.top/users/kingcos/repos?page=1&per_page=10
https://kingcos.top/users/kingcos/repos
```

- For your repository, just replace the username and repository name, then try again:

```
http://YOUR_DOMAIN/repos/YOUR_USERNAME/YOUR_REPO_NAME/issues?page=PAGE_NUMBER&per_page=PAGE_SIZE
```

## Reference

- [Supervisor setup & basic usages (zh_CN)](https://github.com/kingcos/Perspective/issues/9)

## LICENSE

- MIT License
