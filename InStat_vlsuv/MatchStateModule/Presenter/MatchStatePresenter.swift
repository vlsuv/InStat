//
//  MatchStatePresenter.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import Foundation

protocol MatchStateViewType {
    func succes()
    func failure(with error: Error)
}

protocol MatchStatePresenterType {
    var inputs: MatchStatePresenterInputs { get }
    var outputs: MatchStatePresenterOutputs { get }
}

protocol MatchStatePresenterInputs {
    
}

protocol MatchStatePresenterOutputs {
    
}

class MatchStatePresenter: MatchStatePresenterType, MatchStatePresenterInputs, MatchStatePresenterOutputs {
    
    // MARK: - Properties
    var inputs: MatchStatePresenterInputs { return self }
    var outputs: MatchStatePresenterOutputs { return self }
    
    private let view: MatchStateViewType
    private let router: RouterProtocol
    private let apiService: APIServiceProtocol
    
    // MARK: - Init
    init(view: MatchStateViewType, router: RouterProtocol, apiService: APIServiceProtocol) {
        self.view = view
        self.router = router
        self.apiService = apiService
        
        apiService.getMatchInfo { result in
            switch result {
            case .success(let match):
                print("succes: \(match)")
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Inputs Handlers
    
    // MARK: - Outputs Handlers
    
}
