//
//  BaseViewController.swift
//  Swift Protocols
//
//  Created by mohamed  habib on 20/12/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
            ])
    }

    func presenActivity() {
        activityIndicator.startAnimating()
    }

    func dismissActivity() {
        activityIndicator.stopAnimating()
    }

    func present(_ error: Error) {
        let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
}
