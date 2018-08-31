//
//  User.swift
//  App
//
//  Created by kingcos on 2018/9/1.
//

import Foundation
import Vapor

struct Repo: Content {
    var name: String?
    var description: String?
    var stargazers_count: Int?
    var language: String?
    var forks: Int?
}
