import Testing
import Foundation
@testable import NetworkModule

struct NetworkModuleTests {
    
    @Test
    func testSuccessCase() async {
        
        let url: String = "https://fake-json-api.mock.beeceptor.com/users"
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let apiClient = APIClient()
        
        do {
            let userList: [MockUser] = try await apiClient.request(urlRequest)
            #expect(userList.isEmpty == false, "Got perfect output")
        } catch {
            #expect(Bool(false), "Error thrown as we expect invalid model data")
        }
    }
    
    @Test
    func testWrongURL() async {
        
        let url: String = "https://jsonplaceholder.typicode"
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let apiClient = APIClient()
        
        do {
            let _: [MockUser] = try await apiClient.request(urlRequest)
            #expect(Bool(false), "Expected failure but succeeded")
        } catch {
            #expect(true, "Error thrown as we pass wrong url")
        }
    }
    
    @Test
    func testWrongResponseModel() async {
        
        let url: String = "https://fake-json-api.mock.beeceptor.com/users"
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let apiClient = APIClient()
        
        do {
            let _: [MockUserInvalidData] = try await apiClient.request(urlRequest)
            #expect(Bool(false), "Expected failure but succeeded")
        } catch {
            #expect(true, "Error thrown as we expect invalid model data")
        }
    }
    
    
}
