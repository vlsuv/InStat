//
//  MatchVideoListViewController.swift
//  InStat_vlsuv
//
//  Created by vlsuv on 16.06.2021.
//  Copyright © 2021 vlsuv. All rights reserved.
//

import UIKit

class MatchVideoListViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: MatchVideoListPresenterType?
    
    private var tableView: UITableView!
    
    private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = Color.black
        return activityIndicator
    }()
    
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.white
        
        configureNavigationController()
        configureTableView()
        setupActivityIndicator()
        presenter?.inputs.refreshVideoList()
        
        activityIndicator.startAnimating()
    }
    
    deinit {
        print("Deinit: \(self)")
    }
    
    // MARK: - Handlers
    private func configureNavigationController() {
        navigationItem.title = "Videos"
    }
    
    private func configureTableView() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor,
                         bottom: view.bottomAnchor)
        
        tableView.backgroundColor = Color.white
        tableView.tableFooterView = UIView()
    }
    
    private func setupActivityIndicator() {
        view.addSubview(activityIndicator)
        activityIndicator.anchor(centerX: tableView.centerXAnchor, centerY: tableView.centerYAnchor)
    }
}

// MARK: - UITableViewDataSource
extension MatchVideoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.outputs.videos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let video = presenter?.outputs.videos?[indexPath.row] {
            cell.textLabel?.text = video.name
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MatchVideoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.inputs.didSelectVideo(at: indexPath)
    }
}

// MARK: - MatchVideoListViewType
extension MatchVideoListViewController: MatchVideoListViewType {
    func success() {
        activityIndicator.stopAnimating()
        tableView?.reloadData()
    }
    
    func failure(with error: Error) {
        activityIndicator.stopAnimating()
        print(error)
    }
}
