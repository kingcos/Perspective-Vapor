//
//  LabelSQLModel.swift
//  App
//
//  Created by kingcos on 2018/8/11.
//

import Vapor
import FluentPostgreSQL

class LabelSQLModel: PostgreSQLModel {
    var id: Int?
    var name: String
    
    init(_ id: Int?  = nil,
         _ name: String) {
        self.id = id
        self.name = name
    }
}
