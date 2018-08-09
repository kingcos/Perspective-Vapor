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
        static let Labels = "/repos/\(Constants.GitHubUsername)/\(Constants.GitHubUsername)/labels"
        static let Issues = "/repos/\(Constants.GitHubUsername)/\(Constants.GitHubUsername)/issues"
        static let Issue  = "/repos/\(Constants.GitHubUsername)/\(Constants.GitHubUsername)/issues/"
        static let CommentsSuffix = "/comments"
        static let SearchIssues = "/search/issues"
        static let SearchIssuesQuerySuffix = "+author:\(Constants.GitHubUsername)"
    }
}
