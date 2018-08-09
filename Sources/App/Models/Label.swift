//
//  Label.swift
//  App
//
//  Created by kingcos on 2018/8/7.
//

import Foundation
import Vapor

struct LabelsResponse: Content {
    var labels: [Label]?
}

struct Label: Content {
    var name: String?
}
