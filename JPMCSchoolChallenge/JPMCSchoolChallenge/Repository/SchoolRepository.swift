//
//  SchoolRepository.swift
//  JPMCSchoolChallenge
//
//  Created by Kenneth Welbeck on 8/30/23.
//

import Foundation


protocol SchoolRepositoryAction{
    func getListOfUser() async throws -> [School]
}

class SchoolRepository{
    var networkManager: NetworkableProtocol
    
    init(networkManager:NetworkableProtocol){
        self.networkManager = networkManager
    }
}

extension SchoolRepository:SchoolRepositoryAction{
    func getListOfUser() async throws -> [School] {
        do {
            let schoolRequest = SchoolRequest(path: APIEndpoint.schoolListEndpoint)
            let data = try await networkManager.getDataFromAPI(urlRequest: schoolRequest)
            let results = try JSONDecoder().decode([School].self, from: data)
            return results
        } catch {
            throw error
        }
    }
}
