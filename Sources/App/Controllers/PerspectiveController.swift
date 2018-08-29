//
//  PerspectiveController.swift
//  App
//
//  Created by kingcos on 2018/8/7.
//

import Foundation
import Vapor

class PerspectiveController: RouteCollection {
    
    var timer: Scheduled<()>?
    
    var labels: [Label] = []
    
    func boot(router: Router) throws {
        router.group("github") { router in
            router.get(String.parameter, String.parameter, "issues", use: fetchIssuesList)
            router.get(String.parameter, String.parameter, "issues", Int.parameter, use: fetchIssueDetails)
        }
    }
}

extension PerspectiveController {
//    func fetchLables(_ request: Request) throws -> Future<Response> {
//        guard let apiURL = (Constants.GitHubAPIPrefix + Constants.GitHubAPI.Labels).convertToURL() else {
//            return try ResponseJSON<Empty>(status: .error,
//                                           message: "API URL has broken.").encode(for: request)
//        }
//
//        let authHeader: HTTPHeaders = ["Authorization" : "token \(Constants.GitHubAPIToken)"]
//        let apiRequest = HTTPRequest(method: .GET, url: apiURL, headers: authHeader)
//        let getRequest = Request(http: apiRequest, using: request)
//
//        return try request.client().send(getRequest).flatMap(to: Response.self) { response in
//            let data = response.http.body.utf8.convertToData()
//            let items = try JSONDecoder().decode([Label].self, from: data)
//
//            return try ResponseJSON<[Label]>(status: .ok,
//                                             data: items).encode(for: request)
//        }
//    }
    
    func fetchIssuesList(_ request: Request) throws -> Future<Response> {
        let owner = try request.parameters.next(String.self)
        let repo = try request.parameters.next(String.self)

        let page = request.query[String.self, at: "page"] ?? "1"
        let perPage = request.query[String.self, at: "per_page"] ?? "10"
        
        let url = "\(API.GitHub.Prefix)\(API.GitHub.Repos)/\(owner)/\(repo)\(API.GitHub.Issues)?page=\(page)&per_page=\(perPage)"
        
        guard let apiURL = url.convertToURL() else {
            return try ResponseJSON<Empty>(status: .error,
                                           message: "API URL has broken.").encode(for: request)
        }
        
        let header: HTTPHeaders = [
            "Authorization" : "token \(API.GitHub.Token)"
        ]
        let apiRequest = HTTPRequest(method: .GET, url: apiURL, headers: header)
        let getRequest = Request(http: apiRequest, using: request)
        
        return try request.client().send(getRequest).flatMap(to: Response.self) { response in
            let data = response.http.body.utf8.convertToData()
            let items = try JSONDecoder().decode([IssueInfo].self, from: data)
            
            return try ResponseJSON<[IssueInfo]>(status: .ok,
                                                 data: items).encode(for: request)
        }
    }
    
    func fetchIssueDetails(_ request: Request) throws -> Future<Response> {
        let owner = try request.parameters.next(String.self)
        let repo = try request.parameters.next(String.self)
        let number = try request.parameters.next(Int.self)
        
        let url = "\(API.GitHub.Prefix)\(API.GitHub.Repos)/\(owner)/\(repo)\(API.GitHub.Issues)/\(number)"
        
        guard let apiURL = url.convertToURL() else {
            return try ResponseJSON<Empty>(status: .error,
                                           message: "API URL has broken.").encode(for: request)
        }
        
        let header: HTTPHeaders = [
            "Authorization" : "token \(API.GitHub.Token)"
        ]
        let apiRequest = HTTPRequest(method: .GET, url: apiURL, headers: header)
        let getRequest = Request(http: apiRequest, using: request)
        
        return try request.client().send(getRequest).flatMap(to: Response.self) { response in
            let data = response.http.body.utf8.convertToData()
            let items = try JSONDecoder().decode(IssueDetails.self, from: data)
            
            return try ResponseJSON<IssueDetails>(status: .ok,
                                                  data: items).encode(for: request)
        }
    }
    
//    func fetchComments(_ request: Request) throws -> Future<Response> {
//        guard let apiURL = (Constants.GitHubAPIPrefix + Constants.GitHubAPI.Comments).convertToURL() else {
//            return try ResponseJSON<Empty>(status: .error,
//                                           message: "API URL has broken.").encode(for: request)
//        }
//        
//        let authHeader: HTTPHeaders = ["Authorization" : "token \(Constants.GitHubAPIToken)"]
//        let apiRequest = HTTPRequest(method: .GET, url: apiURL, headers: authHeader)
//        let getRequest = Request(http: apiRequest, using: request)
//        
//        return try request.client().send(getRequest).flatMap(to: Response.self) { response in
//            let data = response.http.body.utf8.convertToData()
//            let decoder = JSONDecoder()
//            let items = try decoder.decode([Comment].self, from: data)
//            
//            return try ResponseJSON<[Comment]>(status: .ok,
//                                               data: items).encode(for: request)
//        }
//    }
}
