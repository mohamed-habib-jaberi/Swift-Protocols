//
//  BaseViewControllerRefactor.swift
//  Swift Protocols
//
//  Created by mohamed  habib on 20/12/2020.
//  Copyright © 2020 mohamed  habib. All rights reserved.
//

import UIKit

protocol ActivityPresentable {
    func presentActivity()
    func dismissActivity()
}

extension ActivityPresentable where Self: UIViewController {
    func presentActivity() {
        if let activityIndicator = findActivity() {
            view.backgroundColor = .red
            activityIndicator.startAnimating()
        } else {
            let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
            activityIndicator.startAnimating()
            view.addSubview(activityIndicator)

            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
                ])
        }
    }

    func dismissActivity() {
        findActivity()?.stopAnimating()
    }

    func findActivity() -> UIActivityIndicatorView? {
        return view.subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }
}

/*
 do the same for error presenting logic.
 */

protocol ErrorPresentable {
    func present(_ error: Error)
}

extension ErrorPresentable where Self: UIViewController {
    func present(_ error: Error) {
        let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
        alert.addAction(.init(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
}
/*
 Now we have two reusable protocol types which respect the Single Responsibility Principle. We can add them as the extension to any ViewController which need this functionality. The nice thing is that we are adding the only extension which needed in concrete ViewController and not inherits all the stuff from the BaseViewController. Here is the usage example of these protocols.
 */

class BaseViewControllerRefactor: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .red
       presentActivity()
       stopActivity()
    }
    
    func stopActivity()  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.dismissActivity()
            self.view.backgroundColor = .yellow
        }
    }

}
extension BaseViewControllerRefactor: ActivityPresentable, ErrorPresentable {}
