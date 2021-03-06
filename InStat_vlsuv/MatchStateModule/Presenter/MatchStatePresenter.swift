//
//  MatchStatePresenter.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import Foundation

protocol MatchStateViewType: class {
    func succes(with match: Match)
    func failure()
}

protocol MatchStatePresenterType {
    var inputs: MatchStatePresenterInputs { get }
    var outputs: MatchStatePresenterOutputs { get }
}

protocol MatchStatePresenterInputs {
    func didTapRefresh()
    func didTapVideo()
}

protocol MatchStatePresenterOutputs {
    
}

class MatchStatePresenter: MatchStatePresenterType, MatchStatePresenterInputs, MatchStatePresenterOutputs {
    
    // MARK: - Properties
    var inputs: MatchStatePresenterInputs { return self }
    var outputs: MatchStatePresenterOutputs { return self }
    
    weak private var view: MatchStateViewType?
    private let router: RouterProtocol
    private let apiService: APIServiceProtocol
    
    // MARK: - Init
    init(view: MatchStateViewType, router: RouterProtocol, apiService: APIServiceProtocol) {
        self.view = view
        self.router = router
        self.apiService = apiService
        
        getMatchInfo()
    }
    
    // MARK: - Inputs Handlers
    func didTapRefresh() {
        getMatchInfo()
    }
    
    func didTapVideo() {
        router.showVideoList()
    }
    
    // MARK: - Outputs Handlers
    
}

// MARK: - API Handlers
extension MatchStatePresenter {
    private func getMatchInfo() {
        apiService.getMatchInfo { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let match):
                    self?.view?.succes(with: match)
                case .failure(let error):
                    self?.router.showError(error)
                    self?.view?.failure()
                }
            }
        }
    }
}
