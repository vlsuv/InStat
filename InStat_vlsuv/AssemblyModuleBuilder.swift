//
//  AssemblyModuleBuilder.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import UIKit
import AVKit

protocol AssemblyModuleBuilderType {
    func createMatchStateModule(router: RouterProtocol) -> UIViewController
    func createMatchVideoListModule(router: RouterProtocol) -> UIViewController
    func createAVPPlayer(with url: URL) -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyModuleBuilderType {
    func createMatchStateModule(router: RouterProtocol) -> UIViewController {
        let view = MatchStateViewController()
        let apiService = APIService()
        
        let presenter = MatchStatePresenter(view: view, router: router, apiService: apiService)
        view.presenter = presenter
        
        return view
    }
    
    func createMatchVideoListModule(router: RouterProtocol) -> UIViewController {
        let view = MatchVideoListViewController()
        let apiService = APIService()
        
        let presenter = MatchVideoListPresenter(view: view, router: router, apiService: apiService)
        view.presenter = presenter
        
        return view
    }
    
    func createAVPPlayer(with url: URL) -> UIViewController {
        let player = AVPlayer(url: url)
        
        let view = AVPlayerViewController()
        view.player = player
        
        return view
    }
}
