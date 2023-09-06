//
//  NetworkManagerSessionable.swift
//  JPMCSchoolChallenge
//
//  Created by Kenneth Welbeck on 8/30/23.
//

import Foundation

protocol NetworkManagerSessionable{
    func data(for request: URLRequest, delegate: URLSessionDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession:NetworkManagerSessionable{
    func data(for request: URLRequest, delegate: URLSessionDelegate?) async throws -> (Data, URLResponse) {
        try await self.data(for: request)
    }
}
