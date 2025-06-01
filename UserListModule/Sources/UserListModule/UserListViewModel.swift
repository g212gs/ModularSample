//
//  UserListViewModel.swift
//  UserListModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import SwiftUI
import CoreModule
import NetworkModule

enum UserListViewState {
    case idle
    case loading
    case loaded([User])
    case error(Error)
    
    var rawValue: Int {
        switch self {
        case .idle:
            return 0
        case .loading:
            return 1
        case .loaded:
            return 2
        case .error:
            return 3
        }
    }
}

@Observable
public class UserListViewModel {
    
    let userList: UserListProtocol
    var users: [User] = []
    var state: UserListViewState = .idle
    
    public init(userList: UserListProtocol = UserListService(apiClient: APIClient())) {
        self.userList = userList
    }
    
    @MainActor
    func fetchUsers() async throws {
        // For sample purpose - call only single time
        if !users.isEmpty {
            return
        }
        
        state = .loading
        do {
            let users = try await userList.fetchUsers()
            self.users = users
            state = .loaded(users)
        } catch {
            state = .error(error)
        }
    }
}
