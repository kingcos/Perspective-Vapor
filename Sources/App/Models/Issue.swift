//
//  Issue.swift
//  App
//
//  Created by kingcos on 2018/8/11.
//

import Foundation
import Vapor

struct Issue: Content {
    var number: Int?
    var title: String?
    var labels: [Label]?
    var comments: Int?
    var created_at: String?
    var body: String?
}
