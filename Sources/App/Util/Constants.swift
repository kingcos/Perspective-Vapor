//
//  Constants.swift
//  App
//
//  Created by kingcos on 2018/8/9.
//

import Foundation

struct Constants {
    static let GitHubAPIPrefix = "https://api.github.com"
    
    static let GitHubUsername = "kingcos"
    static let GitHubRepoName = "Perspective"
    static let GitHubAPIToken = "YOUR_GITHUB_API_TOKEN"
    
    struct GitHubAPI {
        static let Labels = "/repos/\(Constants.GitHubUsername)/\(Constants.GitHubRepoName)/labels"
        static let Issues = "/repos/\(Constants.GitHubUsername)/\(Constants.GitHubRepoName)/issues"
        static let Comments  = "/repos/\(Constants.GitHubUsername)/\(Constants.GitHubRepoName)/issues/comments"
    }
}
