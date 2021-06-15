//
//  MatchStateViewController.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import UIKit

class MatchStateViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: MatchStatePresenterType?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }


}

extension MatchStateViewController: MatchStateViewType {
    func succes() {
    }
    
    func failure(with error: Error) {
    }
}

