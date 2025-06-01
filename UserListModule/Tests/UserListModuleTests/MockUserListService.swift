//
//  MockUserListService.swift
//  UserListModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

@testable import CoreModule
import Foundation
@testable import NetworkModule
@testable import UserListModule

struct MockUserListService: UserListProtocol {
    func fetchUsers() async throws -> [CoreModule.User] {
        var users: [CoreModule.User] = []
        for i in 1 ... 10 {
            var user = CoreModule.User.preview
            user.id = i
            users.append(user)
        }
        return users
    }
}

struct EmptyUserListService: UserListProtocol {
    func fetchUsers() async throws -> [CoreModule.User] {
        return []
    }
}

struct FailiureUserListService: UserListProtocol {
    let apiClient: APIClientProtocol

    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    @MainActor
    public func fetchUsers() async throws -> [User] {
        guard let apiURL = URL(string: AppConstants.apiBaseURL) else {
            throw URLError(.badURL)
        }

        var urlRequest = URLRequest(url: apiURL)
        urlRequest.httpMethod = "GET"
        urlRequest.httpBody = nil
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]

        return try await apiClient.request(urlRequest)
    }
}
