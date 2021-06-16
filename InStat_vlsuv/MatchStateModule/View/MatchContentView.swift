//
//  MatchContentView.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 15.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import UIKit

class MatchContentView: UIView {
    
    // MARK: - Properties
    var tournamentNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textColor = Color.black
        label.textAlignment = .left
        label.text = ""
        return label
    }()
    
    var matchDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.black
        label.textAlignment = .left
        label.text = ""
        return label
    }()
    
    var horizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.axis = .horizontal
        return stack
    }()
    
    var firstTeamNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = Color.black
        label.textAlignment = .center
        label.text = ""
        return label
    }()
    
    var secondTeamNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = Color.black
        label.textAlignment = .center
        label.text = ""
        return label
    }()
    
    var matchScoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.black
        label.textAlignment = .center
        label.text = ""
        return label
    }()
    
    var videoButton: UIButton = {
        let button = UIButton()
        let normalAttributedString = NSAttributedString(string: "Video List", attributes: [
            NSAttributedString.Key.foregroundColor: Color.white
        ])
        button.setAttributedTitle(normalAttributedString, for: .normal)
        button.backgroundColor = Color.black
        button.layer.cornerRadius = 10
        return button
    }()
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = Color.black
        return activityIndicator
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Color.white
        
        setupSubviews()
        setupConstaints()
        
        videoButton.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    private func setupConstaints() {
        tournamentNameLabel.anchor(top: safeAreaLayoutGuide.topAnchor,
                                   left: leftAnchor,
                                   right: rightAnchor,
                                   leftPadding: 18,
                                   rightPadding: 18,
                                   height: 34)
        
        matchDateLabel.anchor(top: tournamentNameLabel.bottomAnchor,
                              left: leftAnchor,
                              right: rightAnchor,
                              leftPadding: 18,
                              rightPadding: 18,
                              height: 34)
        
        horizontalStack.anchor(top: tournamentNameLabel.bottomAnchor,
                               left: leftAnchor,
                               right: rightAnchor,
                               bottom: centerYAnchor)
        
        videoButton.anchor(top: horizontalStack.bottomAnchor,
                           left: leftAnchor,
                           right: rightAnchor,
                           leftPadding: 30,
                           rightPadding: 30,
                           height: 54)
        
        activityIndicator.anchor(centerX: horizontalStack.centerXAnchor,
                                 centerY: horizontalStack.centerYAnchor)
    }
    
    private func setupSubviews() {
        [tournamentNameLabel, matchDateLabel, horizontalStack, videoButton, activityIndicator].forEach{ addSubview($0) }
        [firstTeamNameLabel, matchScoreLabel, secondTeamNameLabel].forEach { horizontalStack.addArrangedSubview($0) }
    }
}
