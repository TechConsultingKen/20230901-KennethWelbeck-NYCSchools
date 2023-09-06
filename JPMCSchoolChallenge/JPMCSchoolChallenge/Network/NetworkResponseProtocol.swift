//
//  NetworkableProtocol.swift
//  JPMCSchoolChallenge
//
//  Created by Kenneth Welbeck on 8/30/23.
//

import Foundation

protocol NetworkableProtocol{
    func getDataFromAPI(urlRequest:Requestable) async throws -> Data
}
