//
//  NetworkManager.swift
//  JPMCSchoolChallenge
//
//  Created by Kenneth Welbeck on 8/30/23.
//


import Foundation

class NetworkManager:NSObject, NetworkableProtocol{
    var urlSession: NetworkManagerSessionable
    
    init(urlSession: NetworkManagerSessionable = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func getDataFromAPI(urlRequest: Requestable) async throws -> Data{
        
        do{
            guard let request = urlRequest.createURLRequest() else{
                throw NetworkError.invalidURLError
            }

            let (data,response) = try await urlSession.data(for: request, delegate: nil)
            if response.isValidURLResponse(){
                return data
            } else {
                throw NetworkError.responseError
            }
        } catch{
            print(error.localizedDescription)
            throw error
        }
    }
}

extension URLResponse{
    func isValidURLResponse() -> Bool{
        guard let response = self as? HTTPURLResponse else {return false}
        switch response.statusCode {
        case 200...299:
            return true
        case 400...499:
            return false
        default:
            return false
        }
    }
}

