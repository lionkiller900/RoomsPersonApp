//
//  Storyboardable.swift
//  DirectoryApp
//
//  Created by Donald Daniels on 15/08/22.
//

import Foundation
import UIKit
// swiftlint:disable line_length

protocol Storyboardable: AnyObject {
    static var viewControllerName: String { get }
}
extension Storyboardable where Self: UIViewController {
    static var viewControllerName: String {
        return String(describing: self)
    }
    static func storyboardViewController() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName) as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(viewControllerName)")
        }
        return viewController
    }
}
extension UIViewController: Storyboardable { }
