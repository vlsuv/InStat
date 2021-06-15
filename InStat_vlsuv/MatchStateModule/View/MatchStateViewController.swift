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
    var contentView: MatchContentView?
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        setupContentView()
        setupTargets()
        
        contentView?.activityIndicator.startAnimating()
    }
    
    // MARK: - Targets
    @objc private func didTapRefreshButton() {
        clearContentView()
        contentView?.activityIndicator.startAnimating()
        presenter?.inputs.didTapRefresh()
    }
    
    @objc private func didTapVideoButton() {
        presenter?.inputs.didTapVideo()
    }
    
    // MARK: - Handler
    private func configureNavigationController() {
        let refreshButton = UIBarButtonItem(image: Image.refresh, style: .plain, target: self, action: #selector(didTapRefreshButton))
        navigationItem.rightBarButtonItem = refreshButton
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Details"
    }
    
    private func setupContentView() {
        contentView = MatchContentView()
        
        view.addSubview(contentView!)
        
        contentView?.anchor(top: view.topAnchor,
                            left: view.leftAnchor,
                            right: view.rightAnchor,
                            bottom: view.bottomAnchor)
    }
    
    private func setupTargets() {
        contentView?.videoButton.addTarget(self, action: #selector(didTapVideoButton), for: .touchUpInside)
    }
    
}

// MARK: - MatchStateViewType
extension MatchStateViewController: MatchStateViewType {
    func succes(with match: Match) {
        updateContentView(with: match)
    }
    
    func failure(with error: Error) {
    }
}

extension MatchStateViewController {
    private func clearContentView() {
        contentView?.tournamentNameLabel.text = ""
        contentView?.matchDateLabel.text = ""
        contentView?.firstTeamNameLabel.text = ""
        contentView?.secondTeamNameLabel.text = ""
        contentView?.matchScoreLabel.text = ""
        contentView?.videoButton.isHidden = true
    }
    
    private func updateContentView(with match: Match) {
        contentView?.activityIndicator.stopAnimating()
        
        contentView?.tournamentNameLabel.text = match.tournament.name_eng
        contentView?.matchDateLabel.text = match.date
        
        let firstTeam = match.team1
        let secondTeam = match.team2
        
        contentView?.firstTeamNameLabel.text = firstTeam.name_eng
        contentView?.secondTeamNameLabel.text = secondTeam.name_eng
        contentView?.matchScoreLabel.text = "\(firstTeam.score):\(secondTeam.score)"
        
        contentView?.videoButton.isHidden = false
    }
}

