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
        router.group("perspective") { router in
            router.get("labels", use: fetchLables)
            router.get("issues", use: fetchIssues)
            router.get("comments", use: fetchComments)
        }
    }
}

extension PerspectiveController {
    func fetchLables(_ request: Request) throws -> Future<Response> {
        guard let apiURL = (Constants.GitHubAPIPrefix + Constants.GitHubAPI.Labels).convertToURL() else {
            return try ResponseJSON<Empty>(status: .error,
                                           message: "API URL has broken.").encode(for: request)
        }
        
        let authHeader: HTTPHeaders = ["Authorization" : "token \(Constants.GitHubAPIToken)"]
        let apiRequest = HTTPRequest(method: .GET, url: apiURL, headers: authHeader)
        let getRequest = Request(http: apiRequest, using: request)
        
        return try request.client().send(getRequest).flatMap(to: Response.self) { response in
            let data = response.http.body.utf8.convertToData()
            let items = try JSONDecoder().decode([Label].self, from: data)
            
            return try ResponseJSON<[Label]>(status: .ok,
                                             data: items).encode(for: request)
        }
    }
    
    func fetchIssues(_ request: Request) throws -> Future<Response> {
        guard let apiURL = (Constants.GitHubAPIPrefix + Constants.GitHubAPI.Issues).convertToURL() else {
            return try ResponseJSON<Empty>(status: .error,
                                           message: "API URL has broken.").encode(for: request)
        }
        
        let authHeader: HTTPHeaders = ["Authorization" : "token \(Constants.GitHubAPIToken)"]
        let apiRequest = HTTPRequest(method: .GET, url: apiURL, headers: authHeader)
        let getRequest = Request(http: apiRequest, using: request)
        
        return try request.client().send(getRequest).flatMap(to: Response.self) { response in
            let data = response.http.body.utf8.convertToData()
            let items = try JSONDecoder().decode([Issue].self, from: data)
            
            return try ResponseJSON<[Issue]>(status: .ok,
                                             data: items).encode(for: request)
        }
    }
    
    func fetchComments(_ request: Request) throws -> Future<Response> {
        guard let apiURL = (Constants.GitHubAPIPrefix + Constants.GitHubAPI.Comments).convertToURL() else {
            return try ResponseJSON<Empty>(status: .error,
                                           message: "API URL has broken.").encode(for: request)
        }
        
        let authHeader: HTTPHeaders = ["Authorization" : "token \(Constants.GitHubAPIToken)"]
        let apiRequest = HTTPRequest(method: .GET, url: apiURL, headers: authHeader)
        let getRequest = Request(http: apiRequest, using: request)
        
        return try request.client().send(getRequest).flatMap(to: Response.self) { response in
            let data = response.http.body.utf8.convertToData()
            let decoder = JSONDecoder()
            let items = try decoder.decode([Comment].self, from: data)
            
            return try ResponseJSON<[Comment]>(status: .ok,
                                               data: items).encode(for: request)
        }
    }
}
