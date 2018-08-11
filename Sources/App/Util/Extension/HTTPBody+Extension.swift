//
//  HTTPBody+Extension.swift
//  App
//
//  Created by kingcos on 2018/8/10.
//

import Vapor

extension HTTPBody {
    var utf8: String {
        return String(data: data ?? Data(), encoding: .utf8) ?? "n/a"
    }
}
