//
//  MockUser.swift
//  NetworkModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import Foundation

struct MockUser: Codable, Equatable {
    let id: Int
    let name: String
}

struct MockUserInvalidData: Codable, Equatable {
    let id: String
    let age: Int
}

