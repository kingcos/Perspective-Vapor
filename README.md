# Perspective-Vapor

A Vapor server for WeApp of my personal blog - Perspective.

## Preface

This is just a simple server for visit GitHub API through your server. It's even without a database. (So why not visit GitHub API directly? Because there're some weird reasons here, I have to do this.)

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

## API

> You can visit my website for test: [http://kingcos.top](http://kingcos.top)

```
http://localhost:8080/perspective/labels
http://localhost:8080/perspective/issues
http://localhost:8080/perspective/comments
```

## LICENSE

- MIT License
