//
//  ToDo.swift
//  ToDo
//
//  Created by Claudia Maciel on 2/27/21.
//

import Foundation

struct ToDos: Codable {
    var items: [ToDo]
}

struct ToDo: Codable {
    var item: String
    var priority: Int
}


