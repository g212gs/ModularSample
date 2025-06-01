//
//  UserListScreen.swift
//  UserListModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import SwiftUI
import UserDetailModule

public struct UserListScreen: View {
    
    @State var viewModel: UserListViewModel
    
    public init(viewModel: UserListViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    getUserListView(withSize: geometry.size)
                }
                .background(Color.clear)
                .task {
                    try? await viewModel.fetchUsers()
                }
                .navigationTitle("Users")
            }
        }
    }
    
    
    @ViewBuilder
    func getUserListView(withSize size: CGSize) -> some View {
        switch viewModel.state {
        case .loading:
            ProgressView {
                Text( "Loading..." )
            }
            .frame(width: size.width ,height: size.height)
        case .error(let error):
            Text("Error: \(error.localizedDescription)")
                .foregroundStyle(.red)
                .padding(.horizontal)
                .frame(width: size.width ,height: size.height)
        case .loaded:
            if viewModel.users.isEmpty {
                ContentUnavailableView("No users found",
                                       systemImage: "person.2.slash.fill")
                .frame(width: size.width ,height: size.height)
            } else {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users, id: \.id) { user in
                        NavigationLink(destination: UserDetailScreen(user: user) ) {
                            UserListRowView(user: user)
                        }
                    }
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
