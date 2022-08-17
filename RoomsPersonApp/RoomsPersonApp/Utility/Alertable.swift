//
//  Alertable.swift
//  RoomsPersonApp
//
//  Created by Donald Daniels on 15/08/22.
//

import UIKit

// swiftlint:disable line_length
public protocol Alertable {}
public extension Alertable where Self: UIViewController {
    func showAlert(title: String = NSLocalizedString("alert", comment: ""), message: String, preferredStyle: UIAlertController.Style = .alert, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: completion)
    }
}
