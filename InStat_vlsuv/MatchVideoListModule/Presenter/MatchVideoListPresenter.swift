//
//  MatchVideoListPresenter.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 16.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import Foundation

protocol MatchVideoListViewType: class {
    func success()
    func failure(with error: Error)
}

protocol MatchVideoListPresenterType {
    var inputs: MatchVideoListPresenterInputs { get }
    var outputs: MatchVideoListPresenterOutputs { get }
}

protocol MatchVideoListPresenterInputs {
    func refreshVideoList()
    func didSelectVideo(at indexPath: IndexPath)
}

protocol MatchVideoListPresenterOutputs {
    var videos: [MatchVideo]? { get set }
}

class MatchVideoListPresenter: MatchVideoListPresenterType, MatchVideoListPresenterInputs, MatchVideoListPresenterOutputs{
    
    // MARK: - Properties
    var inputs: MatchVideoListPresenterInputs { return self }
    var outputs: MatchVideoListPresenterOutputs { return self }
    
    weak var view: MatchVideoListViewType?
    private let router: RouterProtocol
    private let apiService: APIServiceProtocol
    
    var videos: [MatchVideo]?
    
    // MARK: - Init
    init(view: MatchVideoListViewType, router: RouterProtocol, apiService: APIServiceProtocol) {
        self.view = view
        self.router = router
        self.apiService = apiService
    }
    
    deinit {
        print("Deinit: \(self)")
    }
    
    // MARK: - Handlers
    private func getMatchVideos() {
        apiService.getMatchVideoURLs { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let matchVideos):
                    self?.videos = matchVideos
                    self?.view?.success()
                case .failure(let error):
                    self?.view?.failure(with: error)
                }
            }
        }
    }
    
    // MARK: Inputs Handlers
    func refreshVideoList() {
        getMatchVideos()
    }
    
    func didSelectVideo(at indexPath: IndexPath) {
        guard let video = videos?[indexPath.row], let url = URL(string: video.url) else { return }
        
        router.showMatchVideo(with: url)
    }
}
