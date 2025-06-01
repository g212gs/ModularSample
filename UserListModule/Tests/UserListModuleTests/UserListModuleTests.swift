import Testing
@testable import UserListModule
@testable import CoreModule

struct UserListModuleTests {
    
    @Test
    func testUserListServiceData() async {
        
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
    func testFailedUserServiceData() async {
        
        let apiClient = MockFailureAPIClient()
        let userService = UserListService(apiClient: apiClient)
        do {
            let _ = try await userService.fetchUsers()
            #expect(Bool(false), "Expected failure but succeeded")
        } catch {
            #expect(true, "Checked for failure correctly")
        }
    }
    
    @MainActor
    @Test
    func testUserListViewModel() async {
        
        let apiClient = MockAPIClient()
        let userListService = UserListService(apiClient: apiClient)
        let userListVM: UserListViewModel = UserListViewModel(userList: userListService)
        
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
    func testUserListViewModelEmpty() async {
        
        let userListService = EmptyUserListService()
        let userListVM: UserListViewModel = UserListViewModel(userList: userListService)
        
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
    func testUserListViewModelFailure() async {
        
        let apiClient = MockFailureAPIClient()
        let userListService = UserListService(apiClient: apiClient)
        let userListVM: UserListViewModel = UserListViewModel(userList: userListService)
        
        do {
            try await userListVM.fetchUsers()
            #expect(userListVM.users.isEmpty == true, "Successfully check failure API Call")
            #expect(userListVM.state.rawValue == 3, "Successfully Chceck API failure")
        } catch {
            #expect(Bool(false), "Error thrown as we got wrong output")
        }
        
    }
}
