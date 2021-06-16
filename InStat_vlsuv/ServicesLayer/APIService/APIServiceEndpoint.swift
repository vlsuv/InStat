//
//  APIServiceEndpoint.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import Foundation

enum APIServiceEndpoint {
    static let baseURL: URL = URL(string: "https://api.instat.tv/test")!
    
    case matchInfo
    case viewURL
    
    var path: String {
        switch self {
        case .matchInfo:
            return "/data"
        case .viewURL:
            return "/video-urls"
        }
    }
    
    var bodyParam: Data? {
        switch self {
        case .matchInfo:
            let param: [String: Any] = [ "proc": "get_match_info", "params": ["_p_sport": 1, "_p_match_id": 1724836]]
            guard let paramData = try? JSONSerialization.data(withJSONObject: param)  else { return nil }
            return paramData
        case .viewURL:
            let param: [String: Any] = ["match_id":1724836, "sport_id":1]
            guard let paramData = try? JSONSerialization.data(withJSONObject: param)  else { return nil }
            return paramData
        }
    }
    
    var method: String {
        switch self {
        case .matchInfo:
            return "POST"
        case .viewURL:
            return "POST"
        }
    }
    
    var header: [String: String]? {
        switch self {
        case .matchInfo:
            return ["Content-Type": "application/json"]
        case .viewURL:
            return ["Content-Type": "application/json"]
        }
    }
    
    var request: URLRequest? {
        switch self {
        case .matchInfo:
            let url =  APIServiceEndpoint.baseURL.appendingPathComponent(path)
            
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = header
            request.httpMethod = method
            request.httpBody = bodyParam
            
            return request
        case .viewURL:
            let url =  APIServiceEndpoint.baseURL.appendingPathComponent(path)
            
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = header
            request.httpMethod = method
            request.httpBody = bodyParam
            
            return request
        }
    }
}
