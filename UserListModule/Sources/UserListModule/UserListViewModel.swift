//
//  UserListViewModel.swift
//  UserListModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import SwiftUI
import CoreModule
import NetworkModule
import Combine

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
    var users: [User] = [] //This is master record
    var filteredUsers: [User] = []
    var state: UserListViewState = .idle
    
    var searchText: String = "" {
        didSet {
            searchTextSubject.send(searchText)
        }
    }
    
    // Helpful for Combine implementation
    private var cancellables = Set<AnyCancellable>()
    private let searchTextSubject = CurrentValueSubject<String, Never>("")
    
    
    public init(userList: UserListProtocol = UserListService(apiClient: APIClient())) {
        self.userList = userList
        
        searchTextSubject
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.filterUsers(by: query)
            }
            .store(in: &cancellables)
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
            self.filteredUsers = users
            state = .loaded(users)
        } catch {
            state = .error(error)
        }
    }
    
    func filterUsers(by query: String) {
        guard !query.isEmpty else {
            filteredUsers = users
            return
        }
        filteredUsers = users.filter {
            $0.name.lowercased().contains(query.lowercased()) ||
            $0.email.lowercased().contains(query.lowercased())
        }
    }
}
