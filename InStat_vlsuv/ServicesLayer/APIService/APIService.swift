//
//  APIService.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case IncorrentRequestError
}

protocol APIServiceProtocol: NetworkServiceProtocol {
    func getMatchInfo(completionHandler: @escaping (Result<Match, Error>) -> ())
    func getMatchVideoURLs(completionHandler: @escaping (Result<[MatchVideo], Error>) -> ())
}

class APIService: APIServiceProtocol {
    var sessionConfiguration: URLSessionConfiguration
    lazy var session: URLSession = {
        return URLSession(configuration: sessionConfiguration)
    }()
    
    init(sessionConfiguration: URLSessionConfiguration) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    convenience init() {
        self.init(sessionConfiguration: URLSessionConfiguration.default)
    }
}

extension APIService {
    func getMatchInfo(completionHandler: @escaping (Result<Match, Error>) -> ()) {
        guard let request = APIServiceEndpoint.matchInfo.request else {
            completionHandler(.failure(APIServiceError.IncorrentRequestError))
            return
        }
        
        fetch(request: request, parse: { data -> Match? in
            
            guard let decodeMatch = try? JSONDecoder().decode(Match.self, from: data) else { return nil
            }
            
            return decodeMatch
        }) { result in
            switch result {
            case .Succes(let match):
                completionHandler(.success(match))
            case .Failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    func getMatchVideoURLs(completionHandler: @escaping (Result<[MatchVideo], Error>) -> ()) {
        guard let request = APIServiceEndpoint.viewURL.request else {
            completionHandler(.failure(APIServiceError.IncorrentRequestError))
            return
        }
        
        fetch(request: request, parse: { (data) -> ([MatchVideo])? in
            
            guard let decodeMatchVideos = try? JSONDecoder().decode([MatchVideo].self, from: data) else {
                return nil
            }
            
            return decodeMatchVideos
        }) { (result) in
            switch result {
                
            case .Succes(let matchVideos):
                completionHandler(.success(matchVideos))
            case .Failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
