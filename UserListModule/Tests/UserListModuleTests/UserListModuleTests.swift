@testable import CoreModule
import Testing
@testable import UserListModule

struct UserListModuleTests {
    @Test
    func userListServiceData() async {
        let apiClient = MockAPIClient()
        let userService = UserListService(apiClient: apiClient)
        do {
            let userList: [CoreModule.User] = try await userService.fetchUsers()
            #expect(userList.count == 10, "Got perfect output")
        } catch {
            #expect(Bool(false), "Error thrown as we got wrong output")
        }
    }
    
    @Test
    func failedUserServiceData() async {
        let apiClient = MockFailureAPIClient()
        let userService = UserListService(apiClient: apiClient)
        do {
            _ = try await userService.fetchUsers()
            #expect(Bool(false), "Expected failure but succeeded")
        } catch {
            #expect(true, "Checked for failure correctly")
        }
    }
    
    @MainActor
    @Test
    func userListViewModel() async {
        let apiClient = MockAPIClient()
        let userListService = UserListService(apiClient: apiClient)
        let userListVM = UserListViewModel(userList: userListService)
        
        do {
            try await userListVM.fetchUsers()
            #expect(userListVM.users.count == 10, "Got perfect output")
            #expect(userListVM.state.rawValue == 2, "Successfully load the data")
        } catch {
            #expect(Bool(false), "Error thrown as we got wrong output")
        }
    }
    
    @MainActor
    @Test
    func userListViewModelEmpty() async {
        let userListService = EmptyUserListService()
        let userListVM = UserListViewModel(userList: userListService)
        
        do {
            try await userListVM.fetchUsers()
            #expect(userListVM.users.isEmpty, "Successfully check empty list")
            #expect(userListVM.state.rawValue == 2, "Successfully load the data")
        } catch {
            #expect(Bool(false), "Error thrown as we got wrong output")
        }
    }
    
    @MainActor
    @Test
    func userListViewModelFailure() async {
        let apiClient = MockFailureAPIClient()
        let userListService = UserListService(apiClient: apiClient)
        let userListVM = UserListViewModel(userList: userListService)
        
        do {
            try await userListVM.fetchUsers()
            #expect(userListVM.users.isEmpty == true, "Successfully check failure API Call")
            #expect(userListVM.state.rawValue == 3, "Successfully Chceck API failure")
        } catch {
            #expect(Bool(false), "Error thrown as we got wrong output")
        }
    }
    
    @MainActor
    @Test
    func searchFunctionality() async {
        let apiClient = MockAPIClient()
        let userListService = UserListService(apiClient: apiClient)
        let userListVM = UserListViewModel(userList: userListService)
        
        do {
            try await userListVM.fetchUsers()
            userListVM.filterUsers(by: "The")
            #expect(userListVM.filteredUsers.count == 10, "It should give return 10 users")
        } catch {
            #expect(Bool(false), "Error thrown as we got wrong output")
        }
    }
    
    @MainActor
    @Test
    func emptySearchFunctionality() async {
        let apiClient = MockAPIClient()
        let userListService = UserListService(apiClient: apiClient)
        let userListVM = UserListViewModel(userList: userListService)
        
        do {
            try await userListVM.fetchUsers()
            userListVM.filterUsers(by: "")
            #expect(userListVM.filteredUsers.count == 10, "It should give return 10 users")
        } catch {
            #expect(Bool(false), "Error thrown as we got wrong output")
        }
    }
}
