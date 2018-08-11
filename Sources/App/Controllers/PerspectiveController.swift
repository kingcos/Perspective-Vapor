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
            router.get("start", use: start)
            
//            router.get("labels", use: fetchLabels)
//            router.get("cancel", use: )
//            router.get("cancel", use: )
        }
    }
    
    
}

extension PerspectiveController {
    func start(_ request: Request) throws -> Future<Response> {
        guard timer == nil else {
            return try ResponseJSON<Empty>(status: .error,
                                           message: "Timer is running.").encode(for: request)
        }
        
        // Do sth...
        _ = try fetchLables(request)
        _ = try fetchIssues(request)
        _ = try fetchComments(request)
        
        return try ResponseJSON<Empty>(status: .ok,
                                       message: "Starting...").encode(for: request)
    }
}

extension PerspectiveController {
    func fetchLables(_ request: Request) throws -> Future<Response> {
        guard let apiURL = (Constants.GitHubAPIPrefix + Constants.GitHubAPI.Labels).convertToURL() else {
            return try ResponseJSON<Empty>(status: .error,
                                           message: "URL error.").encode(for: request)
        }
        
        let authHeader: HTTPHeaders = ["Authorization" : "token \(Constants.GitHubAPIToken)"]
        let apiRequest = HTTPRequest(method: .GET, url: apiURL, headers: authHeader)
        let getRequest = Request(http: apiRequest, using: request)
        
        return try request.client().send(getRequest).flatMap(to: Response.self) { response in
            let json = response.http.body.utf8
            let data = json.convertToData()
            let decoder = JSONDecoder()
            let item = try decoder.decode([Label].self, from: data)
            
            
            
            
            
            return try ResponseJSON<Empty>(status: .ok,
                                           message: "Starting...").encode(for: request)
        }
    }
    
    func fetchIssues(_ request: Request) throws -> Future<Response> {
        guard let apiURL = (Constants.GitHubAPIPrefix + Constants.GitHubAPI.Issues).convertToURL() else {
            return try ResponseJSON<Empty>(status: .error,
                                           message: "URL error.").encode(for: request)
        }
        
        let authHeader: HTTPHeaders = ["Authorization" : "token \(Constants.GitHubAPIToken)"]
        let apiRequest = HTTPRequest(method: .GET, url: apiURL, headers: authHeader)
        let getRequest = Request(http: apiRequest, using: request)
        
        return try request.client().send(getRequest).flatMap(to: Response.self) { response in
            let json = response.http.body.utf8
            let data = json.convertToData()
            let decoder = JSONDecoder()
            let item = try decoder.decode([Issue].self, from: data)
            print(item.count)
            return try ResponseJSON<Empty>(status: .ok,
                                           message: "Starting...").encode(for: request)
        }
    }
    
    func fetchComments(_ request: Request) throws -> Future<Response> {
        guard let apiURL = (Constants.GitHubAPIPrefix + Constants.GitHubAPI.Comments).convertToURL() else {
            return try ResponseJSON<Empty>(status: .error,
                                           message: "URL error.").encode(for: request)
        }
        
        let authHeader: HTTPHeaders = ["Authorization" : "token \(Constants.GitHubAPIToken)"]
        let apiRequest = HTTPRequest(method: .GET, url: apiURL, headers: authHeader)
        let getRequest = Request(http: apiRequest, using: request)
        
        return try request.client().send(getRequest).flatMap(to: Response.self) { response in
            let json = response.http.body.utf8
            let data = json.convertToData()
            let decoder = JSONDecoder()
            let item = try decoder.decode([Comment].self, from: data)
            print(item.count)
            return try ResponseJSON<Empty>(status: .ok,
                                           message: "Starting...").encode(for: request)
        }
    }
}
