# Perspective-Vapor

A Vapor server for WeApp of my personal blog - Perspective.

## Preface

This is just a simple server for visit GitHub API through your server. It's even without a database. (So why not visit GitHub API directly? Because there're some weird reasons here, I have to do this.)

## Progress

- [x] Support Linux
- [x] HTTPS
- [ ] GraphQL
- [ ] More generic use (Like fetch by page, username, repository name ...)
- [ ] Docker

## How to run?

### macOS

1. `git clone https://github.com/kingcos/Perspective-Vapor.git`
2. Setup your GitHub API token in `Perspective-Vapor/Sources/App/Util/Constants.swift` - `GitHubAPIToken`
3. `cd Perspective-Vapor`
4. `vapor build`
5. `vapor run`

### Linux

> Ubuntu 16.04 x86_64

1. `git clone https://github.com/kingcos/Perspective-Vapor.git`
2. Setup your GitHub API token in `Perspective-Vapor/Sources/App/Util/Constants.swift` - `GitHubAPIToken`
3. `cd Perspective-Vapor`
4. `vapor build`
5. `vapor run serve --hostname=0.0.0.0 --port=80` or `nohup vapor run serve --hostname=0.0.0.0 --port=80 &` run in background

- nginx HTTPS config:

```conf
# /etc/nginx/conf.d/kingcos_top_433.conf
# Note the YOUR_PEM_PATH & YOUR_KEY_PATH
server {
    listen 443;
    server_name kingcos.top;
    ssl on;
    root html;
    index index.html index.htm;
    ssl_certificate   YOUR_PEM_PATH.pem;
    ssl_certificate_key  YOUR_KEY_PATH.key;
    ssl_session_timeout 5m;
    ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE:ECDH:AES:HIGH:!NULL:!aNULL:!MD5:!ADH:!RC4;
    ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers on;
    location / {
        root html;
        index index.html index.htm;
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

    location ~ / {
        root html;
        index index.html index.htm;
    }
}
```

## API

> You can visit my website for test: [https://kingcos.top](https://kingcos.top)

```
http://localhost:8080/perspective/labels
http://localhost:8080/perspective/issues
http://localhost:8080/perspective/comments
```

## LICENSE

- MIT License
