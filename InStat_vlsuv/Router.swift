//
//  Router.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import UIKit

protocol BaseRouterProtocol {
    var navigationController: UINavigationController? { get }
    var assemblyBuilder: AssemblyModuleBuilderType? { get }
}

protocol RouterProtocol: BaseRouterProtocol {
    func initialViewController()
    func showVideoList()
    func showMatchVideo(with url: URL)
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyModuleBuilderType?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyModuleBuilderType) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        guard let navigationController = navigationController, let matchStateViewController = assemblyBuilder?.createMatchStateModule(router: self) else { return }
        
        navigationController.viewControllers = [matchStateViewController]
    }
    
    func showVideoList() {
        guard let navigationController = navigationController, let matchVideoListViewController = assemblyBuilder?.createMatchVideoListModule(router: self) else { return }
        
        navigationController.pushViewController(matchVideoListViewController, animated: true)
    }
    
    func showMatchVideo(with url: URL) {
        guard let navigationController = navigationController, let avpPlayerViewController = assemblyBuilder?.createAVPPlayer(with: url) else { return }
        
        navigationController.present(avpPlayerViewController, animated: true)
    }
}
