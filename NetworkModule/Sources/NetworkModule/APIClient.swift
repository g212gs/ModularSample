//
//  APIClient.swift
//  NetworkModule
//
//  Created by Gaurang Lathiya on 01/06/25.
//

import Foundation

public protocol APIClientProtocol: Sendable {
    func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T
}

public struct APIClient: APIClientProtocol {
    public init() {}
    
    public func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        debugPrint("[API] - url: \(urlRequest.url?.absoluteString ?? "N/A")")
        debugPrint("[API] - httpMethod: \(urlRequest.httpMethod ?? "N/A")")
        debugPrint("[API] - headers: \(urlRequest.allHTTPHeaderFields ?? [:])")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200 ..< 300 ~= statusCode else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
