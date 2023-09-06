//
//  SchoolViewModel.swift
//  JPMCSchoolChallenge
//
//  Created by Kenneth Welbeck on 8/30/23.
//

import Foundation

enum ViewStates{
    case loading
    case errorState
    case loaded
    case emptyView
}

@MainActor
class SchoolViewModel: ObservableObject {
    @Published var schoolList: [String:[School]] = [:]
    @Published var customError: NetworkError?
    @Published private(set) var viewState:ViewStates = .loaded
    
    var repository: SchoolRepositoryAction
    
    init(repository: SchoolRepositoryAction){
        self.repository = repository
    }
    
    func getSchoolListFromAPI(for schools: String = "Schools") async {
        viewState = .loading
        do {
            let httpResponse = try await self.repository.getListOfUser()
            self.schoolList[schools] = httpResponse
            if self.schoolList.isEmpty{
                self.viewState = .emptyView
            } else {
                viewState = .loaded
            }
        } catch let error {
            viewState = .errorState
            print(error.localizedDescription)
            
            switch error{
            case is DecodingError:
                customError = NetworkError.parsingError
            case is URLError:
                customError = NetworkError.invalidURLError
            case NetworkError.dataNotFoundError:
                customError = NetworkError.dataNotFoundError
            case NetworkError.responseError:
                customError = NetworkError.responseError
            case NetworkError.parsingError:
                customError = NetworkError.parsingError
            case NetworkError.invalidURLError:
                customError = NetworkError.invalidURLError
            default:
                customError = NetworkError.dataNotFoundError
            }
        }
    }
    
}
