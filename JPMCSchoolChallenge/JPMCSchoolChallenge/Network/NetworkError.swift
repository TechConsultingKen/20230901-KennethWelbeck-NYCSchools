//
//  NetworkError.swift
//  JPMCSchoolChallenge
//
//  Created by Kenneth Welbeck on 8/30/23.
//

import Foundation

enum NetworkError:Error{
    case invalidURLError
    case dataNotFoundError
    case parsingError
    case responseError
}

extension NetworkError:LocalizedError,Equatable{
    var errorDescription: String?{
        let myError:String
        switch self{
            
        case .invalidURLError:
            myError = NSLocalizedString("API Endpoint was wrong", comment: "invalidURLError")
        case .dataNotFoundError:
            myError = NSLocalizedString("API Failed to respond", comment: "dataNotFoundError")
        case .parsingError:
            myError = NSLocalizedString("API parsing received improperly", comment: "parsingError")
        case .responseError:
            myError = NSLocalizedString("Got invalid status code.", comment: "responseError")
        }
        return myError
    }
}
