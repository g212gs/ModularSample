//
//  MockAPIClient.swift
//  UserListModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import Foundation
@testable import NetworkModule
@testable import CoreModule

public struct MockAPIClient: APIClientProtocol {
    
    public func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        var users: [CoreModule.User] = []
        for i in 1...10 {
            var user = CoreModule.User.preview
            user.id = i
            users.append(user)
        }
        return users as! T
    }
}


public struct MockFailureAPIClient: APIClientProtocol {
    
    public func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        throw URLError(.badServerResponse)
    }
}


