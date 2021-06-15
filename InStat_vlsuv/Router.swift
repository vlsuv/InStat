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
}
