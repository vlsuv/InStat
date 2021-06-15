//
//  AssemblyModuleBuilder.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import UIKit

protocol AssemblyModuleBuilderType {
    func createMatchStateModule(router: RouterProtocol) -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyModuleBuilderType {
    func createMatchStateModule(router: RouterProtocol) -> UIViewController {
        let view = MatchStateViewController()
        let apiService = APIService()
        
        let presenter = MatchStatePresenter(view: view, router: router, apiService: apiService)
        view.presenter = presenter
        
        return view
    }
}
