# Perspective-Vapor

A Vapor server for WeApp of my personal blog - Perspective.

## Preface

This is just a simple server for visit GitHub API through your server. It's even without a database. (So why not visit GitHub API directly? Because there're some weird reasons here, I have to do this.)

## How to run?

### macOS

1. `git clone https://github.com/kingcos/Perspective-Vapor.git`
2. Setup your GitHub API token in `Constants.swift`
3. `vapor build`
4. `vapor run`

### Linux

> Update soon.

## API

```
http://localhost:8080/perspective/labels
http://localhost:8080/perspective/issues
http://localhost:8080/perspective/comments
```

## LICENSE

- MIT License
