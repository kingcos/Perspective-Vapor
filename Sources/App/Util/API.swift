//
//  API.swift
//  App
//
//  Created by kingcos on 2018/8/9.
//

import Foundation

struct API {
    struct GitHub {
        static let Token = "YOUR_GITHUB_TOKEN"
        static let Prefix = "https://api.github.com"
        
        static let Repos = "repos"
        static let Issues = "issues"
        static let Comments  = "comments"
        static let Labels  = "labels"
        static let Users  = "users"
    }
}
