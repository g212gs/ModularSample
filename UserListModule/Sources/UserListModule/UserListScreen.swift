//
//  UserListScreen.swift
//  UserListModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import CoreModule
import SwiftUI
import UserDetailModule

public struct UserListScreen: View {
    @State var viewModel: UserListViewModel
    
    public init(viewModel: UserListViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationStack {
            VStack {
                getUserListView()
            }
            .frame(height: .infinity)
            .background(Color.clear)
            .task {
                try? await viewModel.fetchUsers()
            }
            .navigationTitle("Users")
        }
    }
    
    @ViewBuilder
    func getUserListView() -> some View {
        switch viewModel.state {
        case .loading:
            ProgressView {
                Text(AppConstants.loadingText)
            }
        case .error(let error):
            Text("Error: \(error.localizedDescription)")
                .foregroundStyle(.red)
                .padding(.horizontal)
        case .loaded:
            if viewModel.users.isEmpty {
                ContentUnavailableView(AppConstants.noUsersFound,
                                       systemImage: "person.2.slash.fill")
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.users, id: \.id) { user in
                            NavigationLink(destination: UserDetailScreen(user: user) ) {
                                UserListRowView(user: user)
                            }
                        }
                    }
                    .searchable(text: $viewModel.searchText, prompt: Text(AppConstants.placeholderSearchUsers))
                }
            }
        case .idle:
            EmptyView()
        }
    }
}

#Preview {
    let userListVM = UserListViewModel()
    UserListScreen(viewModel: userListVM)
}
