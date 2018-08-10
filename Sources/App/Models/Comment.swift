//
//  Comment.swift
//  App
//
//  Created by kingcos on 2018/8/11.
//

import Foundation
import Vapor

struct Comment: Content {
    var user: User?
    var issue_url: String?
    var created_at: String?
    var body: String?
}

struct User: Content {
    var login: String?
    var avatar_url: String?
}
