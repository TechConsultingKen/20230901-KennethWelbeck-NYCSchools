//
//  Request.swift
//  JPMCSchoolChallenge
//
//  Created by Kenneth Welbeck on 8/30/23.
//

import Foundation

protocol Requestable{
    var baseURL:String{get}
    var path:String{get}
    var type: String?{get set}
    var header: [String:String]?{get set}
    var params: [String:String]{get set}
    var body:Data? {get set}
    func createURLRequest() -> URLRequest?
}


    
extension Requestable{
    var baseURL:String {
        return APIEndpoint.baseURL
    }
    var type: String?{
        get {
            return ""
        } set{}
    }
    var header: [String:String]?{
        get {
            return [:]
        } set{}
    }
    var params: [String:String]{
        get {
            return [:]
        } set {}
    }
    var body: Data?{
        get{
            return "BAD".data(using: String.Encoding.utf8)
        } set{}
    }
    
    func createURLRequest() -> URLRequest?{
        guard baseURL.count > 0, path.count > 0 else {return nil}
        var urlComponents = URLComponents(string: baseURL + path)
        var queryItems:[URLQueryItem] = []
        for(key,value) in params{
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {return nil}
        
        switch type {
        case "POST":
            var urlRequest = URLRequest(url:url)
            urlRequest.httpMethod = type
            urlRequest.setValue(header?.first?.value, forHTTPHeaderField: header?.first?.key ?? "")
            urlRequest.httpBody = body
            return urlRequest
        case "PUT":
            var urlRequest = URLRequest(url:url)
            urlRequest.httpMethod = type
            urlRequest.setValue(header?.first?.value, forHTTPHeaderField: header?.first?.key ?? "")
            urlRequest.httpBody = body
            return urlRequest
        case "PATCH":
            var urlRequest = URLRequest(url:url)
            urlRequest.httpMethod = type
            urlRequest.setValue(header?.first?.value, forHTTPHeaderField: header?.first?.key ?? "")
            urlRequest.httpBody = body
            return urlRequest
        case "DELETE":
            return URLRequest(url:url)
        default:
            return URLRequest(url:url)
        }
    }
}

enum MethodType:String{
    case POST = "POST"
    case GET = "GET"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
}
