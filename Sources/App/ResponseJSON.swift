//
//  ResponseJSON.swift
//  App
//
//  Created by kingcos on 2018/8/8.
//

import Foundation
import Vapor

struct Empty: Content { }

enum ResponseStatus: Int, Content {
    case ok = 0
    case error = -1
    
    var description: String {
        switch self {
        case .ok:
            return "Success"
        case .error:
            return "Failure"
        }
    }
}

struct ResponseJSON<T: Content> : Content {
    private var status: ResponseStatus
    private var message: String
    private var data: T?
    
    init(status: ResponseStatus = .ok,
         message: String = ResponseStatus.ok.description) {
        self.status = status
        self.message = message
        self.data = nil
    }
    
    init(status: ResponseStatus = .ok,
         message: String = ResponseStatus.ok.description,
         data: T?) {
        self.status = status
        self.message = message
        self.data = data
    }
}
